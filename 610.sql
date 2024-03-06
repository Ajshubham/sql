-- Table: Triangle

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | x           | int  |
-- | y           | int  |
-- | z           | int  |
-- +-------------+------+
-- In SQL, (x, y, z) is the primary key column for this table.
-- Each row of this table contains the lengths of three line segments.
  
-- Report for every three line segments whether they can form a triangle.
-- Return the result table in any order.

select x, y, z,
(case when abs(x + y) > abs(z) and abs(x + z) > abs(y) and abs(z + y) > abs(x) then 'Yes' else 'No' end) as triangle
from triangle;
