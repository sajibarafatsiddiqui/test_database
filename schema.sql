/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;
USE vet_clinic;
CREATE TABLE animals(
   id INT PRIMARY KEY     NOT NULL,
   name           TEXT            ,
   date_of_birth  DATE            ,
   escape_attempts INT            ,
   neutered  BOOLEAN              ,
   weight_kg DECIMAL(10,2)                    
);
ALTER TABLE ANIMALS ADD species varchar(50);

CREATE TABLE owners(
   id INT PRIMARY KEY     NOT NULL AUTO_INCREMENT,
   full_name    varchar(200),
   age INT );

CREATE TABLE species(
   id INT PRIMARY KEY     NOT NULL AUTO_INCREMENT,
   name    varchar(200) );


 ALTER TABLE animals CHANGE COLUMN `id` `id` INT
    ->  NOT NULL AUTO_INCREMENT;