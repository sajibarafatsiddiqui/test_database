SELECT * from animals where name like '%mon';
SELECT name from animals where date_of_birth
between '2016-01-01' and '2019-12-31';
SELECT name from animals where neutered = true and escape_attempts < 3;
SELECT date_of_birth from animals where name in ("Agumon","Pikachu");
select name,escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name <> "Gabumon";
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;