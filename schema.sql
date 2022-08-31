/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
ID INT,
NAME  VARCHAR,
DATE_OF_BIRTH DATE,
ESCAPE_ATTEMPTS INT,
NEUTERED BOOLEAN,
WEIGHT_KG DECIMAL
Species VARCHAR 
);

CREATE TABLE owners(
id  SERIAL PRIMARY KEY,
full_name VARCHAR(50),
age int
);
CREATE TABLE

CREATE TABLE species(
id  SERIAL PRIMARY KEY,
name VARCHAR(50)
);
CREATE TABLE

CREATE TABLE vets ( 
id INT GENERATED ALWAYS AS IDENTITY,
name varchar(100),
age INT,
date_of_graduation DATE,
PRIMARY KEY(id) 
);
 
CREATE TABLE specialization (
vets_id INT,
species_id INT,
PRIMARY KEY(vets_id, species_id),
CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id)
);
 
CREATE TABLE visits (
animals_id INT,
vets_id INT,
date_of_visit DATE,
PRIMARY KEY(animals_id,vets_id,date_of_visit),
CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);