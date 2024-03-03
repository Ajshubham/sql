-- Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
-- Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. 
-- Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. 
-- If more than one wand has same power, sort the result in order of descending age.

SELECT wands.id, wands_property.age, wands.coins_needed, wands.power 
FROM Wands 
INNER JOIN Wands_Property ON wands.code = wands_property.code 
WHERE (wands.power, wands.code, wands.coins_needed) IN (
    SELECT power, code, MIN(coins_needed) 
    FROM Wands 
    GROUP BY power, code
) 
AND wands_property.is_evil = 0 
ORDER BY wands.power DESC, wands_property.age DESC;
