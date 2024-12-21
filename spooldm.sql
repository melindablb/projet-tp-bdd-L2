--partie 1
--question1
SQL> create user DBAINTERVENTION identified by 0123;

User created.
--question2
SQL> grant all privileges to DBAINTERVENTION;

Grant succeeded.

SQL> connect DBAINTERVENTION
Connected.
--partie 2
--question4
SQL> create table CLIENT(
  2  	NUMCLIENT int primary key,
  3  	CIV char(5),
  4  	PRENOMCLIENT char(25),
  5  	NOMCLIENT char(25),
  6  	DATENAISSANCE date,
  7  	ADRESSE char(100),
  8  	TELPROF number(10),
  9  	TELPRIV number(10),
 10  	FAX number(10),
 11  	constraint c1 check (CIV in ('M','Mle','Mme'))
 12  );

Table created.

SQL> create table EMPLOYE(
  2  	NUMEMPLOYE int primary key,
  3  	NOMEMP char(25),
  4  	PRENOMEMP char(25),
  5  	CATEGORIE char(20),
  6  	SALAIRE number(10,5),
  7  	constraint c2 check (CATEGORIE in('M‚canicien', 'Assistant'))
  8  );

Table created.

SQL> create table MARQUE(
  2  	NUMMARQUE int primary key,
  3  	MARQUE char(50),
  4  	PAYS char(50)
  5  );

Table created.

SQL> create table MODELE(
  2  	NUMMODELE int primary key,
  3  	NUMMARQUE int ,
  4  	MODELE char(50),
  5  	constraint fk_m foreign key (NUMMARQUE) references MARQUE(NUMMARQUE)
  6  );

Table created.

SQL> create table VEHICULE(
  2  	NUMVEHICULE int primary key,
  3  	NUMCLIENT int,
  4  	NUMMODELE int,
  5  	NUMIMMAT int,
  6  	ANNEEE number(4),
  7  	constraint fk_v1 foreign key (NUMCLIENT) references CLIENT(NUMCLIENT),
  8  	constraint fk_v2 foreign key (NUMMODELE) references MODELE(NUMMODELE)
  9  	);

Table created.

SQL> create table INTERVENTIONS(
  2  	NUMINTERVENTION int primary key,
  3  	NUMVEHICULE int,
  4  	TYPEINTERVENTION char(50),
  5  	DATEDEBINTERV date,
  6  	DATEFININTERV date,
  7  	COUNTINTERV number(10,5),
  8  	constraint fk_i foreign key (NUMVEHICULE) references VEHICULE(NUMVEHICULE)
  9  );

Table created.

SQL> create table INTERVENANTS(
  2  	NUMINTERVENTION int,
  3  	NUMEMPLOYE int,
  4  	DATEDEBUT date,
  5  	DATEFIN date,
  6  	constraint pk_i2 primary key (NUMINTERVENTION,NUMEMPLOYE),
  7  	constraint fk_i21 foreign key (NUMINTERVENTION) references INTERVENTIONS(NUMINTERVENTION),
  8  	constraint fk_i22 foreign key(NUMEMPLOYE) references EMPLOYE(NUMEMPLOYE)
  9  );

Table created.

--question5
SQL> alter table EMPLOYE add DATEINSTALLATION date;

Table altered.

--question6
SQL> alter table EMPLOYE add constraint notnul_e check (CATEGORIE is not null and SALAIRE is not null);

Table altered.

--question7
--agrandir
SQL> alter table EMPLOYE modify PRENOMEMP char(30);

Table altered.
--reduire
SQL> alter table EMPLOYE modify PRENOMEMP char(24);

Table altered.

--question8
SQL> alter table EMPLOYE drop column DATEINSTALLATION;

Table altered.

--verification
SQL> desc EMPLOYE
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NUMEMPLOYE                                NOT NULL NUMBER(38)
 NOMEMP                                             CHAR(25)
 PRENOMEMP                                          CHAR(24)
 CATEGORIE                                          CHAR(20)
 SALAIRE                                            NUMBER(10,5)

--question9
SQL> alter table CLIENT rename column ADRESSE to ADRESSECLIENT;

Table altered.

--verification
SQL> desc CLIENT
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NUMCLIENT                                 NOT NULL NUMBER(38)
 CIV                                                CHAR(5)
 PRENOMCLIENT                                       CHAR(25)
 NOMCLIENT                                          CHAR(25)
 DATENAISSANCE                                      DATE
 ADRESSECLIENT                                      CHAR(100)
 TELPROF                                            NUMBER(10)
 TELPRIV                                            NUMBER(10)
 FAX                                                NUMBER(10)

