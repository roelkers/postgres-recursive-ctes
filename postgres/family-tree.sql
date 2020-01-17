--
-- PostgreSQL database dump
--
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;
--- drop tables
DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS parent_child;

CREATE TABLE person(
    person_id INT PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL
);

CREATE TABLE parent_child(
    parent_id INT REFERENCES person(person_id) NOT NULL,
    child_id INT REFERENCES person(person_id) NOT NULL
);

INSERT INTO person(person_id, first_name, last_name) VALUES (1, 'Anna', 'Hermann' );
INSERT INTO person(person_id, first_name, last_name) VALUES (2, 'Peter', 'Hermann' );
INSERT INTO person(person_id, first_name, last_name) VALUES (3, 'Ludwig', 'Hermann' );
INSERT INTO person(person_id, first_name, last_name) VALUES (4, 'Frauke', 'Hermann' );
INSERT INTO person(person_id, first_name, last_name) VALUES (5, 'Norbert', 'Thomann' );
INSERT INTO person(person_id, first_name, last_name) VALUES (6, 'Lisa', 'Thomann' );
INSERT INTO person(person_id, first_name, last_name) VALUES (7, 'Norbert', 'Thomann' );
INSERT INTO person(person_id, first_name, last_name) VALUES (8, 'Hugo', 'Thomann' );
INSERT INTO person(person_id, first_name, last_name) VALUES (9, 'Igor', 'Thomann' );
INSERT INTO person(person_id, first_name, last_name) VALUES (10, 'Mia', 'Thomann' );
INSERT INTO person(person_id, first_name, last_name) VALUES (11, 'Manfred', 'Hermann' );
INSERT INTO person(person_id, first_name, last_name) VALUES (12, 'Ulla', 'Hermann' );

INSERT INTO parent_child(parent_id, child_id) VALUES (1,3);
INSERT INTO parent_child(parent_id, child_id) VALUES (2,3);
INSERT INTO parent_child(parent_id, child_id) VALUES (1,4);
INSERT INTO parent_child(parent_id, child_id) VALUES (2,4);
INSERT INTO parent_child(parent_id, child_id) VALUES (5,7);
INSERT INTO parent_child(parent_id, child_id) VALUES (6,7);
INSERT INTO parent_child(parent_id, child_id) VALUES (5,8);
INSERT INTO parent_child(parent_id, child_id) VALUES (6,8);
INSERT INTO parent_child(parent_id, child_id) VALUES (5,9);
INSERT INTO parent_child(parent_id, child_id) VALUES (6,9);
INSERT INTO parent_child(parent_id, child_id) VALUES (5,10);
INSERT INTO parent_child(parent_id, child_id) VALUES (6,10);
INSERT INTO parent_child(parent_id, child_id) VALUES (3,11);
INSERT INTO parent_child(parent_id, child_id) VALUES (10,11);
INSERT INTO parent_child(parent_id, child_id) VALUES (3,12);
INSERT INTO parent_child(parent_id, child_id) VALUES (10,12);