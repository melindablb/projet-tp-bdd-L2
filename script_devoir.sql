spool C:\tpBDD\spooldm.sql;
--partie 1

--question 1
create user DBAINTERVENTION identified by 0123;

--question 2
grant all privileges to DBAINTERVENTION;

connect DBAINTERVENTION
0123

--partie 2

--question4
create table CLIENT(
	NUMCLIENT int primary key,
	CIV char(5),
	PRENOMCLIENT char(25),
	NOMCLIENT char(25),
	DATENAISSANCE date,
	ADRESSE char(100),
	TELPROF number(10),
	TELPRIV number(10),
	FAX number(10),
	constraint c1 check (CIV in ('M','Mle','Mme'))
);

create table EMPLOYE(
	NUMEMPLOYE int primary key,
	NOMEMP char(25),
	PRENOMEMP char(25),
	CATEGORIE char(20),
	SALAIRE number(10,5),
	constraint c2 check (CATEGORIE in('Mécanicien', 'Assistant'))
);

create table MARQUE(
	NUMMARQUE int primary key,
	MARQUE char(50),
	PAYS char(50)
);
create table MODELE(
	NUMMODELE int primary key,
	NUMMARQUE int ,
	MODELE char(50),
	constraint fk_m foreign key (NUMMARQUE) references MARQUE(NUMMARQUE)
);
create table VEHICULE(
	NUMVEHICULE int primary key,
	NUMCLIENT int,
	NUMMODELE int,
	NUMIMMAT int,
	ANNEEE number(4),
	constraint fk_v1 foreign key (NUMCLIENT) references CLIENT(NUMCLIENT),
	constraint fk_v2 foreign key (NUMMODELE) references MODELE(NUMMODELE)
	);
create table INTERVENTIONS(
	NUMINTERVENTION int primary key,
	NUMVEHICULE int,
	TYPEINTERVENTION char(50),
	DATEDEBINTERV date,
	DATEFININTERV date,
	COUNTINTERV number(10,5),
	constraint fk_i foreign key (NUMVEHICULE) references VEHICULE(NUMVEHICULE)
);
create table INTERVENANTS(
	NUMINTERVENTION int,
	NUMEMPLOYE int,
	DATEDEBUT date,
	DATEFIN date,
	constraint pk_i2 primary key (NUMINTERVENTION,NUMEMPLOYE),
	constraint fk_i21 foreign key (NUMINTERVENTION) references INTERVENTIONS(NUMINTERVENTION),
	constraint fk_i22 foreign key(NUMEMPLOYE) references EMPLOYE(NUMEMPLOYE)
);

--question 5
alter table EMPLOYE add DATEINSTALLATION date;

--question 6
alter table EMPLOYE add constraint notnul_e check (CATEGORIE is not null and SALAIRE is not null);

--question 7
-- agrandir
alter table EMPLOYE modify PRENOMEMP char(30);
--reduire
alter table EMPLOYE modify PRENOMEMP char(24);

--question 8
alter table EMPLOYE drop column DATEINSTALLATION;
--verification
desc EMPLOYE

--question 9
alter table CLIENT rename column ADRESSE to ADRESSECLIENT;
--verification
desc CLIENT

--question 10
alter table INTERVENTIONS add constraint datei check (DATEDEBINTERV < DATEFININTERV);

--partie 3

--question 12
update EMPLOYE set SALAIRE=SALAIRE+5000 WHERE NOMEMP='BADI' and PRENOMEMP='Hatem';

--question13
alter table INTERVENTIONS disable constraint datei;
update INTERVENTIONS set DATEDEBINTERV = DATEDEBINTERV + INTERVAL '5' DAY where extract(month from DATEDEBINTERV)=2;
create table TABERREUR(
	eNUMINTERVENTION int primary key,
	eNUMVEHICULE int,
	eTYPEINTERVENTION char(50),
	eDATEDEBINTERV date,
	eDATEFININTERV date,
	eCOUNTINTERV number(10,5),
	constraint fk_ie foreign key (eNUMVEHICULE) references VEHICULE(NUMVEHICULE)
);

delete from INTERVENANTS where NUMINTERVENTION IN (select NUMINTERVENTION from INTERVENTIONS WHERE DATEDEBINTERV > DATEFININTERV);
insert into TABERREUR select * from INTERVENTIONS where DATEDEBINTERV > DATEFININTERV;
delete from INTERVENTIONS where DATEDEBINTERV > DATEFININTERV;
alter table INTERVENTIONS enable constraint datei;

--question 14
delete from INTERVENANTS where NUMINTERVENTION in (select NUMINTERVENTION from INTERVENTIONS where NUMVEHICULE in (select NUMVEHICULE from VEHICULE where NUMMODELE in (select NUMMODELE from MODELE where MODELE ='Serie 5')));
delete from INTERVENTIONS where NUMVEHICULE in (select NUMVEHICULE from VEHICULE where NUMMODELE in (select NUMMODELE from MODELE where MODELE ='Serie 5'));
delete from VEHICULE where NUMMODELE in (select NUMMODELE from MODELE where MODELE='Serie 5');

--fin
SPOOL OFF;
