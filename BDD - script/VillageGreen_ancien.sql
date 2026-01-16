DROP DATABASE IF EXISTS `filRouge`;
CREATE DATABASE `filRouge` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `filRouge`;

CREATE TABLE categories(
   id INT AUTO_INCREMENT,
   cat_nom VARCHAR(50)  NOT NULL,
   cat_photo VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);

INSERT INTO `categories` (`id`, `cat_nom`, `cat_photo`) VALUES
(1, 'Guit&Bass', 'jpg'),
(2, 'Batteries', 'jpg'),
(3, 'Clavier', 'jpg'),
(4, 'Studio', 'jpg'),
(5, 'Sono', 'jpg'),
(6, 'Eclairage', 'jpg'),
(7, 'DJ', 'jpg'),
(8, 'Cases', 'jpg'),
(9, 'Accessoires', 'jpg'),
(10, 'Logiciels', 'jpg'),
(11, 'Vents', 'jpg'),
(12, 'Micros', 'jpg');

	
CREATE TABLE sous_categories(
   id INT,
   sous_cat_nom VARCHAR(50)  NOT NULL,
   photo VARCHAR(50)  NOT NULL,
   cat_id INT,
   PRIMARY KEY(id),
   FOREIGN KEY(cat_id) REFERENCES categories(id)
);

INSERT INTO `sous_categories` (`id`, `cat_id`, `sous_cat_nom`, `photo`) VALUES
(1, 1, 'Guitares Electriques', 'jpg'),
(2, 1, 'Guitares Classiques', 'jpg'),
(3, 1, 'Guitares Acoustiques & Electro-Acoustiques', 'jpg'),
(4, 1, 'Basses electriques', 'jpg'),
(5, 1, 'Basses acoustiques & Semi-Acoustiques', 'jpg'),
(6, 1, 'Ukulélés', 'jpg'),
(7, 2, 'Batteries Acoustiques', 'jpg'),
(8, 2, 'Batteries Electroniques', 'jpg'),
(9, 2, 'Cymbales', 'jpg'),
(10, 2, 'Baguettes & Maillets', 'jpg'),
(11, 2, 'Peaux de Batterie & Percussions', 'jpg'),
(12, 2, 'Hardware pour Batterie & Percussions', 'jpg'),
(13, 3, 'Claviers Arrangeurs', 'jpg'),
(14, 3, 'Claviers Maîtres', 'jpg'),
(15, 3, 'Pianos de Scène', 'jpg'),
(16, 3, 'Pianos Numériques', 'jpg');


CREATE TABLE produit(
   id INT AUTO_INCREMENT,
   pro_libelle VARCHAR(200)  NOT NULL,
   pro_description VARCHAR(1000) ,
   prix_achat_HT DECIMAL(5,2)   NOT NULL,
   Taux_TVA DECIMAL(2,2)   NOT NULL,
   prix_vente DECIMAL(5,2)   NOT NULL,
   pro_photo VARCHAR(4) ,
   pro_stock INT,
   sous_cat_id INT,
   PRIMARY KEY(id),
   FOREIGN KEY(sous_cat_id) REFERENCES souscategories(sous_id)
);

INSERT INTO `produit` (`id`, `sous_cat_id`, `pro_libelle`, `pro_description`, `prix_achat_HT`, `Taux_TVA`, `prix_vente`, `pro_photo`, `pro_stock`) VALUES 
(1, 1, 'Harley Benton', 'Guitare électrique, Harley Benton ST-20HSS CA Standard Set 1', 100, 20, 120, 'jpg', 5),
(2, 1, 'Thomann Guitar', 'Guitare électrique, Thomann Guitar Set G13 White', 70, 20, 84, 'jpg', 2),
(3, 1, 'Fender', 'Guitare électrique, Fender SQ Aff. Strat HSS MN PACK LPB', 150, 20, 180, 'jpg', 4),
(4, 1, 'Evh', 'Guitare électrique, Evh SQ Aff. Strat HSS MN PACK LPB', 150, 20, 180, 'jpg', 8),
(5, 1, 'Jackson', 'Guitare électrique, Jackson SQ Aff. Strat HSS MN PACK LPB', 150, 20, 180, 'jpg', 9),
(6, 1, 'Squier', 'Guitare électrique, Squier SQ Aff. Strat HSS MN PACK LPB', 150, 20, 180, 'jpg', 4),
(7, 2, 'Startone', 'Guitare classique, Startone CG 851 1/8', 10, 20, 12, 'jpg', 15),
(8, 2, 'Yamaha', 'Guitare classique, Yamaha GL1 Tobacco Brown Sunburst', 25, 20, 25, 'jpg', 7),
(9, 2, 'La Mancha', 'Guitare classique, La Mancha Rubinito CM/47', 100, 20, 120, 'jpg', 6),
(10, 2, 'Ortega', 'Guitare classique, Ortega R122-1/4', 60, 20, 72, 'jpg', 4),
(11, 3, 'Epiphone', 'Guitares Acoustiques & Electro-Acoustiques, Epiphone J-15 EC Deluxe NA', 160, 20, 192, 'jpg', 2),
(12, 3, 'Baton Rouge', 'Guitares Acoustiques & Electro-Acoustiques, Baton Rouge X11LS/D-W-SCC', 100, 20, 120, 'jpg', 7),
(13, 3, 'Gibson', 'Guitares Acoustiques & Electro-Acoustiques, Gibson G-45 Natural Generation', 700, 20, 840, 'jpg', 3);


