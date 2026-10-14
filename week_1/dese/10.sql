SELECT "per_pupil_expenditure", "name"
FROM "districts" JOIN "expenditures"
ON "districts"."id" = "expenditures"."district_id"
WHERE "type" = 'Public School District'
ORDER BY "per_pupil_expenditure" DESC
LIMIT 10
;