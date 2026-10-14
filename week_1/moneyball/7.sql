SELECT "first_name", "last_name"
FROM "salaries" JOIN "players"
ON "player_id" = "players"."id"
GROUP BY "player_id"
HAVING MAX("salary") = (
    SELECT MAX("salary")
    FROM "salaries"
)
;