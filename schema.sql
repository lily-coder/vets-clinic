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