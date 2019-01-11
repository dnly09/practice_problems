-- Revising Aggregations - The Count Function

SELECT COUNT(*)
FROM CITY
WHERE POPULATION > 100000

-- Revising Aggregations - The Sum Function

SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'

-- Revising Aggregations - Averages

SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'

-- Average Population

SELECT FLOOR(AVG(POPULATION))
FROM CITY

-- Japan Population

SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE ='JPN'

-- Population Density Difference

SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY

-- The Blunder

SELECT ROUND(AVG(Salary)-AVG(REPLACE(Salary,'0','')) + 0.5) FROM EMPLOYEES
