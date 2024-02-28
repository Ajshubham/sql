-- This SQL query retrieves the names of students whose best friends received a higher salary offer than them.
select s.name 
from students s inner join friends f on s.id=f.id inner join packages p1 on s.id=p1.id inner join packages p2 on f.friend_id=p2.id
where p1.salary < p2.salary 
order by p2.salary;
