-- Число строк




-- Начнем с оценки кардинальности в простом случае запроса без предикатов.
=> EXPLAIN SELECT * FROM flights;


-- Точное значение:

=> SELECT count(*) FROM flights;


-- Оптимизатор получает значение из pg_class:

=> SELECT reltuples, relpages FROM pg_class WHERE relname = 'flights';


-- Значение параметра, управляющего ориентиром статистики, по умолчанию равно 100:

=> SHOW default_statistics_target;

-- Поскольку при анализе таблицы учитывается 300*default_statistics_target строк, то оценки для относительно крупных таблиц могут не быть абсолютно точными.





-- Доля неопределенных значений


-- Часть рейсов еще не отправились, поэтому время вылета для них не определено:

=> EXPLAIN SELECT * FROM flights WHERE actual_departure IS NULL;


-- Точное значение:

=> SELECT count(*) FROM flights WHERE actual_departure IS NULL;


-- Оценка оптимизатора получена как общее число строк, умноженное на долю NULL-значений:

=> SELECT 214867 * null_frac FROM pg_stats
WHERE tablename = 'flights' AND attname = 'actual_departure';






-- Наиболее частые значения

-- Для эксперимента ограничим размер списка наиболее частых значений (который по умолчанию определяется параметром default_statistics_target) на уровне столбца:

=> ALTER TABLE flights ALTER COLUMN arrival_airport SET STATISTICS 10;

=> ANALYZE flights;

-- Если значение попало в список наиболее частых, селективность можно узнать непосредственно из статистики. Пример (Шереметьево):

=> EXPLAIN SELECT * FROM flights WHERE arrival_airport = 'SVO';


-- Точное значение:

=> SELECT count(*) FROM flights WHERE arrival_airport = 'SVO';

-- Вот как выглядит список наиболее частых значений и частота их встречаемости:

=> SELECT most_common_vals, most_common_freqs FROM pg_stats
WHERE tablename = 'flights' AND attname = 'arrival_airport' \gx

-- Кардинальность вычисляется как число строк, умноженное на частоту значения:

=> SELECT 214867 * s.most_common_freqs[array_position((s.most_common_vals::text::text[]),'SVO')] FROM pg_stats s
WHERE s.tablename = 'flights' AND s.attname = 'arrival_airport';

-- Список наиболее частых значений может использоваться и для оценки селективности неравенств. Для этого в most_common_vals надо найти все значения, удовлетворяющие неравенству, и просуммировать частоты соответствующих элементов из most_common_freqs.


-- Число уникальных значений

-- Если же указанного значения нет в списке наиболее частых, то оно вычисляется исходя из предположения, что все данные (кроме наиболее частых) распределены равномерно.
-- Например, в списке частых значений нет Владивостока.

=> EXPLAIN SELECT * FROM flights WHERE arrival_airport = 'VVO';

-- Точное значение:

=> SELECT count(*) FROM flights WHERE arrival_airport = 'VVO';

-- Для получения оценки вычислим сумму частот наиболее частых значений:

=> SELECT sum(f) FROM pg_stats s, unnest(s.most_common_freqs) f WHERE s.tablename = 'flights' AND s.attname = 'arrival_airport';


-- На менее частые значения приходятся оставшиеся строки. Поскольку мы исходим из предположения о равномерности распределения менее частых значений, селективность будет равна 1/nd, где nd — число уникальных значений:

=> SELECT n_distinct FROM pg_stats s
WHERE s.tablename = 'flights' AND s.attname = 'arrival_airport';

-- Учитывая, что из этих значений 10 входят в список наиболее частых, и нет неопределенных значений, получаем следующую оценку:

=> SELECT 214867 * (1 - 0.42963332) / (104 - 10);








-- Частные и общие планы

-- Неравномерные распределения значений приводят к тому, что запросы, отличающиеся константами или значениями параметров, могут иметь разные планы выполнения. Например, подготовим следующий запрос:

