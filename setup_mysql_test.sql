-- prepares a MySQL server for the project

CREATE DATABASE IF NOT EXISTS fakkah_test_db;
CREATE USER IF NOT EXISTS 'fakkah_test'@'localhost' IDENTIFIED BY 'fakkah_test_pwd';
GRANT ALL PRIVILEGES ON `fakkah_test_db`.* TO 'fakkah_test'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'fakkah_test'@'localhost';
FLUSH PRIVILEGES;
