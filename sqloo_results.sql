-- 0 SELECT basics
-- 1. The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';Modify it to show the population of Germany
    SELECT population FROM world
    WHERE name = 'Germany'

-- 2.Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
    SELECT name, population FROM world
    WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3.Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
    SELECT name, area FROM world
    WHERE area BETWEEN 200000 AND 250000

-- 1 SELECT name

-- 1.You can use WHERE name LIKE 'B%' to find the countries that start with "B".The % is a wild-card it can match any characters
    SELECT name FROM world
    WHERE name LIKE 'Y%'

-- 2.Find the countries that end with y
    name FROM world
    WHERE name LIKE '%Y'

-- 3.Luxembourg has an x - so does one other country. List them both.Find the countries that contain the letter x
    SELECT name FROM world
    WHERE name LIKE '%X%'

-- 4.Iceland, Switzerland end with land - but are there others Find the countries that end with land
    SELECT name FROM world
    WHERE name LIKE '%land'

-- 5.Columbia starts with a C and ends with ia - there are two more like this.Find the countries that start with C and end with ia
    SELECT name FROM world
    WHERE name LIKE 'C%Ia'

-- 6.Greece has a double e - who has a double o? Find the country that has oo in the name
    SELECT name FROM world
    WHERE name LIKE '%oo%'

-- 7.Bahamas has three a - who else? Find the countries that have three or more a in the name
    SELECT name FROM world
    WHERE name LIKE '%a%a%a%'

-- 8.Find the countries that have "t" as the second character
    SELECT name FROM world
    WHERE name LIKE '_t%'
    ORDER BY name

-- 9.

-- 10.

-- 11.

-- 12.

-- 13, 14, and 15 have a bug, please skip them


-- 2 SELECT from World
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

-- 9.

-- 10.

-- 11.

-- 12.

-- 13.



-- 3 SELECT from Nobel
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

-- 9.

-- 10.

-- 11.

-- 12.

-- 13.

-- 14.



-- 4 SELECT within SELECT
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- As noted in the tutorial, questions 6 - 10 in this unit are considered bonuses, just like units 6 - 8+
-- 6.

-- 7.

-- 8.

-- 9.

-- 10.



-- 5 SUM and COUNT
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.


-- Note: the units below this are bonus for this weekend, and they will be required in a future assignment. If you do them now you will be ahead of the game!
-- 6 JOIN
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

-- 9.

-- 10.

-- 11.

-- 12.

-- 13.



-- 7 More JOIN operations
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

-- 9.

-- 10.

-- 11.

-- 12.

-- 13.

-- 14.

-- 15.


-- 8 Using Null
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

-- 9.

-- 10.



-- 8+ Numeric Examples
-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

