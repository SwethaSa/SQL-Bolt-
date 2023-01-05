-- Exercise 1 — Tasks

--1.Find the title of each film ✓
--ANSWER
SELECT title FROM movies;

--2.Find the director of each film ✓ 
--ANSWER
SELECT director FROM movies;

--3.Find the title and director of each film ✓
--ANSWER
SELECT title,director FROM movies;

--4.Find the title and year of each film ✓
--ANSWER
SELECT title,year FROM movies;

--5.Find all the information about each film ✓
--ANSWER
SELECT * FROM movies;

---------------------------------------------------------------------------------------------------------------------------

--Exercise 2 — Tasks

--1.Find the movie with a row id of 6 ✓
--ANSWER
SELECT * FROM movies
where id = 6;

--2.Find the movies released in the years between 2000 and 2010 ✓
--ANSWER
SELECT * FROM movies
where year between 2000 and 2010;

--3.Find the movies not released in the years between 2000 and 2010 ✓
--ANSWER
SELECT * FROM movies
where year not between 2000 and 2010;

--4.Find the first 5 Pixar movies and their release year ✓
--ANSWER
SELECT * FROM movies
where year limit 5;

---------------------------------------------------------------------------------------------------------------------------

--Exercise 3 — Tasks

--1.Find all the Toy Story movies ✓
--ANSWER
SELECT * FROM movies
where title like "Toy Story%";

--2.Find all the movies directed by John Lasseter ✓
--ANSWER
SELECT * FROM movies
where director = "John Lasseter";

--3.Find all the movies (and director) not directed by John Lasseter ✓
--ANSWER
SELECT * FROM movies
where director != "John Lasseter";

--4.Find all the WALL-* movies ✓
--ANSWER
SELECT * FROM movies
where title like "Wall-_";

---------------------------------------------------------------------------------------------------------------------------

--Exercise 4 — Tasks

--1.List all directors of Pixar movies (alphabetically), without duplicates ✓
--ANSWER
SELECT distinct director FROM movies
order by director;

--2.List the last four Pixar movies released (ordered from most recent to least) ✓
--ANSWER
SELECT * FROM movies
order by year desc
limit 4;

--3.List the first five Pixar movies sorted alphabetically ✓
--ANSWER
SELECT * FROM movies
order by title 
limit 5;

--4.List the next five Pixar movies sorted alphabetically ✓
--ANSWER
SELECT * FROM movies
order by title 
limit 5 offset 5;

---------------------------------------------------------------------------------------------------------------------------

--Exercise 5 Review 1 — Tasks

--1.List all the Canadian cities and their populations ✓
--ANSWER
SELECT * FROM north_american_cities
where country = "Canada";

--2.Order all the cities in the United States by their latitude from north to south ✓
--ANSWER
SELECT * FROM north_american_cities
where country = "United States"
order by latitude desc;

--3.List all the cities west of Chicago, ordered from west to east ✓
--ANSWER
SELECT * FROM north_american_cities
where Longitude < -87.629798
order by longitude;

--4.List the two largest cities in Mexico (by population) ✓
--ANSWER
SELECT * FROM north_american_cities
where country = "Mexico"
order by population desc
limit 2;

--5.List the third and fourth largest cities (by population) in the United States and their population ✓
--ANSWER
SELECT * FROM north_american_cities
where country = "United States"
order by population desc
limit 2 offset 2;

---------------------------------------------------------------------------------------------------------------------------

--Exercise 6 — Tasks

--1.Find the domestic and international sales for each movie ✓
--ANSWER
SELECT * FROM movies
inner join Boxoffice
on id = Movie_id;

--2.Show the sales numbers for each movie that did better internationally rather than domestically ✓
--ANSWER
SELECT Title FROM movies
inner join Boxoffice
on id = Movie_id
where International_sales > Domestic_sales ;

--3.List all the movies by their ratings in descending order ✓
--ANSWER
SELECT Title FROM movies
inner join Boxoffice
on id = Movie_id
order by Rating desc ;

---------------------------------------------------------------------------------------------------------------------------

--Exercise 7 — Tasks
--1.Find the list of all buildings that have employees ✓
--ANSWER
SELECT DISTINCT Building FROM employees;

--2.Find the list of all buildings and their capacity ✓
--ANSWER
SELECT DISTINCT Building_name, Capacity FROM Buildings;

--3.List all buildings and the distinct employee roles in each building (including empty buildings) ✓
--ANSWER
SELECT DISTINCT Building_name, Role FROM Buildings
Left Join Employees
on Building_name = Building;

---------------------------------------------------------------------------------------------------------------------------

--Exercise 8 — Tasks

--1.Find the name and role of all employees who have not been assigned to a building ✓
--ANSWER
SELECT * FROM Employees 
where Building is Null;

--2.Find the names of the buildings that hold no employees ✓
--ANSWER
SELECT * FROM Buildings
Left Join Employees
on Building_name = Building
where Role is Null;

