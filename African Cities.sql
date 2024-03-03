-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

select c.name
from city c join country cy
on c.countrycode = cy.code
where cy.continent = 'africa';
