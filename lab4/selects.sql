SELECT AVG (replacement_cost) AS average_cost FROM film; --Средняя цена аренды фильмов
SELECT COUNT(release_year) FROM film WHERE release_year = 2006; --Количество фильмов  определенного года выхода (2006 г.)
SELECT MIN (release_year) AS min_release_year FROM film; --Самый ранний по году выпуска фильм
SELECT SUM(replacement_cost) FROM film; --Сколько будет стоить аренда всех фильмов