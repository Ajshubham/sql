-- Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
-- Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. 
-- If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

WITH challenge_counts AS (
    SELECT hacker_id, COUNT(challenge_id) AS cc
    FROM challenges
    GROUP BY hacker_id
),
unique_counts AS (
    SELECT cc
    FROM challenge_counts
    GROUP BY cc
    HAVING COUNT(DISTINCT hacker_id) = 1 OR cc = (SELECT MAX(cc) FROM challenge_counts)
)
SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS cc
FROM challenges c
LEFT JOIN hackers h ON c.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
HAVING cc IN (SELECT cc FROM unique_counts)
ORDER BY cc DESC, h.hacker_id ASC;
