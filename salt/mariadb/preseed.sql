create database animals;
use animals;
CREATE TABLE animals (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(1024));
GRANT ALL ON animals.* TO animals@localhost IDENTIFIED BY ‘salainen’;
INSERT INTO animals(name) VALUES (“Horse”);

