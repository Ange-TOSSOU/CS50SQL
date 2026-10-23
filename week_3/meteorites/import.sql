CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" DECIMAL,
    "discovery" TEXT,
    "year" DECIMAL,
    "lat" DECIMAL,
    "long" DECIMAL
)
;

.import --csv meteorites.csv --skip 1 meteorites_temp

-- Clean "meteorites_temp" table columns.
-- Trim text columns.
UPDATE "meteorites_temp"
SET "name" = trim("name")
;

UPDATE "meteorites_temp"
SET "nametype" = trim("nametype")
;

UPDATE "meteorites_temp"
SET "class" = trim("class")
;

UPDATE "meteorites_temp"
SET "discovery" = trim("discovery")
;

-- Set empty values to NULL.
UPDATE "meteorites_temp"
SET "name" = NULL
WHERE "name" = ''
;

UPDATE "meteorites_temp"
SET "nametype" = NULL
WHERE "nametype" = ''
;

UPDATE "meteorites_temp"
SET "class" = NULL
WHERE "class" = ''
;

UPDATE "meteorites_temp"
SET "discovery" = NULL
WHERE "discovery" = ''
;

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE trim("mass") = ''
;

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE trim("year") = ''
;

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE trim("lat") = ''
;

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE trim("long") = ''
;

-- Round decimal values.
UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2)
WHERE "mass" IS NOT NULL
;

UPDATE "meteorites_temp"
SET "lat" = ROUND("lat", 2)
WHERE "lat" IS NOT NULL
;

UPDATE "meteorites_temp"
SET "long" = ROUND("long", 2)
WHERE "long" IS NOT NULL
;

-- Delete data with 'Relict' nametype.
DELETE FROM "meteorites_temp"
WHERE "nametype" LIKE 'Relict'
;

-- Transfer data from "meteorites_temp" table to "meteorites" table.
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" DECIMAL,
    "discovery" TEXT,
    "year" DECIMAL,
    "lat" DECIMAL,
    "long" DECIMAL,
    PRIMARY KEY("id")
)
;

INSERT INTO "meteorites"
("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
ORDER BY "year", "name"
;

DROP TABLE "meteorites_temp";
