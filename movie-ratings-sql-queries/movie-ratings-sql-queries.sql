-- Q1. Find the titles of all movies directed by Steven Spielberg.
select title from Movie where director = 'Steven Spielberg';


-- Q2. Find the movies names that contain the word "THE"
select title from Movie where upper(title) like '%THE%';


-- Q3. Find those rating records higher than 3 stars before 2011/1/15 or after 2011/1/20 
select * from Rating where stars > 3 and (ratingDate < '2011-01-15' or ratingDate > '2011-01-20');

 
-- /* Q4. Some reviewers did rating on the same movie more than once. 
-- How many rating records are there with different movie and different reviewer's rating? */
select count(distinct rID, mID) from Rating;


-- Q5. Which are the top 3 records with the highest ratings?
select * from Rating order by stars desc limit 3;


-- Q6. Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order.
select distinct m.year from
	Movie m
left join
	Rating r
on m.mID = r.mID
where r.stars in (4,5)
order by m.year;


-- Q7. Find the titles of all movies that have no ratings.
select m.title from
	Movie m
left join
	Rating r
on m.mID = r.mID
where r.mID is null;


-- /* Q8. Some reviewers didn't provide a date with their rating. 
--  Find the names of all reviewers who have ratings with a NULL value for the date. */
select rw.name from
	Reviewer rw
left join
	Rating r
on rw.rID = r.rID
where ratingDate is null;


-- /* Q9. Write a query to return the ratings data in a more readable format in only one field(column): 
-- "reviewer name, movie title, stars, ratingDate". 
-- Assign a new name to the new column as "Review_details"
-- Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars. 
-- Hint: join three tables, using join twice. 
-- Hint: use CONCAT_WS(separator, string1, string2) instead of CONCAT() for creating new column because of NULL values */
select concat_ws(', ', rw.name, m.title, r.stars, r.ratingDate) as Review_details from
	Movie m
inner join
	Rating r
    on m.mID = r.mID
inner join 
	Reviewer rw
    on rw.rID = r.rID
order by rw.name, m.title, r.stars;