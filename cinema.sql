-- Supprimer la base si elle existe déjà
DROP DATABASE IF EXISTS CinemaDB;

-- Créer la base de données
CREATE DATABASE CinemaDB;
USE CinemaDB;

-- Table acteur
CREATE TABLE acteur (
    id_acteur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    nationalite VARCHAR(50)
);

-- Table film
CREATE TABLE film (
    id_film INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(100),
    annee INT,
    genre VARCHAR(50)
);

-- Table de liaison
CREATE TABLE acteur_joue_film (
    id_acteur INT,
    id_film INT,
    PRIMARY KEY (id_acteur, id_film),
    FOREIGN KEY (id_acteur) REFERENCES acteur(id_acteur),
    FOREIGN KEY (id_film) REFERENCES film(id_film)
);

-- Insérer des acteurs
INSERT INTO acteur (id_acteur, nom, prenom, nationalite) VALUES
(1, 'DiCaprio', 'Leonardo', 'Américain'),
(2, 'Johansson', 'Scarlett', 'Américaine'),
(3, 'Deneuve', 'Catherine', 'Française');

-- Insérer des films
INSERT INTO film (id_film, titre, annee, genre) VALUES
(1, 'Inception', 2010, 'Science-Fiction'),
(2, 'Avengers', 2012, 'Action'),
(3, 'Les Parapluies de Cherbourg', 1964, 'Drame');

-- Insérer les liaisons
INSERT INTO acteur_joue_film (id_acteur, id_film) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 2);