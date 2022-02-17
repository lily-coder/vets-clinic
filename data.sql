/* Populate database with sample data. */
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (1, 'Agumon', '2020-02-03', 10.23, TRUE, 0);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (2, 'Gabumon', '2018-11-15', 8.0, TRUE, 2);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (3, 'Pikachu', '2021-01-07', 15.04, FALSE, 1);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (4, 'Devimon', '2017-05-12', 11.0, TRUE, 5);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (5, 'Charmander', '2020-02-08', -11.0, FALSE, 0);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (6, 'Plantmon', '2022-11-15', -5.7, TRUE, 2);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (7, 'Squirtle', '1993-04-02', -12.13, FALSE, 3);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (8, ' Angemon', '2005-06-12', -45, TRUE, 1);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (9, ' Boarmon', '2005-06-07', 20.4, TRUE, 7);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (10, ' Blossom', '1998-10-13', 17, TRUE, 3);
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');
UPDATE animals SET species_id = (SELECT id from species WHERE name = 'Digimon') WHERE name like '%mon';
UPDATE animals SET species_id = (SELECT id from species WHERE name = 'Pokemon') WHERE species_id IS NULL;
BEGIN
    UPDATE animals SET owners_id = (SELECT id from owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
    UPDATE animals SET owners_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';
    UPDATE animals SET owners_id = (SELECT id from owners WHERE full_name = 'Bob') WHERE name = 'Devimon' OR name = 'Plantmon';
    UPDATE animals SET owners_id = (SELECT id from owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
    UPDATE animals SET owners_id = (SELECT id from owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon'  OR name = 'Boarmon';
COMMIT;

