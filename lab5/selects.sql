-- Количество фильмов, в которых снимался каждый актер

select actor.first_name, actor.last_name, count(film_actor.actor_id) as film_count 
from actor join film_actor  on actor.actor_id = film_actor.actor_id
group by actor.first_name, actor.last_name

-- Выбрать из БД фильмы категории PG-13 в жанре драма.

select film.title, film.rating, category.name
from film join film_category on film.film_id = film_category.film_id 
		  join category on category.category_id = film_category.category_id
where film.rating = 'PG-13' and category.name = 'Drama'

