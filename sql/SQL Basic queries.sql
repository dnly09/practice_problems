-- Revising the Select Query I

SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA'

-- Revising the Select Query II

SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000

-- Select All

SELECT *
FROM CITY

-- Select By ID

SELECT *
FROM CITY
WHERE ID = 1661

-- Japanese Cities' Attributes

SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN'

-- Japanese Cities' Names

SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN'

-- Weather Observation Station 1

SELECT CITY, STATE
FROM STATION

-- Weather Observation Station 3

SELECT DISTINCT CITY
FROM STATION
WHERE ID % 2 = 0

-- Weather Observation Station 4

SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION

-- Weather Observation Station 5

(SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY), CITY LIMIT 1) 
UNION 
(SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY ASC LIMIT 1)

-- Weather Observation Station 6

SELECT CITY
FROM STATION
WHERE 
    (CITY LIKE 'A%') OR
    (CITY LIKE 'E%') OR
    (CITY LIKE 'I%') OR
    (CITY LIKE 'O%') OR
    (CITY LIKE 'U%')

-- Weather Observation Station 7

SELECT DISTINCT CITY
FROM STATION
WHERE 
    (CITY LIKE '%a') OR
    (CITY LIKE '%e') OR
    (CITY LIKE '%i') OR
    (CITY LIKE '%o') OR
    (CITY LIKE '%u')

-- Weather Observation Station 8

SELECT DISTINCT CITY
FROM STATION
WHERE 
    ((CITY LIKE 'A%') OR
    (CITY LIKE 'E%') OR
    (CITY LIKE 'I%') OR
    (CITY LIKE 'O%') OR
    (CITY LIKE 'U%'))
     AND
    ((CITY LIKE '%a') OR
    (CITY LIKE '%e') OR
    (CITY LIKE '%i') OR
    (CITY LIKE '%o') OR
    (CITY LIKE '%u'))

-- Weahter Observation Station 9

SELECT DISTINCT CITY
FROM STATION
WHERE 
    (CITY NOT LIKE 'A%') AND
    (CITY NOT LIKE 'E%') AND
    (CITY NOT LIKE 'I%') AND
    (CITY NOT LIKE 'O%') AND
    (CITY NOT LIKE 'U%')

-- Weather Observation Station 10

SELECT DISTINCT CITY
FROM STATION
WHERE 
    (CITY NOT LIKE '%a') AND
    (CITY NOT LIKE '%e') AND
    (CITY NOT LIKE '%i') AND
    (CITY NOT LIKE '%o') AND
    (CITY NOT LIKE '%u')

-- Weather Observation Station 11

SELECT DISTINCT CITY
FROM STATION
WHERE 
    ((CITY NOT LIKE 'A%') AND
    (CITY NOT LIKE 'E%') AND
    (CITY NOT LIKE 'I%') AND
    (CITY NOT LIKE 'O%') AND
    (CITY NOT LIKE 'U%'))
     OR
    ((CITY NOT LIKE '%a') AND
    (CITY NOT LIKE '%e') AND
    (CITY NOT LIKE '%i') AND
    (CITY NOT LIKE '%o') AND
    (CITY NOT LIKE '%u'))

-- Weather Observation Station 12

SELECT DISTINCT CITY
FROM STATION
WHERE 
    ((CITY NOT LIKE 'A%') AND
    (CITY NOT LIKE 'E%') AND
    (CITY NOT LIKE 'I%') AND
    (CITY NOT LIKE 'O%') AND
    (CITY NOT LIKE 'U%'))
     AND
    ((CITY NOT LIKE '%a') AND
    (CITY NOT LIKE '%e') AND
    (CITY NOT LIKE '%i') AND
    (CITY NOT LIKE '%o') AND
    (CITY NOT LIKE '%u'))

-- Higher than 75 Marks

SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3) ASC, ID ASC

-- Employee Names

SELECT name
FROM Employee
ORDER BY name ASC

-- Employee Salaries

SELECT name
FROM Employee
WHERE
    (salary > 2000)
    AND
    (months < 10)
ORDER BY employee_id ASC
