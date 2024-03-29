-- Consider P1(a,b) and P2(c,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
-- Query the Euclidean Distance between points P1 and P2 format your answer to display decimal digits.

select round(SQRT((power(max(lat_n)- min(lat_n),2)) + (power(max(long_w)- min(long_w),2))),4)
from station;
