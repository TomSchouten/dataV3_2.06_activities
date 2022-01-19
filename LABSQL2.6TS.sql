use sakila;

--     In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

SELECT DISTINCT last_name
FROM 	  		actor;

--     Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

SELECT   last_name, COUNT(last_name)
FROM 	 actor
GROUP BY last_name;

--     Using the rental table, find out how many rentals were processed by each employee.

SELECT   Staff_id, COUNT(rental_id) AS 'amount_of_rentals_processed'
FROM	 rental
GROUP BY staff_ID;

--     Using the film table, find out how many films were released each year.

SELECT   film_id, 
         COUNT(DISTINCT title) AS 'number_of_movies', 
		 DATE_FORMAT(release_year,'%Y') AS 'release_year'
FROM     film
GROUP BY DATE_FORMAT(release_year,'%Y');

--     Using the film table, find out for each rating how many films were there.
SELECT   rating, COUNT(rating) AS 'amount_of_films'
FROM     film
GROUP BY rating;

--     What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT   rating, round(AVG(length),2) AS 'mean_movie_length'
FROM     film
GROUP BY rating;

--     Which kind of movies (rating) have a mean duration of more than two hours?

SELECT    rating, round(AVG(length),2) AS 'mean_movie_length'
FROM      film
GROUP BY  rating
HAVING    AVG(length) >120;

--     Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT   title, length, RANK() 
OVER     (ORDER BY length DESC) as 'rank'
FROM     sakila.film
WHERE length IS NOT null AND length > 0
ORDER BY length DESC;