=> PREPARE f(text) AS SELECT * FROM flights WHERE status = $1;


-- Поиск отмененных рейсов будет использовать индекс, поскольку статистика говорит о том, что таких рейсов мало:

=> CREATE INDEX ON flights(status);


=> EXPLAIN EXECUTE f('Cancelled');


-- А поиск прибывших рейсов — нет, поскольку их много:

=> EXPLAIN EXECUTE f('Arrived');

-- Такие планы называются частными, поскольку они построены с учетом конкретных значений параметров.

-- Пять первых планирований всегда используют частные планы. Затем может оказаться, что стоимость общего плана (построенного без учета конкретного значения, в предположении равномерного распределения) не превышает среднюю стоимость уже построенных частных планов. Тогда планировщик запомнит общий план и будет использовать его, не выполняя планирование каждый раз.
-- Построим план еще несколько раз:

=> EXPLAIN EXECUTE f('Arrived');


=> EXPLAIN EXECUTE f('Arrived');


=> EXPLAIN EXECUTE f('Arrived');


-- В следующий раз планировщик переключится на общий план. Вместо конкретного значения в плане будет указан номер параметра:

=> EXPLAIN EXECUTE f('Arrived');


-- При неравномерном распределении это может вызывать проблемы. Параметр plan_cache_mode позволяет отключить использование частных планов (или наоборот, с самого начала использовать общий план):

=> SHOW plan_cache_mode;


=> SET plan_cache_mode = 'force_custom_plan';


=> EXPLAIN EXECUTE f('Arrived');


=> RESET plan_cache_mode;





-- Гистограмма

-- При условиях «больше» и «меньше» для оценки будет использоваться список наиболее частых значений, или гистограмма, или оба способа вместе. Гистограмма строится так, чтобы не включать наиболее частые значения и NULL:
=> SELECT histogram_bounds FROM pg_stats s
WHERE s.tablename = 'flights' AND s.attname = 'arrival_airport';


-- Число корзин гистограммы определяется параметром default_statistics_target, а границы выбираются так, чтобы в каждой корзине находилось примерно одинаковое количество значений.

-- Рассмотрим пример:

=> EXPLAIN SELECT * FROM flights WHERE arrival_airport <= 'HMA';


Точное значение:

=> SELECT count(*) FROM flights WHERE arrival_airport <= 'HMA';

-- Как получена оценка?
-- Учтем частоту наиболее частых значений, попадающих в указанный интервал:

=> SELECT sum( s.most_common_freqs[array_position((s.most_common_vals::text::text[]),v)] ) FROM pg_stats s, unnest(s.most_common_vals::text::text[]) v
WHERE s.tablename = 'flights' AND s.attname = 'arrival_airport' AND v <= 'HMA';

-- Указанный интервал занимает ровно 2 корзины гистограммы из 10, а неопределенных значений в данном столбце нет, получаем следующую оценку:
=> SELECT 214867 * (1 - 0.42963332) * (2.0 / 10.0) + 214867 * 0.1379;

-- В общем случае учитываются и не полностью занятые корзины (с помощью линейной аппроксимации).

-- Дополнительные поля
-- Упорядоченность (использовать ли битовую карту?)
-- pg_stats.correlation
-- (1 — по возрастанию, 0 — хаотично, –1 — по убыванию)
-- Видимость (использовать ли сканирование только индекса?)
-- pg_class.relallvisible
-- Средний размер значения в байтах (оценка памяти)
-- pg_stats.avg_width
-- Информация об элементах массивов, tsvector и т. п.
-- pg_stats.most_common_elems pg_stats.most_common_elem_freqs pg_stats.elem_count_histogram








-- Расширенная статистика

-- Функциональные зависимости

-- Рассмотрим запрос с двумя условиями:

=> SELECT count(*) FROM flights
WHERE flight_no = 'PG0007' AND departure_airport = 'VKO';

-- Оценка оказывается сильно заниженной:

=> EXPLAIN SELECT * FROM flights
WHERE flight_no = 'PG0007' AND departure_airport = 'VKO';

