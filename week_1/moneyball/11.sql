SELECT "first_name", "last_name", "salary"/"H" AS "dollars per hit"
FROM "salaries" JOIN "players" JOIN "performances"
ON "salaries"."player_id" = "players"."id"
AND "salaries"."player_id" = "performances"."player_id"
AND "salaries"."year" = "performances"."year"
AND "salaries"."year" = '2001'
AND "H" > 0
ORDER BY "dollars per hit", "first_name", "last_name"
LIMIT 10
;