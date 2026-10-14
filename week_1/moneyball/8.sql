-- For this player there only one performance and salary record in 2001.
SELECT "salary"
FROM "salaries"
WHERE "player_id" = (
    SELECT "player_id"
    FROM "performances"
    WHERE "year" = '2001'
    GROUP BY "player_id"
    ORDER BY SUM("HR") DESC
    LIMIT 1
)
AND "year" = '2001'
;