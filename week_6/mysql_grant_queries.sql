CREATE USER 'carter' IDENTIFIED BY 'password';

USE `mfa`;
GRANT SELECT ON `mfa`.`collections` TO 'carter';
