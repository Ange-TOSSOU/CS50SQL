CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" INTEGER CHECK("gluten_free" IS NULL OR "gluten_free" IN (0, 1)),
    "price_per_donut" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "composition" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    PRIMARY KEY("donut_id", "ingredient_id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "donut_id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);
