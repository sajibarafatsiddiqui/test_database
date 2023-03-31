/*Queries that provide answers to the questions from all projects.*/
SELECT * from animals where name like '%mon';
SELECT name from animals where date_of_birth
between '2016-01-01' and '2019-12-31';
SELECT name from animals where neutered = true and escape_attempts < 3;
SELECT date_of_birth from animals where name in ("Agumon","Pikachu");
select name,escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name <> "Gabumon";
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;
select * from animals;
BEGIN;
UPDATE ANIMALS SET species = 'unspecified';
select * from animals;
ROLLBACK;
select * from animals;

BEGIN;
delete from animals;
select * from animals;
rollback;
select * from animals;

BEGIN;
delete from animals where date_of_birth > '2022-01-01';
savepoint one;
update animals set weight_kg =  weight_kg*(-1);
select * from animals;
rollback to one;
select * from animals;
update animals  set weight_kg = weight_kg*(-1) where weight_kg<0;
commit;

select count(*) from animals;
select count(*) from animals where escape_attempts=0;
select avg(weight_kg) from animals;
select neutered,sum(escape_attempts) from animals group by neutered order by sum(escape_attempts) desc limit 1;
select species, min(weight_kg),max(weight_kg) from animals group by species ;
select avg(escape_attempts) as average from animals where extract(year from date_of_birth) between 1990 and 2000  group by species;

select a.name as Animals,o.full_name as Owner from animals a join owners o on (a.owner_id = o.id) where o.full_name="Melody Pond";
select a.name as Animals,s.name as Species from animals a join species s on (a.species_id = s.id) where s.name="Pokemon";
select o.full_name as Owner, a.name Animals from owners o left outer join animals a on (o.id=a.owner_id);
select s.name, count(a.species_id) from animals a join species s on (s.id = a.species_id) group by (a.species_id);
select o.full_name as Owner ,a.name as Animal, s.name as Species from animals a join owners o on (o.id = a.owner_id) join species s on (s.id = a.species_id) where s.name = "Digimon" and o.full_name="Jennifer Orwell";
select a.name as Animals, o.full_name as Owner, a.escape_attempts from animals a join owners o on (o.id = a.owner_id) where a.escape_attempts = 0
    -> and o.full_name ="Dean Winchester";
select o.full_name as Owner, max(a.owner_id) as Most_Animals from animals a join owners o on (o.id=a.owner_id) group by a.owner_id order by (a.owner_id) desc limit 1;




