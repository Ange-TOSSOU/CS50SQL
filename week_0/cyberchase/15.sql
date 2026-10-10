SELECT MIN("air_date") AS "first_release_dates"
FROM "episodes"
GROUP BY strftime('%Y', "air_date")
;