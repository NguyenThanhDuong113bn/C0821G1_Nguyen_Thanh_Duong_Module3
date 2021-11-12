CREATE DATABASE student_management01;

USE student_management01;

CREATE TABLE student (
	id INT PRIMARY KEY,
    `name` VARCHAR(255),
    age INT,
    country VARCHAR(255)
);