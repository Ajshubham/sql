-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780 .
-- Round your answer to decimal places.

select round(lat_n,4)
from station
where lat_n > 38.7880
order by lat_n
limit 1;
