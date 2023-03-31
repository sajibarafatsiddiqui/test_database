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

 alter table animals drop column species;

 Alter table animals add species_id int, add constraint fk_speciesId foreign key(species_id) references species(id);
 Alter table animals add owner_id int, add constraint fk_ownerId foreign key(owner_id) references owners(id);

create table vets ( id int primary key not null auto_increment,
    -> name varchar(200),
    -> age int,
    -> date_of_graduation date);

create table specializations(vet_id int references vets(id),
    -> species_id int references species(id));

create table visits (animals_id int references animals(id),
    -> vets_id int references vets(id),
    -> visit_date date);