-- Причина в том, что планировщик полагается на то, что предикаты не коррелированы, и считает общую селективность как произведение селективностей условий, объединенных логическим «и». Это хорошо видно в приведенном плане: оценка в узле Bitmap Index Scan (условие на flight_no) одна, а после фильтрации в узле Bitmap Heap Scan (условие на departure_airport) — другая.

-- Однако мы понимаем, что номер рейса однозначно определяет аэропорт отправления: фактически, второе условие избыточно (конечно, считая, что аэропорт указан правильно).
-- Начиная с версии PostgreSQL 10, это можно объяснить и планировщику с помощью статистики по функциональной зависимости:
=> CREATE STATISTICS flights_dep(dependencies) ON flight_no, departure_airport FROM flights;

=> ANALYZE flights;

-- Собранная статистика хранится в следующем виде:

=> SELECT dependencies
FROM pg_stats_ext WHERE statistics_name = 'flights_dep';


-- Сначала идут порядковые номера атрибутов, а после двоеточия — коэффициент зависимости.


=> EXPLAIN SELECT * FROM flights
WHERE flight_no = 'PG0007' AND departure_airport = 'VKO';
-- Теперь оценка улучшилась.




-- Наиболее частые комбинации значений

-- Не всегда между значениями разных столбцов есть явная функциональная зависимость. Выполним такой запрос:
=> EXPLAIN (analyze, timing off, summary off) SELECT * FROM flights
WHERE departure_airport = 'LED' AND aircraft_code = '321';


-- Планировщик ошибается в несколько раз. Учет функциональной зависимости недостаточно исправит ситуацию:

=> CREATE STATISTICS flights_dep2(dependencies) ON departure_airport, aircraft_code FROM flights;

=> ANALYZE flights;

=> EXPLAIN SELECT * FROM flights
WHERE departure_airport = 'LED' AND aircraft_code = '321';


-- Начиная с версии PostgreSQL 12 можно строить расширенную статистику по частым комбинациям значений нескольких столбцов и использовать ее в запросах не только равенства, но и неравенства:
=> DROP STATISTICS flights_dep2;


=> CREATE STATISTICS flights_mcv(mcv)
ON departure_airport, aircraft_code FROM flights;


=> ANALYZE flights;

-- Теперь оценка улучшилась:

=> EXPLAIN SELECT * FROM flights
WHERE departure_airport = 'LED' AND aircraft_code = '321';

-- Статистику по частым комбинациям можно посмотреть так:

=> SELECT m.*
FROM pg_statistic_ext
JOIN pg_statistic_ext_data ON oid = stxoid, pg_mcv_list_items(stxdmcv) m
WHERE stxname = 'flights_mcv' LIMIT 10;



-- Число уникальных комбинаций значений

-- Другая ситуация, в которой планировщик ошибается с оценкой, связана с группировкой. Количество пар аэропортов, связанных прямыми рейсами, ограничено:
=> SELECT count(*) FROM (
SELECT DISTINCT departure_airport, arrival_airport FROM flights
) t;


-- Но планировщик не знает об этом:

=> EXPLAIN SELECT DISTINCT departure_airport, arrival_airport FROM flights;


-- Расширенная статистика позволяет исправить и эту оценку:

=> CREATE STATISTICS flights_nd(ndistinct)
ON departure_airport, arrival_airport FROM flights;


=> ANALYZE flights;


=> EXPLAIN SELECT DISTINCT departure_airport, arrival_airport FROM flights;

-- Статистику по уникальным комбинациям можно увидеть так:

=> SELECT n_distinct
FROM pg_stats_ext WHERE statistics_name = 'flights_nd';





-- Статистика по выражению

Если в условиях используются обращения к функциям, планировщик не учитывает множество значений. Например, рейсов, совершенных в январе, будет примерно 1/12 от общего количества:
=> SELECT count(*) FROM flights
WHERE extract(month FROM scheduled_departure AT TIME ZONE 'Europe/Moscow') = 1;

