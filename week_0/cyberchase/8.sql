SELECT COUNT(*) AS "number_of_episodes_from_2018_to_2023"
FROM "episodes"
WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-12'
;