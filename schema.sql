CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id int NOT NULL IDENTITY(1,1),
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
);

ALTER TABLE animals 
    ADD species VARCHAR;

ALTER TABLE animals
ADD PRIMARY KEY (ID);

CREATE TABLE owners(
	id SERIAL PRIMARY KEY,                    
	full_name VARCHAR,   
	age INT,
);

CREATE TABLE species(
	id SERIAL PRIMARY KEY,
	name VARCHAR
);

ALTER TABLE animals DROP species;

ALTER TABLE animals
	ADD COLUMN species_id INT
	REFERENCES species(id)
;

ALTER TABLE animals 
	ADD COLUMN owners_id INT
	REFERENCES owners(id)
;

CREATE TABLE vets(
    id SERIAL,
    name VARCHAR,
    age INT,
    date_of_graduation DATE,
	PRIMARY KEY (id)
);

CREATE TABLE specializations(
	species_id INT,
	vets_id INT
);

CREATE TABLE visits(
	animals_id INT,
	vets_id INT,
    date_of_visit DATE
);
