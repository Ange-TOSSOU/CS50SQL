
-- *** The Lost Letter ***
SELECT "id" FROM "addresses" WHERE "address" LIKE '900 Somerville Avenue';
-- Now we now the id of the address from which the package was sent : 432.
SELECT * FROM "packages" WHERE "from_address_id" = 432;
-- Now we know packages sent by Anneke.
-- And the one with the id 384 seems to correspond to the one we're looking for, according to the coontents.
SELECT * FROM "scans" WHERE "package_id" = 384;
-- Now we know the address id where the package has been dropped : 854.
SELECT * FROM "addresses" WHERE "id" = 854;

-- *** The Devious Delivery ***
SELECT * FROM "packages" WHERE "from_address_id" IS NULL;
-- Now we know the id of the package with no from address : 5098, as well as its content : Duck debugger.
SELECT * FROM "scans" WHERE "package_id" = 5098;
-- Now we know the address id where the package has been dropped : 348.
SELECT * FROM "addresses" WHERE "id" = 348;

-- *** The Forgotten Gift ***
SELECT "id" FROM "addresses" WHERE "address" LIKE '109 Tileston Street';
-- Now we now the id of the address from which the package was sent : 9873.
SELECT "id" FROM "addresses" WHERE "address" LIKE '728 Maple Place';
-- Now we now the id of the address at which the package was sent : 4983.
SELECT * FROM "packages" WHERE "from_address_id" = 9873 AND "to_address_id" = 4983;
-- Now we know the id of the package sent : 9523, as well as its content : Flowers.
SELECT * FROM "scans" WHERE "package_id" = 9523;
-- Now we know the id of the driver who picked the package : 12432.
SELECT * FROM "drivers" WHERE "id" = 17;

