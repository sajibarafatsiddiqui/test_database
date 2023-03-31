/* Populate database with sample data. */
USE vet_clinic;
INSERT INTO ANIMALS (id,name,date_of_birth,weight_kg,neutered,escape_attempts)
values (1,'Agumon','2020-02-03',10.23,true,0);
INSERT INTO ANIMALS (id,name,date_of_birth,weight_kg,neutered,escape_attempts)
values (2,'Gabumon','2018-11-15',8.0,true,2);
INSERT INTO ANIMALS (id,name,date_of_birth,weight_kg,neutered,escape_attempts)
values (3,'Pikachu','2021-01-07',15.04,false,1);
INSERT INTO ANIMALS (id,name,date_of_birth,weight_kg,neutered,escape_attempts)
values (4,'Devimon','2017-05-12',11.0,true,5);


INSERT INTO ANIMALS (id,name,date_of_birth,weight_kg,neutered,escape_attempts)
values (5,'Charmander','2020-02-08',-11.0,false,0),(6,'Plantmon','2021-11-15',-5.7,true,2),
(7,'Squirtle','1993-04-02',-12.13,false,3),(8,'Angemon','2005-06-12',-45.0,true,1),
(9,'Boarmon','2005-06-07',20.4,true,7),(10,'Blossom','1998-10-13',17.0,true,3),
(11,'Ditto','2022-05-14',22.0,true,4)

begin;
 INSERT INTO owners (full_name,age) VALUES ("Sam Smith",34),("Jennifer Orwell",19),("Bob",45),("Melody Pond",77),("Dean Winchester",14),("Jodie Whittaker",38);
  insert into species (name) value ('Pokemon'),('Digimon');
  commit;
begin;
update animals set species_id = (select id from species where name ='Digimon') where name like '%mon';
update animals set species_id = (select id from species where name ='Pokemon') where species_id is null;
commit;

begin;
update animals set owner_id = (select id from owners where full_name="Sam Smith") where name = "Agumon";
update animals set owner_id = (select id from owners where full_name="Jennifer Orwell") where name in ("Gabumon","Pikachu");
update animals set owner_id = (select id from owners where full_name="Bob") where name in ("Devimon","Plantmon");
update animals set owner_id = (select id from owners where full_name="Melody Pond") where name in ("Charmander", "Squirtle","Blossom");
update animals set owner_id = (select id from owners where full_name="Dean Winchester") where name in ("Angemon","Boarmon");
commit;

begin ;
insert into vets(name,age,date_of_graduation) values ("William Tatcher",45,"2020-04-23"),("Maisy Smith",26,"2019-01-17"),("Stephanie Mendez",64,"1981-05-04"),("Jack Harkness",38,"2008-06-08");
commit;

begin;
INSERT INTO specializations (vet_id, species_id) 
VALUES ((SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM species WHERE species.name = 'Pokemon')),
((SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM species WHERE species.name = 'Digimon')),
((SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM species WHERE species.name = 'Pokemon')),
((SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM species WHERE species.name = 'Digimon'));
commit;

begin;
INSERT INTO visits (visit_date, vets_id, animals_id) 
VALUES ('2020-05-24', (SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM animals WHERE animals.name = 'Agumon')),
('2020-07-22', (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE animals.name = 'Agumon')),
('2021-02-02', (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM animals WHERE animals.name = 'Gabumon')),
('2020-01-05', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Pikachu')),
('2020-03-08', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Pikachu')),
('2020-05-14', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Pikachu')),
('2021-05-04', (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE animals.name = 'Devimon')),
('2021-02-24', (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM animals WHERE animals.name = 'Charmander')),
('2019-12-21', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Plantmon')),
('2020-08-10', (SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM animals WHERE animals.name = 'Plantmon')),
('2021-04-07', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Plantmon')),
('2019-09-29', (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE animals.name = 'Squirtle')),
('2020-10-03', (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM animals WHERE animals.name = 'Angemon')),
('2020-11-04', (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM animals WHERE animals.name = 'Angemon')),
('2019-02-24', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Boarmon')),
('2019-05-15', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Boarmon')),
('2020-02-27', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Boarmon')),
('2020-08-03', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Boarmon')),
('2020-05-24', (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE animals.name = 'Blossom')),
('2021-01-11', (SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM animals WHERE animals.name = 'Blossom'));
commit;








