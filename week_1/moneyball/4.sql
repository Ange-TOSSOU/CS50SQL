-- What if a player is paid the same salary in different teams ... transfer.
SELECT DISTINCT "first_name", "last_name", "salary"
FROM "salaries" JOIN "players"
ON "player_id" = "players"."id"
WHERE "year" = '2001'
ORDER BY "salary", "first_name", "last_name", "player_id"
LIMIT 50
;