SELECT "first_name", "last_name", "salary", "HR", "salaries"."year"
FROM "salaries" JOIN "players" JOIN "performances"
ON "salaries"."player_id" = "players"."id"
AND "salaries"."player_id" = "performances"."player_id"
--AND "salaries"."team_id" = "performances"."team_id"
AND "salaries"."year" = "performances"."year"
ORDER BY "salaries"."player_id", "salaries"."year" DESC, "HR" DESC, "salary" DESC
;