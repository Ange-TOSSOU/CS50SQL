CREATE DATABASE `linkedin`;
USE `linkedin`;

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);
INSERT INTO `users` (`first_name`, `last_name`, `username`, `password`)
VALUES
('Claudine', 'Gay', 'claudine', SHA1('password')),
('Reid', 'Hoffman', 'reid', SHA1('password'));

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    `year` SMALLINT NOT NULL,
    PRIMARY KEY(`id`)
);
INSERT INTO `schools` (`name`, `type`, `location`, `year`)
VALUES
('Harvard University', 'Higher Education', 'Cambridge, Massachusetts', '1636');

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);
INSERT INTO `companies` (`name`, `industry`, `location`)
VALUES
('LinkedIn', 'Technology', 'Sunnyvale, California');

CREATE TABLE `users_connections` (
    `user_id_a` INT,
    `user_id_b` INT,
    PRIMARY KEY(`user_id_a`, `user_id_b`),
    FOREIGN KEY(`user_id_a`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user_id_b`) REFERENCES `users`(`id`)
);

CREATE TABLE `school_affiliations` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `school_id` INT,
    `start_date` DATE,
    `end_date` DATE,
    `degree` VARCHAR(16),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`),
    CHECK(`start_date` IS NULL OR `end_date` IS NULL OR `end_date` >= `start_date`)
);
INSERT INTO `school_affiliations` (`user_id`, `school_id`, `start_date`, `end_date`, `degree`)
VALUES
(
    (SELECT `id` FROM `users` WHERE CONCAT(`first_name`, ' ', `last_name`) = 'Claudine Gay'),
    (SELECT `id` FROM `schools` WHERE `name` = 'Harvard University'),
    '1993-01-01',
    '1998-12-31',
    'PhD'
);

CREATE TABLE `company_affiliations` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `company_id` INT,
    `start_date` DATE,
    `end_date` DATE,
    `title` VARCHAR(64),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`),
    CHECK(`start_date` IS NULL OR `end_date` IS NULL OR `end_date` >= `start_date`)
);
INSERT INTO `company_affiliations` (`user_id`, `company_id`, `start_date`, `end_date`, `title`)
VALUES
(
    (SELECT `id` FROM `users` WHERE CONCAT(`first_name`, ' ', `last_name`) = 'Reid Hoffman'),
    (SELECT `id` FROM `companies` WHERE `name` = 'LinkedIn'),
    '2003-01-01',
    '2007-02-01',
    'CEO and Chairman'
);
