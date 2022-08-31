/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animals WHERE NAME LIKE '%mon';

SELECT NAME FROM animals WHERE DATE_OF_BIRTH BETWEEN '2016-01-01' AND '2019-12-31';

SELECT NAME FROM animals WHERE NEUTERED = true AND ESCAPE_ATTEMPTS < 3;

SELECT NAME, DATE_OF_BIRTH FROM animals WHERE NAME IN ('Agumon','Pikachu');

SELECT NAME, ESCAPE_ATTEMPTS FROM animals WHERE WEIGHT_KG > 10.5;

SELECT * FROM animals WHERE NEUTERED = TRUE;

SELECT * FROM animals WHERE NOT NAME = 'Gabumon';

SELECT * FROM animals WHERE WEIGHT_KG >= 10.4 AND WEIGHT_KG <= 17.3;

BEGIN;
UPDATE animals set species='digimon' WHERE NAME like '%mon';
UPDATE 6
UPDATE animals set species='Pokemon' WHERE NAME Not like '%mon';
UPDATE 5
DELETE FROM animals;
DELETE 11
ROLLBACK;
ROLLBACK
 

 
SELECT NAME FROM animals WHERE NEUTERED = true AND ESCAPE_ATTEMPTS < 3;

SELECT NAME, DATE_OF_BIRTH FROM animals WHERE NAME IN ('Agumon','Pikachu');

SELECT NAME, ESCAPE_ATTEMPTS FROM animals WHERE WEIGHT_KG > 10.5;

 
SELECT * FROM animals WHERE NEUTERED = TRUE;

SELECT * FROM animals WHERE NOT NAME = 'Gabumon';

select count(*) from animals;

select count(escape_attempts) from animals where escape_attempts = 0;

select avg(weight_kg) from animals;

select max(escape_attempts) from animals;

select name from animals where escape_attempts = 7;

select species, min(weight_kg), max(weight_kg) from animals group by species;

select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-12-31' group by species;

DELETE * FROM animals;
BEGIN;
DELETE FROM animals WHERE name='Bolossom';
COMMIT;

DELETE FROM animals WHERE weight_kg=11;
ROLLBACK;

SAVEPOINT save_point1;
DELETE FROM animals WHERE name='Agumon';
ROLLBACK to save_point1;

SELECT * FROM animals;
UPDATE animals SET weight_kg= weight_kg * -1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg<0;
COMMIT;

UPDATE animals set species='unspecified';

update animals set species = 'digimon' where name like '%mon';

update animals set species = 'pokemon' where not species = 'digimon';

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE

ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE

ALTER TABLE animals ADD species_id INTEGER;
ALTER TABLE
ALTER TABLE animals ADD owners_id INTEGER;
ALTER TABLE
alter table animals add constraint FK_species FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE
alter table animals add constraint FK_owners FOREIGN KEY (owners_id) REFERENCES owners(id);
ALTER TABLE

UPDATE animals 
set species='unspecified';

update animals
set species = 'digimon'
where name like '%mon';

update animals
set species = 'pokemon'
where not species = 'digimon';

SELECT name,full_name FROM animals JOIN owners ON owners_id= owners.id AND owners.full_name='Melody Pond';

SELECT animals.name AS Pokemon FROM animals JOIN species ON species_id=species.id AND name='Pokemon';

SELECT name, full_name FROM animals FULL OUTER JOIN owners owner_id=owners.id;

SELECT species.name AS species FROM species JOIN animals ON species.id = species_id GROUP BY species;

SELECT owners.full_name AS owners, animals.name AS animals FROM owners INNER JOIN species ON owners.full_name= 'Jenifer Orwell' AND species.name =' Digimon'INNER  JOIN animals ON owners.id= owners_id AND species.id= species_id;

SELECT owners.full_name as Owners,animals.name as animals FROM owners JOIN  animals ON   Owners.id = owner_id AND owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name AS Owners,count(*) FROM owners JOIN  animals ON  owners.id = owner_id GROUP BY Owners ORDER BY count DESC LIMIT 1; 

select name, full_name from animals JOIN owners ON owners_id = owners.id or owners_id is null;

select name, full_name from animals JOIN owners ON owners_id = owners.id AND owners.full_name='Jennifer Orwell' And species_id=2;

select name, full_name from animals JOIN owners ON owners_id = owners.id;

UPDATE animals
   SET species_id = (SELECT id from species WHERE name = 'Digimon')
   WHERE name like '%mon';

UPDATE animals
   SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
   WHERE name = 'Agumon';


SELECT animals.name FROM animals JOIN  visits ON  animals.id = animals_id JOIN vets ON vets_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;

 
SELECT COUNT(DISTINCT animals.name) FROM animals JOIN  visits ON  animals.id = animals_id JOIN vets ON vets_id = vets.id WHERE vets.name = 'Stephanie Mendez';

 
SELECT vets.name AS vet,species.name AS specialization FROM vets JOIN  specialization ON  vets.id = vets_id JOIN species ON species_id = species.id;

 
SELECT animals.name FROM animals JOIN  visits ON  animals.id = animals_id JOIN vets ON vets_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, count(*) FROM animals JOIN  visits ON  animals.id = animals_id JOIN vets ON vets_id = vets.id GROUP BY animals.name ORDER BY count DESC LIMIT 1;

 
SELECT animals.name,date_of_visit FROM animals JOIN  visits ON  animals.id = animals_id JOIN vets ON vets_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY date_of_visit LIMIT 1;

 
SELECT animals.name,date_of_birth,escape_attempts,neutered,weight_kg,species.name as specie, vets.name as vet_name,vets.age as vet_age,date_of_graduation ,date_of_visit FROM species JOIN animals ON animals.species_id = species.id JOIN  visits ON  animals.id = animals_id JOIN vets ON visits.vets_id = vets.id ORDER BY date_of_visit DESC LIMIT 1;

SELECT vets.name,count(*) FROM visits JOIN  vets ON vets.id = visits.vets_id LEFT JOIN specialization ON vets.id = specialization.vets_id WHERE specialization.vets_id IS NULL GROUP BY vets.name;

SELECT species.name AS specialization,count(*) AS number_of_visits FROM species JOIN  animals ON species.id = animals.species_id JOIN visits ON animals.id  = visits.animals_id JOIN vets ON visits.vets_id = vets.id  WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY number_of_visits DESC LIMIT 1;



EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;

CREATE INDEX animals_id_asc ON visits (animals_id ASC);

EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;

CREATE INDEX vets_id_asc ON visits (vets_id ASC);

EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';

CREATE INDEX email_asc ON owners (email ASC);









