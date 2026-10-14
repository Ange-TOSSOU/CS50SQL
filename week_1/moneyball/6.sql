SELECT "name", SUM("H") AS "total hits"
FROM "performances" JOIN "teams"
ON "team_id" = "teams"."id"
WHERE "performances"."year" = '2001'
GROUP BY "team_id"
ORDER BY "total hits" DESC
LIMIT 5
;