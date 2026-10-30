CREATE TABLE "decoder" (
    "id" INTEGER,
    "sentence_id" INTEGER,
    "start" INTEGER,
    "length" INTEGER,
    PRIMARY KEY("id")
)
;

INSERT INTO "decoder" ("sentence_id", "start", "length")
VALUES
(14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630, 7, 3),
(932, 12, 5),
(2230, 50, 7),
(2346, 44, 10),
(3041, 14, 5)
;

CREATE VIEW "message_parts" AS
SELECT substr("sentence", "start", "length") AS "part"
FROM "decoder"
JOIN "sentences" ON "decoder"."sentence_id" = "sentences"."id"
;

CREATE VIEW "message" AS
SELECT GROUP_CONCAT("part", ' ') AS "phrase"
FROM "message_parts"
;
