-- prepares a MySQL server for the project

CREATE DATABASE IF NOT EXISTS fakkah_dev_db;
CREATE USER IF NOT EXISTS 'fakkah_dev'@'localhost' IDENTIFIED BY 'fakkah_dev_pwd';
GRANT ALL PRIVILEGES ON `fakkah_dev_db`.* TO 'fakkah_dev'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'fakkah_dev'@'localhost';
FLUSH PRIVILEGES;
