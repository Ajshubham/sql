-- Query a count of the number of cities in CITY having a Population larger than 

select count(name) as cnt
from city
where population > 100000
group by name;
