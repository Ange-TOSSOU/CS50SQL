-- Schema for bank DB

CREATE DATABASE IF NOT EXISTS `bank`;
USE `bank`;

CREATE TABLE `accounts` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(16),
    `balance` INT,
    PRIMARY KEY(`id`)
);

INSERT INTO `accounts` (`name`, `balance`)
VALUES
('Alice', 10),
('Bob', 20),
('Charlie', 30);

SELECT * FROM `accounts`
WHERE `id` = 1;

SELECT * FROM `accounts`
WHERE `id` = 1 UNION
SELECT * FROM `accounts`;

PREPARE `balance_check`
FROM 'SELECT * FROM `accounts`
WHERE `id` = ?';

SET @id = 1;
EXECUTE `balance_check` USING @id;

SET @id = '1 UNION SELECT * FROM `accounts`';
EXECUTE `balance_check` USING @id;
