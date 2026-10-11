SELECT "birth_state", COUNT("birth_state") AS "number_of_right_handed_players_by_state"
FROM "players"
WHERE "bats" = 'R'
GROUP BY "birth_state"
ORDER BY "birth_state"
;