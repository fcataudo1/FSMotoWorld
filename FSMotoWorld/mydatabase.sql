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


INSERT INTO product (pid, pname, pprice, pquantity, pimage, description, bid, cid) VALUES 
(10, 'GIVI E95S SCHIENALINO BAULETTO VALIGIA', 49, 1, 'bauletto.1.jpg', 'Il sistema brevettato Monokey permette l\'apertura della valigia e la sua rimozione dalla piastra di fissaggio, tramite l\'utilizzo di una sola chiave. La sua semplicità, robustezza ed affidabilità, lo hanno reso un punto di riferimento nel panorama motociclistico.', 1, 1),
(11, 'Cupolino Biondi Ducati Scrambler 800 2023', 22, 1, 'accessori.2.jpeg', 'DUCATIScrambler 800 cc. Icon (da mag 2023... ad oggi) Scrambler 800 cc. Full Throttle (da mag 2023... ad oggi) Scrambler 800 cc. Nightshift (da mag 2023... ad oggi) Cupolino Sport per moto specifico. Linea: Caffè Colore: Nero Opaco Satinato Si monta sulle predisposizioni originali del mezzo senza alcuna modifica e nessuna modifica. Istruzioni di montaggio incluse nella confezione', 1, 1),
(12, 'MIDLAND BTX1 PRO 2022 DOPPIO INTERFONO MOTO BLUETOOTH', 152, 1, 'accessori.3.jpg', 'Il BTX1 PRO è il primo della serie BT Pro, pensato per la comunicazione fra due persone: pilota-passeggero. Dotato di tecnologia digitale per la diminuzione del rumore – Digital Noise Killer, Noise Gate ed Equalizer – garantisce una trasmissione ottimale fino a 300 m. In più, un nuovo packaging che comprende gli Hi-Fi Speaker Superbass Sound. 2 Dispositivi, 2 microfoni a braccetto e 2 a filo, 2 sistemi di aggancio slide-in biadesivo per tutti i tipi di casco, 2 audio kit con Hi-Fi Speaker, cavo di ricarica MICRO USB con doppio connettore. BTX1 Pro è divertente perché connette fino a 2 cellulari contemporaneamente, con cui si può ascoltare e condividere la musica, o si può scegliere tra ben 6 stazioni radio memorizzabili', 1, 1),
(13, 'SELLA LUNGA ET3 BIPOSTO NERA VESPA 50 SPECIAL', 95, 1, 'accessori.4.jpg', 'SELLA NERA CON SERRATURA BIPOSTO LUNGA - VESPA ET3 - Sella nera lunga biposto colore nero con serratura - Rivestimento in similpelle telata resistente alle intemperie - Telaio in ferro a molle elicoidali schiacciate verniciato nero - Imbottitura in spugna alta densità e rialzo presagomato in poliuretano espanso - Chiusura con serratura (chiavi incluse)- La sella monta con il perno Lungo (NON INCLUSO)', 1, 1),
(14, 'PARAMOTORE PER KTM NERO KTM EXC-F 450 2024', 56, 1, 'accessori.5.jpeg', 'Il paramotore ACERBIS per KTM EXC-F 450 2024 (codice 0025984.090) è un accessorio di protezione realizzato in materiale resistente e durevole, progettato specificamente per adattarsi al modello KTM EXC-F 450 del 2024. Questo paramotore offre una protezione ottimale al motore e alle parti inferiori della moto contro urti, detriti e altri possibili danni durante l\'uso fuoristrada. Facile da installare, il design accurato garantisce una perfetta aderenza e integrazione con la moto, mantenendo al contempo un aspetto estetico pulito e aggressivo.', 1, 1),
(15, 'CANDELA CHAMPION P2M ORIGINALE PIAGGIO SCOOTER 50', 25, 1, 'ricambi.1.jpg', 'Caratteristiche: - Distanza interelettrodica [mm] 0,7 - Tecnica di raccordo M4/SAE - Dimensioni filettatura M14x1.25 - Apertura chiave 21 mm - Qualità/Categoria Nickel GE - Tipo confezione Scatola - Candela accensione 1 Elettrodo di massa - Candela accensione con sede-tenuta piatta - Candela accensione Elettrodo centrale rame - Lunghezza filettatura [mm] 19 - N° informazione tecnica RN2C - Andamento scintilla [mm] 1,5 - Coppia spunto/serraggio da [Nm] 20 - Coppia spunto/serraggio fino a [Nm] 30 - Lunghezza imballaggio [cm] 8,65 - Larghezza imballaggio [cm] 2,45 - Altezza imballaggio [cm] 2,45 - Resistenza da [kOhm] 6 - Resistenza fino a [kOhm] 15', 1, 2),
(16, 'Coppia Manopole PROGRIP ATV 997-299', 15, 1, 'ricambi.2.jpeg', 'Manopole Progrip Il miglior comfort e tecnologia per le tue mani e per la tua guida. Grip fantastico per una migliore tenuta di guida. Prodotto in Italia Tipologia: ATV Modello: 997 Estremità: Chiuse Lunghezza: 130 mm Dimensione: Ø 22 22 Colore: Giallo Fluo/Nero', 1, 2),
(17, '101541 KIT TRASMISSIONE DID HONDA NC DC INTEGRA 750', 110, 1, 'ricambi.3.jpeg', 'KIT TRASMISSIONE DID PROFESSIONAL CATENA: DID 520ERV3 (Gold & Gold) LUNGHEZZA: 112 maglie con giunto a rivetto (ZJ) PASSO: 520 DENATATURA: UGUALE ALL\'ORIGINALE DENTI CORONA: 39 MATERIALE CORONA: ACCIAIO COLORE CORONA: STANDARD DENTI PIGNONE:17 MATERIALE PIGNONE: ACCIAIO', 1, 2),
(18, 'Polini 142.0159 Kit Gruppo Termico 50cc', 47, 1, 'ricambi.4.jpeg', '142.0159 KIT PEUGEOT LUDIX ARIA D.40 IN GHISA TIPO ORIGINALE PEUGEOT: LUDIX 50 - SPEEDFIGHT 3 50 2T air Cilindro in Ghisa / Iron Cylinder', 1, 2),
(19, 'BATTERIA 53030 ORIGINALE YUASA 12V 30AH', 80, 1, 'ricambi.5.jpg', 'CARATTERISTICHE - La tecnologia Glass Mat garantisce resistenza alle vibrazioni - Speciali pacchetti di separatori che forniscono fino al 30% in più di potenza di avviamento rispetto ai modelli tradizionali - La struttura con partizione interna fornisce massima potenza, minimizzando la resistenza interna - Le piastre con Sulphate Stop garantiscono una vita più lunga.', 1, 2),
(20, 'DAINESE GIACCA MOTO UOMO CARVE MASTER 3', 130, 1, 'abbigliamento.1.jpeg', 'Carve Master 3 GORE-TEX® è la giacca moto sport touring più evoluta della gamma Dainese, ideale viaggiare in tutte le stagioni in totale comfort e massima performance. La membrana impermeabile in GORE-TEX® è uno scudo contro la pioggia e gli agenti atmosferici, garantendo sempre un\'ottima traspirabilità. La costruzione in tessuto Mugello, morbido e resistente si adatta perfettamente ai movimenti del corpo, seguendoli fedelmente in ogni spostamento in sella. L\'interno termico removibile consente un comfort superiore anche durante i viaggi nella stagione più fredda, consentendo una grande versatilità di utilizzo, in combinazione con le numerose prese d\'aria azionabili con zip. I più alti standard di sicurezza Dainese sono garantiti dai protettori Pro-Armor Lev.2 Type B su gomiti e spalle, e la predisposizione per i paraschiena G1 e G2 e protettori Pro-Armor per il petto. La tecnologia Dainese Pro-Armor, ispirata alle geometrie dei frattali naturali, consente di ottenere il massimo livello di protezione, con la mobilità di un protettore morbido e una ventilazione ideale grazie ad una superficie aerata per il 40 % dell\'area del protettore. La resistenza all\'abrasione sulle aree più esposte è garantita dagli inserti in 3D-Stone.', 4, 3),
(21, 'Cappello Dainese 9fifty Newera Snapback', 31, 1, 'abbigliamento.2.png', 'CARATTERISTICHE Visiera piatta Chiusura posteriore a scatto MATERIALI PRINCIPALI Pannello posteriore in trucker mesh', 4, 3),
(22, 'Scaldacollo Dainese Cilindro Gaiter Therm', 13, 1, 'abbigliamento.3.jpg', 'Copricollo Dainese CILINDRO THERM. In micropile elastico. TEMPERATURA Micropile elastico', 4, 3),
(23, 'PANTALONI MOTO ENDURO X-DURO W-PROOF', 75, 1, 'abbigliamento.4.jpeg', 'Vestibilità enduro Pantalone studiato per essere utilizzato con tutte le tipologie di ginocchiere 1 tasca gamba destra con zip Regolazione in vita Chiusura con gancio e bottone Logo Acerbis e applicazioni riflettenti sulle gambe Peso 800 gr', 1, 3),
(24, 'ZAINO JERLA NERO/GIALLO', 49, 1, 'abbigliamento.5.jpeg', 'Zaino-borsa capacità 102 litri Dimensioni 59cm x 52cm x 36cm. Peso 2Kg Lo Zaino-borsa accoglie tutta l\'attrezzatura specifica per sportivi che praticano discipline con moto offroad: motocross/Enduro/trial/motard. Grazie al design a zaino si può trasportare tutta l\'attrezzatura necessaria, su e giù dalle scale o nei paddock in presenza di terreni accidentati', 1, 3),
(25, 'KIT MANUTENZIONE CATENA FRENI MOTO BARDAHL HIGH SPEED', 35, 1, 'manutenzione.1.jpg', 'Lubrificante spray ad alta adesività e capacità lubrificante, espressamente formulato per tutti i tipi di catene fortemente sollecitate. PLUS DI PRODOTTO L’esclusiva formula Bardahl Polar Plus unitamente all’impiego di componenti ad elevata adesività, consente al lubrificante di rimanere costantemente attaccato agli organi meccanici, garantendo una lubrificazione sempre efficiente in misura molto superiore rispetto ai lubrificanti convenzionali. High Speed Chain è espressamente formulato per catene fortemente sollecitate operanti ad altissimi regimi di rotazione ed è ideale anche per catene auto-lubrificate (ORING). Potente azione lubrificante ed EP (Estreme Pressioni) Elevata adesività alle maglie della catena Allunga la vita della catena, delle corona e del pignone Superiore potere anti-usura, anti-ruggine e anti-corrosione Resiste all’azione dilavante dell’acqua', 5, 4),
(26, 'WD-40 Kit Per La Manutenzione Della Moto', 15, 1, 'manutenzione.2.jpg', 'WD-40 MOTO PULITORE CATENA è facile da usare e rimuove velocemente sporco, polvere ed olio dalla catena è compatibile con O, X e Z-ring. WD-40 MOTO GRASSO CATENA fornisce una lubrificazione a lunga durata per la vostra catena ed è compatibile con O, X e Z-ring grazie alla sua eccezionale protezione contro la corrosione e all\'aggiunta di PTFE, è particolarmente adatto per condizioni umide e possiede delle proprietà anti-schizzo. WD-40 SPAZZOLA CATENA a setole morbide rimuove facilmente sporco e sporcizia.', 1, 4),
(27, 'FILTRO ARIA PER BETA BETA RR 250 2T 2013-2018', 25, 1, 'manutenzione.3.jpg', 'APPLICAZIONI: BETA RR 250 2T 2013 2014 2015 2016 2017 2018 BETA RR 300 2T 2013 2014 2015 2016 2017 2018 BETA RR 350 4T 2013 2014 2015 2016 2017 2018 BETA RR 400 4T 2012 2013 2014 BETA RR 430 4T 2015 2016 2017 2018 BETA RR 450 4T 2012 2013 2014 BETA RR 480 4T 2015 2016 2017 2018 BETA RR 490 4T 2012 2013 2014 2015', 1, 4),
(28, 'Filtro olio Originale Hiflo HF569 MV AGUSTA', 12, 1, 'manutenzione.4.jpg', 'Filtro olio Originale Hiflo HF569 Omologato TUV Riferimento Originale: MV AGUSTA 8000B5425 PRINCIPALI APPLICAZIONI: MV Agusta Brutale 675/800 13-16 F3 675/800 11-16 Rivale 800 13-16 Stradale 800 15-16 Turismo Veloce 14-16', 1, 4),
(29, 'TESTA CILINDRO VESPA 150 SPRINT PX 150', 39, 1, 'manutenzione.5.jpg', 'TESTA CILINDRO VESPA 150 SPRINT - PX 150 E CYLINDER HEAD (SIM/OEM 123474) VESPA 150 SPRINT VESPA PX 150', 1, 4);



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