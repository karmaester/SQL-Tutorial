SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name FROM world
  WHERE continent = 'Europe' AND gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom')

SELECT name, continent FROM world WHERE
  continent LIKE (SELECT continent FROM world WHERE name = 'Argentina') OR
  continent LIKE (SELECT continent FROM world WHERE name = 'Australia')
  ORDER BY name

SELECT name FROM world
WHERE population > (SELECT population FROM world
                    WHERE  name = 'Canada')
AND population <(SELECT population FROM world
    WHERE name = 'Poland')

SELECT name, CONCAT(ROUND((100*population)/(SELECT population FROM world WHERE name = 'Germany')), '%') FROM world
WHERE continent = 'Europe'

SELECT name FROM world
WHERE gdp > (SELECT MAX(gdp) FROM world
            WHERE continent = 'Europe')

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

SELECT continent, name FROM world x 
WHERE name <= ALL(SELECT name FROM world y 
  WHERE y.continent=x.continent)

SELECT name, continent, population FROM world x 
WHERE 25000000 >= ALL(SELECT population FROM world y 
      WHERE x.continent = y.continent 
      AND population > 0)

SELECT name, continent 
FROM world x 
WHERE x.population >= 
ALL (SELECT y.population*3 FROM world y 
WHERE y.continent = x.continent and population > 0 and x.name != y.name)