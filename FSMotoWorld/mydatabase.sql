drop database ecommerce1;
CREATE DATABASE ecommerce1;
USE ecommerce1;

CREATE TABLE brand ( bid int DEFAULT NULL, bname varchar(50) DEFAULT NULL );

INSERT INTO brand VALUES (1,'generico'),(2,'did'),(3,'barracuda'),(4,'dainese'),(5,'wd-40');

CREATE TABLE cart ( Name varchar(100) DEFAULT NULL, bname varchar(50) DEFAULT NULL, cname varchar(50) DEFAULT NULL, pname varchar(50) DEFAULT NULL, pprice int DEFAULT NULL, pquantity int DEFAULT NULL, pimage varchar(200) DEFAULT NULL );

CREATE TABLE category ( cid int DEFAULT NULL, cname varchar(50) DEFAULT NULL );

INSERT INTO category VALUES (1,'accessori'),(2,'ricambi'),(3,'abbigliamento'),(4,'manutenzione');



CREATE TABLE contactus ( id int NOT NULL AUTO_INCREMENT, Name varchar(100) DEFAULT NULL, Email_Id varchar(100) DEFAULT NULL, Contact_No varchar(15) DEFAULT NULL, Message varchar(8000) DEFAULT NULL, PRIMARY KEY (id) );

CREATE TABLE customer ( Name varchar(100) DEFAULT NULL, Password varchar(20) DEFAULT NULL, Email_Id varchar(100) DEFAULT NULL, Contact_No varchar(15) DEFAULT NULL );

CREATE TABLE login ( username varchar(100) DEFAULT NULL, password varchar(100) DEFAULT NULL );

INSERT INTO login VALUES ('admin','admin');

CREATE TABLE order_details ( Date varchar(100) DEFAULT NULL, Name varchar(100) DEFAULT NULL, bname varchar(50) DEFAULT NULL, cname varchar(50) DEFAULT NULL, pname varchar(50) DEFAULT NULL, pprice int DEFAULT NULL, pquantity int DEFAULT NULL, pimage varchar(200) DEFAULT NULL );

CREATE TABLE orders ( Order_Id int NOT NULL AUTO_INCREMENT, Customer_Name varchar(100) DEFAULT NULL, Customer_City varchar(45) DEFAULT NULL, Date varchar(100) DEFAULT NULL, Total_Price int DEFAULT NULL, Status varchar(45) DEFAULT NULL, PRIMARY KEY (Order_Id) );


CREATE TABLE product ( pid int NOT NULL AUTO_INCREMENT, pname varchar(50) DEFAULT NULL, pprice int DEFAULT NULL, pquantity int DEFAULT NULL, pimage varchar(200) DEFAULT NULL,description varchar(1000) DEFAULT NULL, bid int DEFAULT NULL, cid int DEFAULT NULL, PRIMARY KEY (pid) );

SELECT pimage FROM product WHERE pid = 9;



