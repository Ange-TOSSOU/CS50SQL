SELECT DISTINCT "name"
FROM "players" JOIN "performances" JOIN "teams"
ON "players"."id" = "player_id"
AND "team_id" = "teams"."id"
WHERE "first_name" = 'Satchel'
AND "last_name" = 'Paige'
;