CREATE DATABASE "mbta";
\c "mbta"

CREATE TABLE "cards" (
    "id" SERIAL,
    PRIMARY KEY("id")
);

CREATE TYPE "station_line"
AS ENUM ('blue', 'green', 'orange', 'red', 'silver');
CREATE TABLE "stations" (
    "id" SERIAL,
    "name" VARCHAR(32) NOT NULL,
    "line" "station_line" NOT NULL,
    PRIMARY KEY("id")
);

CREATE TYPE "swipe_type"
AS ENUM ('enter', 'exit', 'deposit');
CREATE TABLE "swipes" (
    "id" SERIAL,
    "card_id" SERIAL,
    "station_id" SERIAL,
    "type" "swipe_type" NOT NULL,
    "datetime" TIMESTAMP NOT NULL DEFAULT now(),
    "amount" NUMERIC(5, 2) NOT NULL CHECK("amount" != 0),
    PRIMARY KEY("id"),
    FOREIGN KEY("card_id") REFERENCES "cards"("id"),
    FOREIGN KEY("station_id") REFERENCES "stations"("id")
);
