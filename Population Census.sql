-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

select sum(c.population)
from city c join country cy
on c.countrycode = cy.code
where cy.continent = 'asia';