CREATE TABLE commercial(
   commercial_id INT,
   commercial_nom VARCHAR(50) NOT NULL,
   commercial_prenom VARCHAR(50) NOT NULL,
   PRIMARY KEY(commercial_id)
);

INSERT INTO `commercial` (`commercial_id`, `commercial_nom`, `commercial_prenom`) VALUES 
(1, 'Martin', 'Léo'),
(2, 'Bernard', 'Gabriel'),
(3, 'Thomas', 'Raphaël'),
(4, 'Petit', 'Arthur'),
(5, 'Robert', 'Louis');


CREATE TABLE user(
   id INT,
   user_nom VARCHAR(50) NOT NULL,
   user_prenom VARCHAR(50) NOT NULL,
   roles JSON NULL,
   email VARCHAR(255) NOT NULL,
   password VARCHAR(255) NOT NULL,
   is_verified INT NULL,
   commercial_id INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(commercial_id) REFERENCES commercial(commercial_id)
);

INSERT INTO `user` (`id`, `user_nom`, `user_prenom`, `roles`, `email`, `password`, `is_verified`, `commercial_id`) VALUES 
(1, 'Richard', 'Jules',  '["ROLE_ADMIN"]', 'nijatmajidli@gmail.com', 12345, 0, 2),
(2, 'Durand', 'Adam', '["ROLE_USER"]', 'nijatmajidli1@gmail.com', 123451, 0, 3),
(3, 'Dubois', 'Lucas', '["ROLE_USER"]', 'nijatmajidli2@gmail.com', 123452, 0, 4),
(4, 'Moreau', 'Hugo', '["ROLE_USER"]', 'nijatmajidli3@gmail.com', 123453, 0, 2),
(5, 'Laurent', 'Gabin', '["ROLE_USER"]', 'nijatmajidli4@gmail.com', 123454, 0, 1),
(6, 'Simon', 'Paul', '["ROLE_USER"]', 'nijatmajidli5@gmail.com', 123455, 0, 1),
(7, 'Michel', 'Nathan', '["ROLE_USER"]', 'nijatmajidli6@gmail.com', 123456, 0, 2),
(8, 'Lefebvre', 'Leon', '["ROLE_USER"]', 'nijatmajidli7@gmail.com', 123457, 0, 1),
(9, 'Leroy', 'Marius', '["ROLE_USER"]', 'nijatmajidli8@gmail.com', 123458, 0, 5),
(10, 'Roux', 'Victor', '["ROLE_USER"]', 'nijatmajidli9@gmail.com', 123459, 0, 3);



CREATE TABLE commande(
   com_id INT,
   com_date DATE NOT NULL,
   mode_paiement VARCHAR(50) NOT NULL,
   expedition VARCHAR(50) NOT NULL,
   date_facturation DATE,
   date_livraison DATE,
   user_référence INT NOT NULL,
   PRIMARY KEY(com_id),
   FOREIGN KEY(user_référence) REFERENCES user(user_référence)
);

INSERT INTO `commande` (`com_id`, `user_référence`, `com_date`, `mode_paiement`, `date_facturation`,  `date_livraison`) VALUES 
(1, 3, '2021-06-03', 'Carte de credit', '2021-06-06', '2021-06-12'),
(2, 3, '2021-07-23', 'Carte de credit', '2021-07-29', '2021-07-31');


CREATE TABLE adresse(
   id INT,
   type VARCHAR(50) NOT NULL,
   adresse VARCHAR(255) NOT NULL,
   code_postal VARCHAR(15) NOT NULL,
   ville VARCHAR(50) NOT NULL,
   pays VARCHAR(50) NOT NULL,
   user_id INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(user_id) REFERENCES user(id)
);

INSERT INTO `adresse` (`id`, `type`, `adresse`, `code_postal`, `ville`, `pays`, `user_id`) VALUES 
(1, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 1),
(2, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 2),
(3, 'livraison', '4 rue Richard Wagner', '60100', 'Creil', 'France', 3),
(4, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 4),
(5, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 5),
(6, 'livraison', '4 rue Richard Wagner', '60100', 'Creil', 'France', 6),
(7, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 7),
(8, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 8),
(9, 'livraison', '4 rue Richard Wagner', '60100', 'Creil', 'France', 9),
(10, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 10);



CREATE TABLE LigneDeCommande(
   pro_id INT,
   com_id INT,
   quantite INT,
   remise INT,
   PRIMARY KEY(pro_id, com_id),
   FOREIGN KEY(pro_id) REFERENCES produit(pro_id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id)
);

INSERT INTO `LigneDeCommande` (`pro_id`, `com_id`, `quantite`, `remise`) VALUES 
(1, 1, 2, Null),
(3, 1, 3, Null);


CREATE TABLE facture(
   com_id INT,
   id INT,
   PRIMARY KEY(com_id, id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id),
   FOREIGN KEY(id) REFERENCES adresse(id)
);


CREATE TABLE livre(
   com_id INT,
   id INT,
   PRIMARY KEY(com_id, id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id),
   FOREIGN KEY(id) REFERENCES adresse(id)
);




