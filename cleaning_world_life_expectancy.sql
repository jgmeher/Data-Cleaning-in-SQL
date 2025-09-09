
SELECT *
FROM world_life_expectancy;

SELECT COUNT(row_id)
FROM world_life_expectancy;

SELECT country, year, CONCAT(country, year), COUNT(CONCAT(country, year))
FROM world_life_expectancy
GROUP BY country, year,CONCAT(country, year)
HAVING COUNT(CONCAT(country, year)) > 1;

SELECT *
FROM(
	SELECT row_id, 
	CONCAT(country, year),
	ROW_NUMBER() OVER( PARTITION BY CONCAT(country, year) ORDER BY CONCAT(country, year)) AS rn
	FROM world_life_expectancy) AS row_table
WHERE rn > 1;

DELETE FROM world_life_expectancy
WHERE
	Row_ID IN(
	SELECT Row_ID
FROM(
	SELECT Row_ID, 
	CONCAT(country, year),
	ROW_NUMBER() OVER( PARTITION BY CONCAT(country, year) ORDER BY CONCAT(country, year)) AS rn
	FROM world_life_expectancy
    ) AS row_table
WHERE rn > 1);

SELECT *
FROM world_life_expectancy
WHERE status = '';

SELECT DISTINCT(status)
FROM world_life_expectancy
WHERE status != '';

SELECT DISTINCT(country)
FROM world_life_expectancy
WHERE status = 'Developing';

UPDATE world_life_expectancy
SET status = 'Developing'
WHERE country IN (SELECT DISTINCT(country)
				FROM world_life_expectancy
				WHERE status = 'Developing');


UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.status = 'Developing'
WHERE t1.status = ''
AND t2.status != ''
AND t2.status = 'Developing';
    
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.status = 'Developed'
WHERE t1.status = ''
AND t2.status != ''
AND t2.status = 'Developed';

SELECT *
FROM world_life_expectancy
WHERE status IS NULL;

SELECT *
FROM world_life_expectancy
WHERE `Life expectancy` = '';


SELECT Country, Year, `Life expectancy`
FROM world_life_expectancy
WHERE `Life expectancy` = '';

SELECT t1.Country, t1.Year, t1.`Life expectancy`,
t2.Country, t2.Year, t2.`Life expectancy`,
t3.Country, t3.Year, t3.`Life expectancy`,
ROUND((t2.`Life expectancy`+ t3.`Life expectancy`)/2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.year =  t2.year - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.year =  t3.year + 1
WHERE t1.`Life expectancy` =  ''
;

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2 
	ON t1.Country = t2.Country
    AND t1.year =  t2.year - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.year =  t3.year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy`+ t3.`Life expectancy`)/2,1)
WHERE t1.`Life expectancy` =  '';

UPDATE world_life_expectancy o
JOIN world_life_expectancy_backup b
	ON o.Row_ID = b.Row_ID
SET o.`Life expectancy` = b.`Life expectancy`;


SELECT *
FROM world_life_expectancy;
