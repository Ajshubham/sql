-- You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.
-- If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

-- Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. 
-- If there is more than one project that have the same number of completion days, then order by the start date of the project.

select min(t1.start_date), max(t1.end_date) 
from (select start_date,end_date,end_date-row_number() over (order by end_date) as rk from projects) t1 
group by t1.rk 
order by max(t1.end_date)-min(t1.start_date);