---------------------------------------------------------------------------------------------------------------------------

--Exercise 9 — Tasks

--1.List all movies and their combined sales in millions of dollars ✓
--ANSWER
SELECT Title, (Domestic_sales + International_sales)/1000000 FROM movies
inner join Boxoffice
on Id = Movie_Id;

--2.List all movies and their ratings in percent ✓
--ANSWER
SELECT Title, (rating)*10 FROM movies
inner join Boxoffice
on Id = Movie_Id;

--3.List all movies that were released on even number years ✓
--ANSWER
SELECT * FROM movies
where Year % 2 = 0;

---------------------------------------------------------------------------------------------------------------------------

--Exercise 10 — Tasks

--1.Find the longest time that an employee has been at the studio ✓
--ANSWER
SELECT MAX(Years_employed) FROM employees;

--2.For each role, find the average number of years employed by employees in that role ✓
--ANSWER
SELECT Role, AVG(Years_employed) AS Average_Years FROM employees
Group By Role;

--3.Find the total number of employee years worked in each building ✓
--ANSWER
SELECT Building, SUM(Years_employed) FROM employees
Group By Building;

---------------------------------------------------------------------------------------------------------------------------

--Exercise 11 — Tasks

--1.Find the number of Artists in the studio (without a HAVING clause) ✓
--ANSWER
SELECT  Role, Count(Role) AS Total_Artists FROM Employees
where Role = "Artist";

--2.Find the number of Employees of each role in the studio ✓
--ANSWER
SELECT  Role, Count(Role) FROM Employees
Group by Role;

--3.Find the total number of years employed by all Engineers ✓
--ANSWER
SELECT Role, SUM(Years_employed) FROM Employees
Where Role = "Engineer";

---------------------------------------------------------------------------------------------------------------------------

--Exercise 12 — Tasks

--1.Find the number of movies each director has directed ✓
--ANSWER
SELECT Director, Count(Title) FROM movies
Group by director;

--2.Find the total domestic and international sales that can be attributed to each director ✓
--ANSWER
SELECT Title, Director,SUM(Domestic_sales+International_sales) AS Total_collection FROM movies
Inner Join Boxoffice 
on Id = Movie_Id
Group By Director;

---------------------------------------------------------------------------------------------------------------------------

--Exercise 13 — Tasks

--1.Add the studio's new production, Toy Story 4 to the list of movies (you can use any director) ✓
--ANSWER
Insert Into movies
Values(5, "Toy Story 4", "Swetha", 2022, 120);

--2.Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table. ✓
--ANSWER
Insert Into Boxoffice
Values (5, 8.7, 340000000, 270000000);

---------------------------------------------------------------------------------------------------------------------------

--Exercise 14 — Tasks
--1.The director for A Bug's Life is incorrect, it was actually directed by John Lasseter ✓
--ANSWER
Update movies
SET Director = "John Lasseter"
where id = 2;

--2.The year that Toy Story 2 was released is incorrect, it was actually released in 1999 ✓
--ANSWER
Update movies
SET Year = 1999
where id = 3;

--3.Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich ✓
--ANSWER
Update movies
SET Title = "Toy Story 3", Director = "Lee Unkrich"
where id = 11;

---------------------------------------------------------------------------------------------------------------------------

--Exercise 15 — Tasks
--1.This database is getting too big, lets remove all movies that were released before 2005. ✓
--ANSWER
DELETE FROM movies
where Year < 2005;

--2.Andrew Stanton has also left the studio, so please remove all movies directed by him. ✓
--ANSWER
DELETE FROM movies
where director = "Andrew Stanton";

---------------------------------------------------------------------------------------------------------------------------

--Exercise 16 — Tasks

--Create a new table named Database with the following columns:
-- – Name A string (text) describing the name of the database
-- – Version A number (floating point) of the latest version of this database
-- – Download_count An integer count of the number of times this database was downloaded
--This table has no constraints. ✓
--ANSWER
CREATE TABLE Database (
Name TEXT,
Version FLOAT,
Download_count INTEGER);

---------------------------------------------------------------------------------------------------------------------------

--Exercise 17 — Tasks

--1.Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in. ✓
--ANSWER
ALTER TABLE movies
ADD Aspect_ratio FLOAT;

--2.Add another column named Language with a TEXT data type to store the language that the movie was released in. Ensure that the default for this language is English.
--ANSWER
ALTER TABLE movies
ADD Language  TEXT  DEFAULT English;

---------------------------------------------------------------------------------------------------------------------------

--Exercise 18 — Tasks
--1.We've sadly reached the end of our lessons, lets clean up by removing the Movies table ✓
--ANSWER
DROP TABLE IF EXISTS movies;

--2.And drop the BoxOffice table as well ✓
--ANSWER
DROP TABLE IF EXISTS Boxoffice ;

---------------------------------------------------------------------------------------------------------------------------