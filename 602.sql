-- Table: RequestAccepted
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | requester_id   | int     |
-- | accepter_id    | int     |
-- | accept_date    | date    |
-- +----------------+---------+
-- (requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
-- This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 
-- Write a solution to find the people who have the most friends and the most friends number.
-- The test cases are generated so that only one person has the most friends.

with cte as(
SELECT requester_id as id, COUNT(requester_id) as count
FROM RequestAccepted
GROUP BY requester_id
UNION ALL
SELECT accepter_id as id, COUNT(accepter_id) as count
FROM RequestAccepted 
GROUP BY accepter_id
)

select id, sum(count) as num
from cte
group by id
order by num desc
limit 1;
