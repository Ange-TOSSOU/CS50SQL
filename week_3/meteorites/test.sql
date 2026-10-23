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
WHERE "name" IS NOT NULL
;

UPDATE "meteorites_temp"
SET "nametype" = trim("nametype")
WHERE "nametype" IS NOT NULL
;

UPDATE "meteorites_temp"
SET "class" = trim("class")
WHERE "class" IS NOT NULL
;

UPDATE "meteorites_temp"
SET "discovery" = trim("discovery")
WHERE "discovery" IS NOT NULL
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
