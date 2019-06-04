/* presentation of data with concat */
SELECT CONCAT(last_name, ', ',first_name) FROM actors;

/* same principle but renaming the column to actor name */
SELECT CONCAT(last_name, ', ', first_name) AS ACTOR_NAME from actors;

/* displaying the first three letters of the last name */
SELECT last_name, SUBSTRING(last_name, 1, 3) FROM actors;

/* Different ways of selecting data */

SELECT * FROM actors order by last_name ASC;

SELECT rating, count(*) as total_movies from movies GROUP BY rating;

SELECT MIN(release_year), rating FROM movies WHERE title LIKE "%Museum%" GROUP BY rating;

SELECT * FROM movies WHERE rating = "r" OR ifnull(rating, '') = '';

SELECT * from movies where rating='PG-13' and title NOT LIKE "Night%";

SELECT title, release_year from movies where release_year >= 2006 and release_year <= 2016;

SELECT title, release_year from movies where release_year BETWEEN 2005 AND 2016;

SELECT title, release_year from movies where release_year <> 2016;

/* filtering multiple values, using IN */
SELECT title, release_year from movies where release_year in (2005, 2009, 2016);

SELECT title, release_year from movies where release_year NOT in (2005, 2009, 2016);

SELECT * from movies where (rating = "PG-13" OR title LIKE "ZOO%");

select * from movies WHERE rating IS NULL;

/* Selecting the movies if rating is PG or Null, whether it is NULL or
just an empty string*/
select * from movies WHERE rating = 'PG' or IFNULL(rating, '') = '';

/* Using a Case statement */
SELECT rating, CASE
 	WHEN rating='PG' THEN 'bring the children'
 	WHEN rating='PG-13' THEN 'Older Children'
 	ELSE 'No information'
 	END AS audience
 FROM movies;


Select Now(), day(now()),dayname(now()), dayofmonth(now()), dayofweek(now()), dayofyear(now());


/* using timestampdiff function to calculate difference between two dates */
select DOB as birthday, curdate() as Today, timestampdiff(year,dob, curdate()) as Age from person;

select fname, dob as birthday, curdate() as today,
str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), "%m/%d/%Y")
as "birthday this year" from person;

select fname, dob as birthday, curdate() as today,
str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), "%m/%d/%Y") as "birthday this year"
, date_add(str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y'), interval 1 year)
as "Birthday next year" from person;


select fname, dob as birthday, curdate() as today, str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), "%m/%d/%Y") as "birthday this year", date_add(str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y'), interval 1 year) as "Birthday next year"
, case
 WHEN str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y') >= curdate()
 THEN str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y')
 ELSE date_add(str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y'), INTERVAL 1 YEAR)
 END AS "NEXT BIRTHDAY"
 FROM person;

/* create a table with people and their birthdays */