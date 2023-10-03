-- Création de la BDD --
CREATE DATABASE ProjetCinema DEFAULT CHARACTER SET utf8;

-- Utilisation de la BDD
USE ProjetCinema;

-- CREATION DES TABLES --

-- Création de la table user
CREATE TABLE user (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  email VARCHAR(180) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  roles VARCHAR(50) NOT NULL
);

-- Création de la table cinema
CREATE TABLE cinema (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(255) NOT NULL,
  rooms_nb INT NOT NULL
);

-- Création de la table employee
CREATE TABLE employee (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  id_user INT NOT NULL,
  id_cinema INT NOT NULL,
  FOREIGN KEY (id_user) REFERENCES user (id),
  FOREIGN KEY (id_cinema) REFERENCES cinema (id)
);

-- Création de la table room
CREATE TABLE room (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  id_cinema INT NOT NULL,
  number INT NOT NULL,
  places_nb INT NOT NULL,
  FOREIGN KEY (id_cinema) REFERENCES cinema (id)
);

--Création de la table film
CREATE TABLE film (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  duration INT NOT NULL,
  director VARCHAR(80) NOT NULL,
  description TEXT NOT NULL
);

-- Création de la table session
CREATE TABLE session (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  id_film INT NOT NULL,
  id_room INT NOT NULL,
  date DATETIME NOT NULL,
  FOREIGN KEY (id_film) REFERENCES film (id),
  FOREIGN KEY (id_room) REFERENCES room (id)
);

-- Création de la table ticket
CREATE TABLE ticket (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  id_user INT NOT NULL,
  id_session INT NOT NULL,
  price DECIMAL(4,2) NOT NULL,
  FOREIGN KEY (id_user) REFERENCES user (id),
  FOREIGN KEY (id_session) REFERENCES session (id)
);

-- ALIMENTATION DES TABLES AVEC DES DONNEES FACTICES --

-- Alimentation de la table user
INSERT INTO user (`email`, `password`, `firstname`, `lastname`, `roles`) VALUES
('admin@admin.fr', 'admin', 'admin', 'admin', 'ROLE_ADMIN'),
('user1@user1.fr', 'user1', 'user1', 'user1', 'ROLE_USER'),
('user2@user2.fr', 'user2', 'user2', 'user2', 'ROLE_USER'),
('employee1@employee1.fr', 'employee1', 'employee1', 'employee1', 'ROLE_EMPLOYEE'),
('employee2@employee2.fr', 'employee2', 'employee2', 'employee2', 'ROLE_EMPLOYEE');

-- Alimentation de la table cinema
INSERT INTO cinema (`name`, `address`, `rooms_nb`) VALUES
('cinema1', '1 rue du cinema1 75000 Paris', 15),
('cinema2', '1 rue du cinema2 69000 Lyon', 16);

-- Alimentation de la table employee
INSERT INTO employee (`id_user`, `id_cinema`) VALUES
(4, 1), 
(5, 2);

-- Alimentation de la table room
INSERT INTO room (`id_cinema`, `number`, `places_nb`) VALUES
(1, 7, 200),
(1, 15, 400),
(2, 7, 150),
(2, 16, 350);

-- Alimentation de la table film
INSERT INTO film (`title`, `duration`, `director`, `description`) VALUES
('Film1', 110, 'Director Film1', 'Le film 1'),
('Film2', 120, 'Director Film2', 'Le film 2'),
('Film3', 130, 'Director Film3', 'Le film 3'),
('Film4', 140, 'Director Film4', 'Le film 4');

-- Alimentation de la table session
INSERT INTO session (`id_film`, `id_room`, `date`) VALUES
(1, 1, '2023-11-21 09:00:00'),
(2, 2, '2023-11-21 09:00:00'),
(3, 3, '2023-11-21 09:00:00'),
(4, 4, '2023-11-21 09:00:00');

-- Alimentation de la table ticket
INSERT INTO ticket (`id_user`, `id_session`, `price`) VALUES
(2, 1, 9.20),
(2, 2, 7.60),
(3, 3, 5.90),
(3, 4, 9.20);
