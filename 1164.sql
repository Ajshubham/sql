-- Table: Products

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key (combination of columns with unique values) of this table.
-- Each row of this table indicates that the price of some product was changed to a new price at some date.

-- Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.
-- Return the result table in any order.

select distinct product_id,
coalesce((select new_price from (select * from products p3 where change_date <= '2019-08-16' and p3.product_id = p2.product_id) p1
order by change_date desc limit 1), 10) as price
from products p2;
