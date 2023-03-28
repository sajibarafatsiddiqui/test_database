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

