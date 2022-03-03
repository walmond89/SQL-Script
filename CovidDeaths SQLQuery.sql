select *
FROM DAPortfolio..CovidDeaths
WHERE continent is not null
ORDER BY 3,4


--select *
--FROM DAPortfolio..CovidVaccinations
--ORDER BY 3,4


select location, date, total_cases, new_cases, total_deaths, population
FROM DAPortfolio..CovidDeaths
WHERE continent is not null
ORDER BY 1,2


select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM DAPortfolio..CovidDeaths
WHERE location = 'united states'
ORDER BY 1,2


select location, date, total_cases, population, (total_cases/population)*100 AS CovidPercentage
FROM DAPortfolio..CovidDeaths
WHERE location = 'united states'
ORDER BY 1,2


select location, population, MAX(total_cases) AS HighestCases, MAX((total_cases/population))*100 AS CovidPercentage
FROM DAPortfolio..CovidDeaths
WHERE continent is not null
GROUP BY location, population
ORDER BY CovidPercentage desc


select location, population, date, MAX(total_cases) AS HighestCases, MAX((total_cases/population))*100 AS CovidPercentage
FROM DAPortfolio..CovidDeaths
WHERE continent is not null
GROUP BY location, population, date
ORDER BY CovidPercentage desc


select location, population, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM DAPortfolio..CovidDeaths
WHERE continent is not null
GROUP BY location, population
ORDER BY TotalDeathCount desc


select location, SUM(cast(total_deaths as int)) AS TotalDeathCount
FROM DAPortfolio..CovidDeaths
WHERE continent is null
and location not in ('world', 'european union', 'international', 'upper middle income', 'high income', 'lower middle income', 'low income')
GROUP BY location
ORDER BY TotalDeathCount desc


select location, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM DAPortfolio..CovidDeaths
WHERE continent is null
GROUP BY location
ORDER BY TotalDeathCount desc


select date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM DAPortfolio..CovidDeaths
WHERE location = 'world'
ORDER BY date desc


Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
FROM DAPortfolio..CovidDeaths
where continent is not null 
order by 1,2


select codea.continent, codea.location, codea.date, codea.population, covac.new_vaccinations
, SUM(cast(covac.new_vaccinations as bigint)) OVER (PARTITION by codea.location ORDER BY codea.location, codea.date) as RollingPeopleVaccinated
FROM DAPortfolio..CovidDeaths codea
JOIN DAPortfolio..CovidVaccinations covac
ON codea.location = covac.location
and codea.date = covac.date
WHERE codea.continent is not null
order by 2,3


With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
select codea.continent, codea.location, codea.date, codea.population, covac.new_vaccinations
, SUM(cast(covac.new_vaccinations as bigint)) OVER (PARTITION by codea.location ORDER BY codea.location, codea.date) as RollingPeopleVaccinated
FROM DAPortfolio..CovidDeaths codea
JOIN DAPortfolio..CovidVaccinations covac
ON codea.location = covac.location
and codea.date = covac.date
WHERE codea.continent is not null
)
select*, (RollingPeopleVaccinated/Population)*100
From PopvsVac


Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)
Insert into #PercentPopulationVaccinated
select codea.continent, codea.location, codea.date, codea.population, covac.new_vaccinations
, SUM(cast(covac.new_vaccinations as bigint)) OVER (PARTITION by codea.location ORDER BY codea.location, codea.date) as RollingPeopleVaccinated
FROM DAPortfolio..CovidDeaths codea
JOIN DAPortfolio..CovidVaccinations covac
ON codea.location = covac.location
and codea.date = covac.date
WHERE codea.continent is not null

select*, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated


Create View PercentPopulationVaccinated as
select codea.continent, codea.location, codea.date, codea.population, covac.new_vaccinations
, SUM(cast(covac.new_vaccinations as bigint)) OVER (PARTITION by codea.location ORDER BY codea.location, codea.date) as RollingPeopleVaccinated
FROM DAPortfolio..CovidDeaths codea
JOIN DAPortfolio..CovidVaccinations covac
ON codea.location = covac.location
and codea.date = covac.date
WHERE codea.continent is not null


select*
FROM PercentPopulationVaccinated