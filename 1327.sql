-- Table: Products
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | product_id       | int     |
-- | product_name     | varchar |
-- | product_category | varchar |
-- +------------------+---------+
-- product_id is the primary key (column with unique values) for this table.
-- This table contains data about the company's products.

-- Table: Orders
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | order_date    | date    |
-- | unit          | int     |
-- +---------------+---------+
-- This table may have duplicate rows.
-- product_id is a foreign key (reference column) to the Products table.
-- unit is the number of products ordered in order_date.

-- Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.
-- Return the result table in any order.

select p.product_name, sum(o.unit) as unit
from products p inner join orders o
on p.product_id = o.product_id
where extract(year_month from o.order_date) = 202002
group by p.product_name
having sum(o.unit) >= 100;
