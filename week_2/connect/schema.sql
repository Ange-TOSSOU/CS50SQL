CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT,
    "location" TEXT,
    "year" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "users_connections" (
    "user_id_a" INTEGER,
    "user_id_b" INTEGER,
    PRIMARY KEY("user_id_a", "user_id_b"),
    FOREIGN KEY("user_id_a") REFERENCES "users"("id"),
    FOREIGN KEY("user_id_b") REFERENCES "users"("id")
);

CREATE TABLE "school_affiliations" (
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC,
    "end_date" NUMERIC CHECK("start_date" IS NULL OR "end_date" IS NULL OR "end_date" >= "start_date"),
    "degree" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "company_affiliations" (
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC,
    "end_date" NUMERIC CHECK("start_date" IS NULL OR "end_date" IS NULL OR "end_date" >= "start_date"),
    "title" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
