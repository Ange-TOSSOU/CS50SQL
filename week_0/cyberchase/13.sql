SELECT COUNT(*) AS "number_of_episode_in_season_11_aired_in_december"
FROM "episodes"
WHERE "season" = 11 AND "air_date" LIKE '____-12-__'
;