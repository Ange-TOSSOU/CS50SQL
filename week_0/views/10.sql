-- Let's find great artworks
SELECT "english_title", "entropy", ("entropy" - (SELECT ROUND(AVG("entropy"), 2) FROM "views")) AS 'Entropy Average Distance'
FROM "views"
WHERE "entropy" > 5
ORDER BY "entropy" DESC
;
