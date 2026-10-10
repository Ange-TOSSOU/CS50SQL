SELECT COUNT(*) AS "number_of_episodes_from_2000_to_2007"
FROM "episodes"
WHERE "air_date" BETWEEN '2000-01-01' AND '2007-12-12'
;