SELECT COUNT(*) AS "number_of_hokusai_prints_about_fuji"
FROM "views"
WHERE "artist" = 'Hokusai'
AND "english_title" LIKE '%Fuji%'
;