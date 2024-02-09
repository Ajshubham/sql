-- The total score of a hacker is the sum of their maximum scores for all of the challenges.
-- Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score.
-- If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of from your result.

select 
    hacker_id,
    name,
    sum(score) as totol_score
from
(
    select 
        h.hacker_id, 
        h.name,
        max(s.score) as score
    from 
        hackers h
    join
        submissions s on h.hacker_id = s.hacker_id
    where 
        score > 0
    group by 
        h.hacker_id, 
        h.name,
        s.challenge_id
) as table1
group by 
     hacker_id, 
     name
order by 
    totol_score desc, 
    hacker_id;
