SELECT * FROM (
    SELECT "first_name", "last_name"
    FROM "salaries" JOIN "players" JOIN "performances"
    ON "salaries"."player_id" = "players"."id"
    AND "salaries"."player_id" = "performances"."player_id"
    AND "salaries"."year" = "performances"."year"
    AND "salaries"."year" = '2001'
    AND "H" > 0
    ORDER BY "salary"/"H"
    LIMIT 10
)
INTERSECT
SELECT * FROM (
    SELECT "first_name", "last_name"
    FROM "salaries" JOIN "players" JOIN "performances"
    ON "salaries"."player_id" = "players"."id"
    AND "salaries"."player_id" = "performances"."player_id"
    AND "salaries"."year" = "performances"."year"
    AND "salaries"."year" = '2001'
    AND "RBI" > 0
    ORDER BY "salary"/"RBI"
    LIMIT 10
)
ORDER BY "last_name"
;