/*

Queries used for Tableau Project

*/

-- 1. 

SELECT SUM(new_cases) AS total_cases, 
	SUM(cast(new_deaths AS SIGNED)) AS total_deaths, 
	SUM(cast(new_deaths AS SIGNED)) / SUM(New_Cases)*100 AS DeathPercentage
FROM ...coviddeaths
WHERE continent IS NOT NULL
ORDER BY 1,2;

-- 2.

SELECT Location, SUM(CAST(Total_deaths AS SIGNED)) AS TotalDeathCount
FROM ...coviddeaths
WHERE continent = ('')
    AND location NOT IN ('European Union')
    AND location NOT LIKE ('%income')
GROUP BY Location
ORDER BY TotalDeathCount DESC;

-- 3.

SELECT Location, Population, 
	MAX(total_cases) AS HighestInfectionCount,  
	Max((total_cases/population))*100 AS PercentPopulationInfected
FROM ...coviddeaths
WHERE continent = ('')
    AND location NOT IN ('European Union')
    AND location NOT LIKE ('%income')
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC;

-- 4.

SELECT Location, Population, date, 
	MAX(total_cases) AS HighestInfectionCount,  
	Max((total_cases/population))*100 AS PercentPopulationInfected
FROM ...coviddeaths
GROUP BY Location, Population,date 
ORDER BY PercentPopulationInfected DESC;