INSERT INTO product VALUES (6, 'Specchio retrovisore Destro KTM Duke 125-390', 20, 1, 'accessori2.jpeg','Specchietto retrovisore, Colore: Nero, Lato: Destro, Omologato', 1, 1),
(7, 'KIT TRASMISSIONE DID KAWASAKI ZX6R NINJA 636 2002', 130, 1, 'ricambi1.jpeg', 'KIT TRASMISSIONE DID PROFESSIONAL
CATENA: DID 525VX,LUNGHEZZA: 108 maglie con giunto a rivetto (ZJ), PASSO: 525, DENATATURA: UGUALE ORIGINALE
DENTI CORONA: 40, MATERIALE CORONA: ACCIAIO, COLORE CORONA: STANDARD, DENTI PIGNONE: 15, MATERIALE PIGNONE: ACCIAIO
Grasso spray WD-40 in omaggio',2, 2),
(8, 'DAINESE RAZON 2 LEATHER JACKET BLACK 48', 320, 1, 'abbigliamento3.jpeg', 'La giacca moto Razon 2, realizzata in pelle Cordoba morbida e resistente, presenta inserti in tessuto elastico sotto le braccia e inserti in pelle Microelastic 2.0 sul retro, per offrire tutta la sicurezza della pelle e al tempo stesso grande flessibilità e libertà di movimento.
Dotata di tasca posteriore con predisposizione per inserimento del paraschiena, tasche con zip laterali, regolazione del fit con bottoni automatici su fianchi e polsi e prese di aria sul petto per ottimizzare il comfort termico anche nelle stagioni calde, la giacca moto in pelle Dainese Razon 2 concilia estetica di ispirazione urbana e altissimi livelli di protezione, garantiti dalla presenza di protezioni Pro-Armor, ultra resistenti, morbide e removibili, certificate secondo lo standard EN 1621.1.',4, 3),
(9, 'WD-40 Kit Manutenzione Della Catena Moto', 32, 1, 'manutenzione4.jpeg', 'Kit manutenzione catena moto:1 x WD-40 Specialist Moto Pulitore Catena 400 ml, 1 x WD-40 Specialist Moto Grasso Catena 400 ml, 1 x WD-40 Spazzola Catena.
Caratteristiche:
WD-40 MOTO PULITORE CATENA è facile da usare e rimuove velocemente sporco, polvere ed olio dalla catena è compatibile con O, X e Z-ring.
WD-40 MOTO GRASSO CATENA fornisce una lubrificazione a lunga durata per la vostra catena ed è compatibile con O, X e Z-ring grazie alla sua eccezionale protezione contro la corrosione e all&rsquo aggiunta di PTFE, è particolarmente adatto per condizioni umide e possiede delle proprietà anti-schizzo.
WD-40 SPAZZOLA CATENA a setole morbide rimuove facilmente sporco e sporcizia.',5, 4);

CREATE VIEW viewlist AS 
SELECT 
    brand.bname AS bname,
    category.cname AS cname,
    product.pname AS pname,
    product.pprice AS pprice,
    product.pquantity AS pquantity,
    product.pimage AS pimage,
    product.description AS description
FROM 
    brand
JOIN 
    product ON brand.bid = product.bid
JOIN 
    category ON product.cid = category.cid;

CREATE VIEW clothing AS 
SELECT 
    brand.bname AS bname,
    category.cname AS cname,
    product.pname AS pname,
    product.pprice AS pprice,
    product.pquantity AS pquantity,
    product.pimage AS pimage,
    product.description AS description
FROM 
    brand
JOIN 
    product ON brand.bid = product.bid
JOIN 
    category ON product.cid = category.cid
WHERE 
    category.cid = 3;


CREATE VIEW accessories AS 
SELECT 
    brand.bname AS bname,
    category.cname AS cname,
    product.pname AS pname,
    product.pprice AS pprice,
    product.pquantity AS pquantity,
    product.pimage AS pimage,
    product.description AS description
FROM 
    brand
JOIN 
    product ON brand.bid = product.bid
JOIN 
    category ON product.cid = category.cid
WHERE 
    category.cid = 1;

CREATE VIEW parts AS 
SELECT 
    brand.bname AS bname,
    category.cname AS cname,
    product.pname AS pname,
    product.pprice AS pprice,
    product.pquantity AS pquantity,
    product.pimage AS pimage,
    product.description AS description
FROM 
    brand
JOIN 
    product ON brand.bid = product.bid
JOIN 
    category ON product.cid = category.cid
WHERE 
    category.cid = 2;

CREATE VIEW maintenance AS 
SELECT 
    brand.bname AS bname,
    category.cname AS cname,
    product.pname AS pname,
    product.pprice AS pprice,
    product.pquantity AS pquantity,
    product.pimage AS pimage,
    product.description AS description
FROM 
    brand
JOIN 
    product ON brand.bid = product.bid
JOIN 
    category ON product.cid = category.cid
WHERE 
    category.cid = 4;

CREATE TABLE usermaster ( Name varchar(100) DEFAULT NULL, Password varchar(20) DEFAULT NULL );

INSERT INTO usermaster VALUES ('admin','admin');