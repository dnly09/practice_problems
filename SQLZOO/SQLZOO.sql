-- SELECT within SELECT Tutorial

# Bigger than Russia

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

# Richer than UK

SELECT name FROM world
  WHERE gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom')
        AND
        continent = 'Europe'

# Neighbours of Argentina and Australia

SELECT name, continent
FROM world
WHERE (continent = 'Oceania') OR (continent = 'South America')
ORDER BY name

# Between Canada and Poland

SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND 
population < (SELECT population FROM world WHERE name = 'Poland')

# Percentages of Germany

SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany') * 100, 0), '%')
FROM world
WHERE continent = 'Europe'

# Bigger than every country in Europe

SELECT name
FROM world
WHERE gdp >= ALL(SELECT gdp FROM world WHERE gdp > 0 
	AND continent = 'Europe')
AND
continent != 'Europe'

# Largest in each continent

SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
ORDER BY name 

-- The JOIN operation

# Question 1

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

# Question 2

SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012

# Question 3

SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

# Question 4

SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

# Question 5

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (teamid=id)
WHERE gtime<=10

# Question 6

SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach LIKE '%Santos'

# Question 7

SELECT player
FROM goal JOIN game ON (matchid=id)
WHERE stadium LIKE '%Warsaw'

# Question 8

SELECT DISTINCT player
FROM game JOIN goal ON (id=matchid)
WHERE (team1='GER' OR team2='GER') AND (teamid!='GER')

# Question 9

SELECT teamname, COUNT(*) AS total_goals
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

# Question 10

SELECT stadium, COUNT(*)
FROM game JOIN goal ON (id=matchid)
GROUP BY stadium

# Question 11

SELECT matchid, mdate, COUNT(teamid)
FROM game JOIN goal ON (id=matchid)
WHERE (team1='POL') or (team2='POL')
GROUP BY goal.matchid, game.mdate

# Question 12

SELECT matchid, mdate, COUNT(teamid)
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'
GROUP BY goal.matchid, game.mdate

# Question 13

SELECT mdate, team1,
SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
team2,
SUM(case when teamid=team2 then 1 else 0 end) AS score2
FROM game 
LEFT JOIN goal
ON id = matchid
GROUP BY mdate, matchid, team1, team2
ORDER BY mdate, matchid, team1, team2