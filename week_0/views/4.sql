SELECT COUNT(*) AS "number_of_hiroshige_prints_about_tokyo"
FROM "views"
WHERE "artist" = 'Hiroshige'
AND "english_title" LIKE '%Eastern Capital%'
;