--question10
SQL> alter table INTERVENTIONS add constraint datei check (DATEDEBINTERV < DATEFININTERV);

Table altered.

--partie 3
--question 11
SQL> INSERT INTO CLIENT VALUES (1,'Mme','Cherifa','MAHBOUBA','08/08/1957','CITE 1013 LOGTS BT 61 Alger','0561381813','0562458714','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (2,'Mme','Lamia','TAHMI','31/12/1955','CITE BACHEDJARAH BATIMENT 38 -Bach Djerrah-Alger','0562467849','0561392487','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (3,'Mle','Ghania','DIAF AMROUNI','31/12/1955','43, RUE ABDERRAHMANE SBAA BELLE VUE-EL HARRACH-ALGER','0523894562','0619430945','0562784254');

1 row created.

SQL> INSERT INTO CLIENT VALUES (4,'Mle','Chahinaz','MELEK','27/06/1955','HLM AISSAT IDIR CAGE 9 3EME ETAGE-EL HARRACH ALGER','0634613493','0562529463','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (5,'Mme','Noura','TECHTACHE','22/03/1949','16, ROUTE EL DJAMILA-AINBENIAN-ALGER','0562757834','','0562757843');

1 row created.

SQL> INSERT INTO CLIENT VALUES (6,'Mme','Widad','TOUATI','14/08/1965','14 RUE DES FRERES AOUDIA-EL MOURADIA-ALGER','0561243967','0561401836','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (7,'Mle','Faiza','ABLOUL','28/10/1967','CITE DIPLOMATIQUE BT BLEU 14B N 3 DERGANA- ALGER','0562935427','0561486203','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (8,'Mme','Assia','HORRA','08/12/1963','32 RUE AHMED OUAKED-DELY BRAHIM-ALGER','0561038500','','0562466733');

1 row created.

SQL> INSERT INTO CLIENT VALUES (9,'Mle','Souad','MESBAH','30/08/1972','RESIDENCE CHABANI-HYDRA-ALGER','0561024358','','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (10,'Mme','Houda','GROUDA','20/02/1950','EPSP THNIET ELABED BATNA','0562939495','0561218456','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (11,'Mle','Saida','FENNICHE','','CITE DE L''INDEPENDANCE LARBAA BLIDA','0645983165','0562014784','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (12,'Mme','Samia','OUALI','17/11/1966','CITE 200 LOGEMENTS BT1 N1-JIJEL','0561374812','0561277013','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (13,'Mme','Fatiha','HADDAD','20/09/1980','RUE BOUFADA LAKHDARAT-AIN OULMANE-SETIF','0647092453','0562442700','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (14,'M','Djamel','MATI','','DRAA KEBILA HAMMAM GUERGOUR SETIF','0561033663','0561484259','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (15,'M','Mohamed','GHRAIR','24/06/1950','CITE JEANNE D''ARC ECRAN B5- GAMBETTA - ORAN','0561390288','','0562375849');

1 row created.

SQL> INSERT INTO CLIENT VALUES (16,'M','Ali','LAAOUAR','','CITE 1ER MAI EX 137 LOGEMENTS-ADRAR','0639939410','0561255412','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (17,'M','Messoud','AOUIZ','24/11/1958','RUE SAIDANI ABDESSLAM -AIN BESSEM-BOUIRA','0561439256','0561473625','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (18,'M','Farid','AKIL','06/05/1961','3 RUE LARBI BEN M''HIDI-DRAA EL MIZAN-TIZI OUZOU','0562349254','0561294268','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (19,'Mme','Dalila','MOUHTADI','','6, BD TRIPOLI ORAN','0506271459','0506294186','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (20,'M','Younes','CHALAH','','CITE DES 60 LOGTS BT D N 48- NACIRIA-BOUMERDES','','0561358279','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (21,'M','Boubeker','BARKAT','08/11/1935','CITE MENTOURI N 71 BT AB SMK Constantine','0561824538','0561326179','');

1 row created.

SQL> INSERT INTO CLIENT VALUES (22,'M','Seddik','HMIA','','25 RUE BEN YAHIYA-JIJEL','0562379513','','0562493627');

1 row created.

SQL> INSERT INTO CLIENT VALUES (23,'M','Lamine','MERABAT','09/12/1965','CITE JEANNE D''ARC ECRAN B2-GAMBETTA - ORAN','0561724538','0561724538','');

1 row created.

-------------------------------------------------------------------

SQL> INSERT INTO EMPLOYE VALUES(53,'LACHEMI','Bouzid','M‚canicien',25000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(54,'BOUCHEMLA','Elias','Assistant',10000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(55,'HADJ','Zouhir','Assistant',12000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(56,'OUSSEDIK','Hakim','M‚canicien',20000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(57,'ABAD','Abdelhamid','Assistant',13000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(58,'BABACI','Tayeb','M‚canicien',21300);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(59,'BELHAMIDI','Mourad','M‚canicien',19500);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(60,'IGOUDJIL','Redouane','Assistant',15000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(61,'KOULA','Bahim','M‚canicien',23100);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(62,'RAHALI','Ahcene','M‚canicien',24000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(63,'CHAOUI','Ismail','Assistant',13000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(64,'BADI','Hatem','Assistant',14000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(65,'MOHAMMEDI','Mustapha','M‚canicien',24000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(66,'FEKAR','Abdelaziz','Assistant',13500);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(67,'SAIDOUNI','Wahid','M‚canicien',25000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(68,'BOULARAS','Farid','Assistant',14000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(69,'CHAKER','Nassim','M‚canicien',26000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(71,'TERKI','Yacine','M‚canicien',23000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(72,'TEBIBEL','Ahmed','Assistant',17000);

1 row created.

SQL> INSERT INTO EMPLOYE VALUES(80,'LARDJOUNE','Karim','M‚canicien',25000);

1 row created.

-------------------------------------------------------------------

SQL> INSERT INTO MARQUE VALUES(1,'LAMBORGHINI','ITALIE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(2,'AUDI','ALLEMAGNE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(3,'ROLLS-ROYCE','GRANDE-BRETAGNE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(4,'BMW','ALLEMAGNE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(5,'CADILLAC','ETATS-UNIS');

1 row created.

SQL> INSERT INTO MARQUE VALUES(6,'CHRYSLER','ETATS-UNIS');

1 row created.

SQL> INSERT INTO MARQUE VALUES(7,'FERRARI','ITALIE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(8,'HONDA','JAPON');

1 row created.

SQL> INSERT INTO MARQUE VALUES(9,'JAGUAR','GRANDE-BRETAGNE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(10,'ALFA-ROMEO','ITALIE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(11,'LEXUS','JAPON');

1 row created.

SQL> INSERT INTO MARQUE VALUES(12,'LOTUS','GRANDE-BRETAGNE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(13,'MASERATI','ITALIE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(14,'MERCEDES','ALLEMAGNE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(15,'PEUGEOT','FRANCE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(16,'PORSCHE','ALLEMAGNE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(17,'RENAULT','FRANCE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(18,'SAAB','SUEDE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(19,'TOYOTA','JAPON');

1 row created.

SQL> INSERT INTO MARQUE VALUES(20,'VENTURI','FRANCE');

1 row created.

SQL> INSERT INTO MARQUE VALUES(21,'VOLVO','SUEDE');

1 row created.

-------------------------------------------------------------------

SQL> INSERT INTO MODELE VALUES(2,1,'Diablo');

1 row created.

SQL> INSERT INTO MODELE VALUES(3,2,'Serie 5');

1 row created.

SQL> INSERT INTO MODELE VALUES(4,10,'NSX');

1 row created.

SQL> INSERT INTO MODELE VALUES(5,14,'Classe C');

1 row created.

SQL> INSERT INTO MODELE VALUES(6,17,'Safrane');

1 row created.

SQL> INSERT INTO MODELE VALUES(7,20,'400 GT');

1 row created.

SQL> INSERT INTO MODELE VALUES(8,12,'Esprit');

1 row created.

SQL> INSERT INTO MODELE VALUES(9,15,'605');

1 row created.

SQL> INSERT INTO MODELE VALUES(10,19,'Previa');

1 row created.

SQL> INSERT INTO MODELE VALUES(11,7,'550 Maranello');

1 row created.

SQL> INSERT INTO MODELE VALUES(12,3,'Bentley-Continental');

1 row created.

SQL> INSERT INTO MODELE VALUES(13,10,'Spider');

1 row created.

SQL> INSERT INTO MODELE VALUES(14,13,'Evoluzione');

1 row created.

SQL> INSERT INTO MODELE VALUES(15,16,'Carrera');

1 row created.

SQL> INSERT INTO MODELE VALUES(16,16,'Boxter');

1 row created.

SQL> INSERT INTO MODELE VALUES(17,21,'S 80');

1 row created.

SQL> INSERT INTO MODELE VALUES(18,6,'300 M');

1 row created.

SQL> INSERT INTO MODELE VALUES(19,4,'M 3');

1 row created.

SQL> INSERT INTO MODELE VALUES(20,9,'XJ 8');

1 row created.

SQL> INSERT INTO MODELE VALUES(21,15,'406 Coupe');

1 row created.

SQL> INSERT INTO MODELE VALUES(22,20,'300 Atlantic');

1 row created.

SQL> INSERT INTO MODELE VALUES(23,14,'Classe E');

1 row created.

SQL> INSERT INTO MODELE VALUES(24,11,'GS 300');

1 row created.

SQL> INSERT INTO MODELE VALUES(25,5,'Seville');

1 row created.

SQL> INSERT INTO MODELE VALUES(26,18,'95 Cabriolet');

1 row created.

SQL> INSERT INTO MODELE VALUES(27,2,'TT Coup‚');

1 row created.

SQL> INSERT INTO MODELE VALUES(28,7,'F 355');

1 row created.

SQL> INSERT INTO MODELE VALUES(29,21,'Volvo EX30');

1 row created.

-------------------------------------------------------------------

SQL> INSERT INTO VEHICULE VALUES(1,2,6,0012519216,1992);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(2,9,20,0124219316,1993);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(3,17,8,1452318716,1987);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(4,6,12,3145219816,1998);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(5,16,23,1278919816,1998);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(6,20,6,3853319735,1997);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(7,7,8,1453119816,1998);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(8,16,14,8365318601,1986);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(9,13,15,3087319233,1992);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(10,20,22,9413119935,1999);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(11,9,16,1572319801,1998);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(12,14,20,6025319733,1997);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(13,19,17,5205319736,1997);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(14,22,21,7543119207,1992);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(15,4,19,6254319916,1999);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(16,16,21,9831419701,1997);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(17,12,11,4563117607,1976);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(18,1,2,7973318216,1982);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(19,18,27,3904318515,1985);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(20,22,2,1234319707,1997);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(21,3,19,8429318516,1985);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(22,8,19,1245619816,1998);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(23,7,25,1678918516,1985);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(24,1,9,1789519816,1998);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(25,13,5,1278919833,1998);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(26,3,10,1458919316,1993);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(27,10,7,1256019804,1998);

1 row created.

SQL> INSERT INTO VEHICULE VALUES(28,10,3,1986219904,1999);

1 row created.

-------------------------------------------------------------------

SQL> INSERT INTO INTERVENTIONS  VALUES(1,3,'R‚paration',TO_DATE('2006-02-25 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-02-26 12:00:00','RRRR-MM-DD HH24:MI:SS'),30000);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(2,21,'R‚paration',TO_DATE('2006-02-23 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-02-24 18:00:00','RRRR-MM-DD HH24:MI:SS'),10000);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(3,25,'R‚paration',TO_DATE('2006-04-06 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-04-09 12:00:00','RRRR-MM-DD HH24:MI:SS'),42000);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(4,10,'Entretien',TO_DATE('2006-05-14 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-14 18:00:00','RRRR-MM-DD HH24:MI:SS'),10000);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(5,6,'R‚paration',TO_DATE('2006-02-22 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-02-25 18:00:00','RRRR-MM-DD HH24:MI:SS'),40000);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(6,14,'Entretien',TO_DATE('2006-03-03 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-03-04 18:00:00','RRRR-MM-DD HH24:MI:SS'),7500);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(7,1,'Entretien',TO_DATE('2006-04-09 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-04-09 18:00:00','RRRR-MM-DD HH24:MI:SS'),8000);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(8,17,'Entretien',TO_DATE('2006-05-11 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-12 18:00:00','RRRR-MM-DD HH24:MI:SS'),9000);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(9,22,'Entretien',TO_DATE('2006-02-22 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-02-22 18:00:00','RRRR-MM-DD HH24:MI:SS'),7960);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(10,2,'Entretien et Reparation',TO_DATE('2006-04-08 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-04-09 18:00:00','RRRR-MM-DD HH24:MI:SS'),45000);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(11,28,'R‚paration',TO_DATE('2006-03-08 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-03-17 12:00:00','RRRR-MM-DD HH:MI:SS'),36000);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(12,20,'Entretien et Reparation',TO_DATE('2006-05-03 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-05 18:00:00','RRRR-MM-DD HH24:MI:SS'),27000);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(13,8,'R‚paration Systeme',TO_DATE('2006-05-12 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-12 18:00:00','RRRR-MM-DD HH24:MI:SS'),17846);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(14,1,'R‚paration',TO_DATE('2006-05-10 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-12 12:00:00','RRRR-MM-DD HH24:MI:SS'),39000);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(15,20,'R‚paration Systeme',TO_DATE('2006-06-25 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-06-25 12:00:00','RRRR-MM-DD HH24:MI:SS'),27000);

1 row created.

SQL> INSERT INTO INTERVENTIONS  VALUES(16,27,'R‚paration',TO_DATE('2006-06-27 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-06-30 12:00:00','RRRR-MM-DD HH24:MI:SS'),25000);

1 row created.

-------------------------------------------------------------------

SQL> INSERT INTO INTERVENANTS  VALUES(1,54,TO_DATE('2006-02-26 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-02-26 12:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(1,59,TO_DATE('2006-02-25 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-02-25 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(2,57,TO_DATE('2006-02-24 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-02-24 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(2,59,TO_DATE('2006-02-23 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-02-24 12:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(3,60,TO_DATE('2006-04-09 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-04-09 12:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(3,65,TO_DATE('2006-04-06 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-04-08 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(4,62,TO_DATE('2006-05-14 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-14 12:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(4,66,TO_DATE('2006-02-14 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-14 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(5,56,TO_DATE('2006-02-22 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-02-25 12:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(5,60,TO_DATE('2006-02-23 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-02-25 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(6,53,TO_DATE('2006-03-03 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-03-04 12:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(6,57,TO_DATE('2006-03-04 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-03-04 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(7,55,TO_DATE('2006-04-09 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-04-09 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(7,65,TO_DATE('2006-04-09 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-04-09 12:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(8,54,TO_DATE('2006-05-12 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-12 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(8,62,TO_DATE('2006-05-11 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-12 12:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(9,59,TO_DATE('2006-02-22 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-02-22 12:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(9,60,TO_DATE('2006-02-22 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-02-22 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(10,63,TO_DATE('2006-04-09 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-04-09 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(10,67,TO_DATE('2006-04-08 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-04-09 12:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(11,59,TO_DATE('2006-03-09 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-03-11 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(11,64,TO_DATE('2006-03-09 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-03-17 12:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(11,53,TO_DATE('2006-03-08 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-03-16 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(12,55,TO_DATE('2006-05-05 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-05 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(12,56,TO_DATE('2006-05-03 09:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-05 12:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(13,64,TO_DATE('2006-05-12 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-12 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

SQL> INSERT INTO INTERVENANTS  VALUES(14,80,TO_DATE('2006-05-07 14:00:00','RRRR-MM-DD HH24:MI:SS'),TO_DATE('2006-05-10 18:00:00','RRRR-MM-DD HH24:MI:SS'));

1 row created.

-------------------------------------------------------------------

--question12
SQL> update EMPLOYE set SALAIRE=SALAIRE+5000 WHERE NOMEMP='BADI' and PRENOMEMP='Hatem';

1 row updated.

--question13
SQL> alter table INTERVENTIONS disable constraint datei;

Table altered.

SQL> update INTERVENTIONS set DATEDEBINTERV = DATEDEBINTERV + INTERVAL '5' DAY where extract(month from DATEDEBINTERV)=2;

4 rows updated.

SQL> create table TABERREUR(
  2  	eNUMINTERVENTION int primary key,
  3  	eNUMVEHICULE int,
  4  	eTYPEINTERVENTION char(50),
  5  	eDATEDEBINTERV date,
  6  	eDATEFININTERV date,
  7  	eCOUNTINTERV number(10,5),
  8  	constraint fk_ie foreign key (eNUMVEHICULE) references VEHICULE(NUMVEHICULE)
  9  );

Table created.

SQL> delete from INTERVENANTS where NUMINTERVENTION IN (select NUMINTERVENTION from INTERVENTIONS WHERE DATEDEBINTERV > DATEFININTERV);

8 rows deleted.

SQL> insert into TABERREUR select * from INTERVENTIONS where DATEDEBINTERV > DATEFININTERV;

4 rows created.

SQL> delete from INTERVENTIONS where DATEDEBINTERV > DATEFININTERV;

4 rows deleted.

SQL> alter table INTERVENTIONS enable constraint datei;

Table altered.

--question 14
SQL> delete from INTERVENANTS where NUMINTERVENTION in (select NUMINTERVENTION from INTERVENTIONS where NUMVEHICULE in (select NUMVEHICULE from VEHICULE where NUMMODELE in (select NUMMODELE from MODELE where MODELE ='Serie 5')));

3 rows deleted.

SQL> delete from INTERVENTIONS where NUMVEHICULE in (select NUMVEHICULE from VEHICULE where NUMMODELE in (select NUMMODELE from MODELE where MODELE ='Serie 5'));

1 row deleted.

SQL> delete from VEHICULE where NUMMODELE in (select NUMMODELE from MODELE where MODELE='Serie 5');

1 row deleted.

--fin
SQL> SPOOL OFF;
