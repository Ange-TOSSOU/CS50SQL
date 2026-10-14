-- districts and expenditures tables should be merged.
SELECT "name", "per_pupil_expenditure", "graduated"
FROM "graduation_rates" JOIN "schools" JOIN "expenditures"
ON "graduation_rates"."school_id" = "schools"."id"
AND "schools"."district_id" = "expenditures"."district_id"
ORDER BY "per_pupil_expenditure" DESC, "name"
;