-- Table: Employee
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | salary      | int     |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
-- Write a solution to find the employees who earn more than their managers.

-- Return the result table in any order.

select name as Employee
from employee e1
where salary > (select salary from employee where e1.managerId = id);
