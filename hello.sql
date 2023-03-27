USE vet_clinic;
CREATE TABLE animals(
   id INT PRIMARY KEY  AUTO_INCREMENT   NOT NULL,
   name           TEXT            ,
   date_of_birth  DATE            ,
   escape_attempts INT            ,
   neutered  BOOLEAN              ,
   weight_kg DECIMAL(19,2)                     
);

