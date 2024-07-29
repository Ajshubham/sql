-- Table: Person
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | email       | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains an email. The emails will not contain uppercase letters.
-- Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.

-- Return the result table in any order.
-- The result format is in the following example.
with cte as(
    select id, email,
    ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) as row_num
    from person
)
select distinct email as Email
from person
where id in (select id from cte where row_num > 1);
