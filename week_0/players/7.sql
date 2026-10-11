SELECT COUNT(*) AS "number_of_players_battng_and_throwing_with_different_hands"
FROM "players"
WHERE ("bats" LIKE 'R' AND "throws" LIKE 'L')
OR ("bats" LIKE 'L' AND "throws" LIKE 'R')
;