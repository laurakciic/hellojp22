# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij1.sql
drop database if exists kolokvij1;
create database kolokvij1;
use kolokvij1;

create table sestra(
	sifra int not null primary key auto_increment,
	jmbag char (11), 
	hlace varchar (42) not null,
	vesta varchar (41),
	prviputa datetime not null,
	modelnaocala varchar (33),
	becar int);
	
create table becar(
	sifra int not null primary key auto_increment,
	drugiputa datetime not null,
	carape varchar(36),
	bojaociju varchar(46),
	haljina varchar(32));
	
create table ostavljena(
	sifra int not null primary key auto_increment,
	jmbag char(11),
	bojaociju varchar(49),
	suknja varchar(31) not null,
	bojakose varchar(45) not null,
	prviputa datetime,
	carape varchar(41) not null);

create table mladic(
	sifra int not null primary key auto_increment,
	prstena int not null,
	maraka decimal(15,9) not null,
	suknja varchar(30),
	narukvica int not null,
	ostavljena int not null);

create table ostavljena_snasa(
	sifra int not null primary key auto_increment,
	ostavljena int not null,
	snasa int not null);

create table cura(
	sifra int not null primary key auto_increment,
	bojakose varchar(36),
	jmbag char(11) not null,
	prstena int not null,
	dukserica varchar(38),
	mladic int);

create table snasa(
	sifra int not null primary key auto_increment,
	eura decimal(14,5),
	narukvica int,
	drugiputa datetime not null,
	carape varchar(41));

create table punac(
	sifra int not null primary key auto_increment,
	ekstroventno boolean not null,
	vesta varchar(31),
	asocijalno boolean not null,
	prviputa datetime,
	eura decimal(15,6) not null,
	cura int);

alter table sestra add foreign key (becar) references becar(sifra);
alter table mladic add foreign key (ostavljena) references ostavljena(sifra);
alter table ostavljena_snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table cura add foreign key (mladic) references mladic(sifra);
alter table ostavljena_snasa add foreign key (snasa) references snasa(sifra);
alter table punac add foreign key (cura) references cura(sifra);

describe cura;
insert into cura(jmbag, prstena, bojakose) values
(1012987343, 2, 'smeđa'),
(1237563748, 1, 'crna'),
(1284859203, 1, 'plava');
select * from cura;

describe ostavljena;
insert into ostavljena(suknja, bojakose, carape) values
('pencil', 'smeđa', 'crne stopalice'),
('dugacka', 'crna', 'crne'),
('dugacka', 'plava', 'bijele');

describe snasa;
insert into snasa(drugiputa, carape) values
('2019-5-5', 'crne stopalice'),
('2019-4-4', 'crne'),
('2019-3-3', 'bijele');

describe ostavljena_snasa;
insert into ostavljena_snasa(ostavljena, snasa) values
(1, 1),
(2, 2),
(3,3);

describe mladic;
insert into mladic(prstena, maraka, narukvica, ostavljena) values
(2, 1000, 2, 1),
(1, 500, 3, 2),
(3, 100, 1, 3);

update sestra set hlace = 'Osijek';

delete from punac where vesta != 'AB';

describe mladic;
select suknja from mladic 
where maraka != ('7' || '11' || '18' || '25' || '40'); 





























