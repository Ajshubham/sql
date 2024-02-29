-- Samantha interviews many candidates from different colleges using coding challenges and contests.
-- Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id.
-- Exclude the contest from the result if all four sums are.

-- Note: A specific contest can be used to screen candidates at more than one college, but each college only holds
-- screening contest.

SELECT C.contest_id, C.hacker_id, c.NAME, SUM(SS.total_submissions), SUM(SS.total_accepted_submissions), SUM(VS.total_views), SUM(VS.total_unique_views) 
FROM Contests C 
INNER JOIN Colleges Col ON Col.contest_id = C.contest_id
INNER JOIN Challenges Cha ON Cha.college_id = Col.college_id 
LEFT JOIN ( SELECT challenge_id, SUM(total_views) total_views , SUM(total_unique_views) total_unique_views FROM View_Stats GROUP BY challenge_id ) VS ON VS.challenge_id = Cha.challenge_id 
LEFT JOIN (SELECT challenge_id, SUM(total_submissions) total_submissions, SUM(total_accepted_submissions) total_accepted_submissions FROM Submission_Stats GROUP BY challenge_id) SS ON Cha.challenge_id = SS.challenge_id 
GROUP BY C.contest_id, C.hacker_id, c.NAME 
HAVING SUM(SS.total_submissions) + SUM(SS.total_accepted_submissions)+ SUM(VS.total_views)+ SUM(VS.total_unique_views) != 0 
ORDER BY C.contest_id;
