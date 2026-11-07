CREATE DATABASE IF NOT EXISTS `mfa`;
USE `mfa`;

CREATE TABLE `collections` (
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(64) NOT NULL,
    `accession_number` VARCHAR(9) NOT NULL UNIQUE,
    `acquired` DATE,
    PRIMARY KEY(`id`)
);

INSERT INTO `collections` (`title`, `accession_number`, `acquired`)
VALUES 
('Farmers working at dawn', '11.6152', '1911-08-03'),
('Imaginative landscape', '56.496', NULL),
('Profusion of flowers', '56.257', '1956-04-12'),
('Spring outing', '14.76', '1914-01-08');

CREATE TABLE `artists` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);

INSERT INTO `artists` (`name`) 
VALUES 
('Li Yin'),
('Qian Weicheng'),
('Unidentified artist'),
('Zhou Chen');

CREATE TABLE `created` (
    `artist_id` INT,
    `collection_id` INT,
    PRIMARY KEY(`artist_id`, `collection_id`),
    FOREIGN KEY(`artist_id`) REFERENCES `artists`(`id`),
    FOREIGN KEY(`collection_id`) REFERENCES `collections`(`id`)
);

INSERT INTO `created` (`artist_id`, `collection_id`)
VALUES 
((SELECT `id` FROM `artists` WHERE `name` = 'Li Yin'), (SELECT `id` FROM `collections` WHERE `title` = 'Imaginative landscape')),
((SELECT `id` FROM `artists` WHERE `name` = 'Qian Weicheng'), (SELECT `id` FROM `collections` WHERE `title` = 'Profusion of flowers')),
((SELECT `id` FROM `artists` WHERE `name` = 'Unidentified artist'), (SELECT `id` FROM `collections` WHERE `title` = 'Farmers working at dawn')),
((SELECT `id` FROM `artists` WHERE `name` = 'Zhou Chen'), (SELECT `id` FROM `collections` WHERE `title` = 'Spring outing'));



ALTER TABLE `collections`
ADD COLUMN `deleted` TINYINT DEFAULT 0;

delimiter //
CREATE PROCEDURE `current_collection`()
BEGIN
SELECT `title`, `accession_number`, `acquired` 
FROM `collections` WHERE `deleted` = 0;
END//
delimiter ;

CALL `current_collection`();

UPDATE `collections` SET `deleted` = 1
WHERE `title` = 'Farmers working at dawn';
CALL `current_collection`();

CREATE TABLE `transactions` (
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(64) NOT NULL,
    `action` ENUM('bought', 'sold') NOT NULL,
    PRIMARY KEY(`id`) 
);

delimiter //
CREATE PROCEDURE `sell`(IN `sold_id` INT)
BEGIN
UPDATE `collections` SET `deleted` = 1
WHERE `id` = `sold_id`;
INSERT INTO `transactions` (`title`, `action`)
VALUES ((SELECT `title` FROM `collections` WHERE `id` = `sold_id`), 'sold');
END//
delimiter ;

CALL `sell`(2);
