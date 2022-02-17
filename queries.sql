/*Queries that provide answers to the questions from all projects.*/

SELECT name from animals WHERE name like '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31';
SELECT name from animals WHERE neutered IS TRUE and escape_attempts <3;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg >10.5;
SELECT name from animals WHERE neutered IS TRUE;
SELECT name from animals WHERE name NOT IN ('Gabumon');
SELECT name from animals WHERE weight_kg BETWEEN 10.4 and 17.3;
SELECT name from animals WHERE neutered IS TRUE;
SELECT name from animals WHERE name NOT IN ('Gabumon');
SELECT name from animals WHERE weight_kg BETWEEN 10.4 and 17.3;

BEGIN;
    UPDATE animals SET species='unspecified';
    SELECT species FROM animals;
    ROLLBACK;
    SELECT species FROM animals;

BEGIN;
	SELECT * FROM animals;
	UPDATE animals SET species='digimon' WHERE name like '%mon';
	UPDATE animals SET species='pokemon' WHERE species IS NULL;
	SELECT * FROM animals;
	COMMIT;
	SELECT * FROM animals;
BEGIN;
	DELETE FROM animals;
	SELECT * FROM animals;
	ROLLBACK;
	SELECT * FROM animals;
BEGIN;
	DELETE from animals WHERE date_of_birth > '2022-01-01';
	SELECT * FROM animals;
	SAVEPOINT yeartwentytwo;
	SELECT * FROM animals;
	UPDATE animals SET weight_kg = weight_kg * -1;
	SELECT * FROM animals;
	ROLLBACK TO yeartwentytwo;
	SELECT * FROM animals;
	UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg<0;
	SELECT * FROM animals;
	COMMIT;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, 
	MAX(escape_attempts) FROM animals
	GROUP BY neutered;
SELECT species,
	MAX(weight_kg), MIN(weight_kg) FROM animals
	GROUP BY species;
SELECT species,
	AVG(escape_attempts) FROM animals
	WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
	GROUP BY species;

SELECT * FROM animals
   LEFT JOIN owners
   ON animals.owners_id = owners.id
   WHERE full_name = 'Melody Pond';

SELECT * FROM animals
   LEFT JOIN species
   ON animals.species_id = species.id
   WHERE species.name = 'Pokemon';

SELECT full_name,
	animals.name 
	FROM owners
	LEFT JOIN animals
	ON animals.owners_id = owners.id;

SELECT species.name, COUNT(*) FROM animals
   LEFT JOIN species
   ON animals.species_id = species.id
   GROUP BY species.name;

SELECT animals.name FROM animals
   LEFT JOIN owners
   ON animals.owners_id = owners.id
   LEFT JOIN species
   ON animals.species_id = species.id
   WHERE owners.full_name = 'Jennifer Orwell'
   AND species.name = 'Digimon';

SELECT animals.* FROM animals
	LEFT JOIN owners
	ON owners.id = animals.owners_id
  	WHERE owners.full_name = 'Dean Winchester'
  	AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.name) FROM animals
   LEFT JOIN owners
   ON animals.species_id = owners.id
   GROUP BY owners.full_name
   ORDER BY COUNT(owners.full_name) DESC LIMIT 1;
