-- Compare schools in term of dropped percentage.
SELECT "name", "dropped"
FROM "graduation_rates" JOIN "schools"
ON "graduation_rates"."school_id" = "schools"."id"
ORDER BY "dropped"
;