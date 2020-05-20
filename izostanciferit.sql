# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\izostanciferit.sql
drop database if exists izostanciferit;
create database izostanciferit;
use izostanciferit;

create table izostanak(
	sifra int not null primary key auto_increment,
	student int not null,
	grupa int,
	datum datetime not null);

create table student(
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	jmbag char(10));

create table kolegij(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	smjer int,
	semestar int not null,
	satipredavanja varchar(50),
	sativjezbi varchar(50),
	dozvoljenoizostanaka int,
	brojects int not null,
	nositelj varchar(50));

create table grupa(
	sifra int not null primary key auto_increment,
	naziv varchar (50) not null,
	kolegij int not null);

create table smjer(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null);

create table clan(
	sifra int not null primary key auto_increment,
	student int,
	grupa int
	);

alter table izostanak add foreign key (student) references student(sifra);
alter table izostanak add foreign key (grupa) references grupa(sifra);

alter table grupa add foreign key (kolegij) references kolegij(sifra);

alter table clan add foreign key (student) references student(sifra);
alter table clan add foreign key (grupa) references grupa(sifra);

alter table kolegij add foreign key (smjer) references smjer(sifra);
# smjer, kolegij, grupa, student, izostanak

show tables;
describe smjer;
insert into smjer(naziv) values
('Preddiplomski sveučilišni studij elektrotehnika'),
('Preddiplomski sveučilišni studij računarstvo'),
('Preddiplomski stručni studij računarstvo'),
('Preddiplomski stručni studij automatika'),
('Preddiplomski stručni studij energetika');
select * from smjer;


