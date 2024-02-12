-- Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:
-- Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. 
-- Order your output by ascending company_code.
-- Note:
--     The tables may contain duplicate records.
--     The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

select c.company_code, c.founder,
    count(distinct l.lead_manager_code) as lead_count,
    count(distinct s.senior_manager_code) as senior_count,
    count(distinct m.manager_code) as Manager_count,
    count(distinct e.employee_code) as employee_count
from Company c
LEFT JOIN Lead_Manager l ON c.company_code = l.company_code
LEFT JOIN Senior_Manager s ON c.company_code = s.company_code
LEFT JOIN Manager m ON c.company_code = m.company_code
LEFT JOIN Employee e ON c.company_code = e.company_code
group by c.company_code, c.founder
order by c.company_code;
