-- districts and expenditures tables should be merged.
-- districts and staff_evaluations tables should be merged.
SELECT "name", "per_pupil_expenditure", "exemplary"
FROM "expenditures" JOIN "districts" JOIN "staff_evaluations"
ON "expenditures"."district_id" = "districts"."id"
AND "districts"."id" = "staff_evaluations"."district_id"
WHERE "type" = 'Public School District'
AND "per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure") FROM "expenditures"
)
AND "exemplary" > (
    SELECT AVG("exemplary") FROM "staff_evaluations"
)
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC
;