-- Однако планировщик не понимает смысла функции extract и использует фиксированную селективность 0,5%:

=> EXPLAIN SELECT * FROM flights
WHERE extract(month FROM scheduled_departure AT TIME ZONE 'Europe/Moscow') = 1;

=> SELECT 214867 * 0.005;

-- Ситуацию можно исправить, построив индекс по выражению, так как для таких индексов собирается собственная статистика. В общем случае функция extract имеет класс изменчивости STABLE, поскольку зависит от часового пояса, и поэтому не может участвовать в выражении индекса. Но с явным указанием часового пояса AT TIME ZONE функция постоянна, так что мы напишем обертку с классом изменчивости IMMUTABLE, указав тем самым, что функция гарантированно возвращает одно и то же значение при одних и тех же значениях параметров:
=> CREATE FUNCTION get_month(t timestamptz) RETURNS integer AS $$
SELECT extract(month FROM t AT TIME ZONE 'Europe/Moscow')::integer
$$ IMMUTABLE LANGUAGE sql;


=> CREATE INDEX ON flights(get_month(scheduled_departure));

=> ANALYZE flights;

=> EXPLAIN SELECT * FROM flights
WHERE get_month(scheduled_departure) = 1;

-- Оценка исправилась.

-- Статистика для индексов по выражению хранится вместе со статистикой для таблиц:

=> SELECT n_distinct FROM pg_stats WHERE tablename = 'flights_get_month_idx';





-- Соединения

-- Селективность соединения — доля строк от декартового произведения двух таблиц. Рассмотрим пример:

=> EXPLAIN SELECT *
FROM flights f JOIN aircrafts a ON a.aircraft_code = f.aircraft_code;

-- Точное значение:

=> SELECT count(*)
FROM flights f JOIN aircrafts a ON a.aircraft_code = f.aircraft_code;

-- Базовая формула для расчета селективности соединения (в предположении равномерного распределения) — минимальное из значений 1/nd1 и 1/nd2, где

-- nd1 — число уникальных значений ключа соединения в первом наборе строк; nd2 — число уникальных значений ключа соединения во втором наборе строк.

=> SELECT s1.n_distinct, s2.n_distinct FROM pg_stats s1, pg_stats s2
WHERE s1.tablename = 'flights'	AND s1.attname = 'aircraft_code' AND s2.tablename = 'aircrafts_data' AND s2.attname = 'aircraft_code';

-- В данном случае получаем:

=> SELECT 214867 * 9 * least(1.0/8, 1.0/9);

-- В более сложных случаях приведенная формула дала бы неправильный результат. Например, рейсы совершают разные модели самолетов с разной вместимостью, и для соединения рейсов с местами получили бы:
=> SELECT 214867 * 1339 * least(1.0/8, 1.0/8);

-- При этом точное значение:

=> SELECT count(*)
FROM flights f JOIN seats s ON f.aircraft_code = s.aircraft_code;

-- Однако планировщик умеет учитывать списки наиболее частых значений и гистограммы, и получает практически точную оценку:
=> EXPLAIN SELECT *
FROM flights f JOIN seats s ON f.aircraft_code = s.aircraft_code;

-- К сожалению, ситуация ухудшается, когда соединяются несколько таблиц. Например, добавим в предыдущий запрос таблицу самолетов — это никак не повлияет на общее количество строк в выборке:
=> SELECT count(*) FROM flights f
JOIN aircrafts a ON a.aircraft_code = f.aircraft_code JOIN seats s ON a.aircraft_code = s.aircraft_code;

-- Однако теперь планировщик ошибается:

=> EXPLAIN SELECT *
FROM flights f
JOIN aircrafts a ON a.aircraft_code = f.aircraft_code JOIN seats s ON a.aircraft_code = s.aircraft_code;

-- Причина в том, что, соединив первые две таблицы, планировщик не имеет детальной статистики о результирующем наборе строк.


