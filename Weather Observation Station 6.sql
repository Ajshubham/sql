-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

select city from station
where city like 'A%' or city like 'E%' or city like 'I%' or city like 'O%' or city like 'U%'
