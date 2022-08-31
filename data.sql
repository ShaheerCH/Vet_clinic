/* Populate database with sample data. */

INSERT INTO animals VALUES(1,'Agumon','Feb 03, 2020',0,true,10.23);

INSERT INTO animals VALUES(2,'Gabumon','Nov 15, 2018',2,true,8);

INSERT INTO animals VALUES(3,'Pikachu','Jan 07, 2021',1,false,15.04);

INSERT INTO animals VALUES(4,'Devimon','May 12, 2017',5,true,11);

INSERT INTO animals VALUES(5,'Charmander', 'feb 08,2020',0,false,-11);

INSERT INTO animals VALUES(6,'Plantmon', 'nov 15,2021',2,true,-5.7);

INSERT INTO animals VALUES(7,'Squirtle', 'apr 02,1993',3,false,-12.13);

INSERT INTO animals VALUES(8,'Angemon', 'jul 07,2005',1,true,-45);

INSERT INTO animals VALUES(9,'Boarmon', 'jul 07,2005',7,true,20.14);

INSERT INTO animals VALUES(10,'Blossom', 'oct 13,1998',3,true,17);

INSERT INTO animals VALUES(11,'Ditto', 'may 14,2022',4,true,22,);

INSERT INTO  owners (full_name,age) VALUES
('Sam Smith', 34),
('Jennifer Orwell',19),
('Bob',45),
('Melody Pond',77),
('Dean Winchester',14),
('Jodie Whittaker',38);

INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');

INSERT INTO vets (name, age, date_of_graduation )
VALUES 
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

 
INSERT INTO specialization (vets_id, species_id ) 
VALUES 
( 1, 1),
( 3, 1),
( 3, 2),
( 4, 2);

 :
INSERT INTO visits (animals_id, vets_id, date_of_visit ) 
VALUES 
( 1, 1, '2020-05-24'),
( 1, 3, '2020-07-22'),
( 2, 4, '2021-02-02'),
( 3, 2, '2020-01-05'),
( 3, 2, '2020-03-08'),
( 3, 2, '2020-05-14'),
( 4, 3, '2021-05-04'),
( 5, 4, '2021-02-24'),
( 6, 2, '2019-12-21'),
( 6, 1, '2020-08-10'),
( 6, 2, '2021-04-07'),
( 7, 3, '2019-09-29'),
( 8, 4, '2020-10-03'),
( 8, 4, '2020-11-04'),
( 9, 2, '2019-01-24'),
( 9, 2, '2019-05-15'),
( 9, 2, '2019-08-16'),
( 9, 2, '2019-12-17'),
( 12, 3, '2020-12-17'),
( 12, 3, '2020-12-21'); 

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animals_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';