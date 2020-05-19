# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\izostanciferit.sql
drop database if exists izostanciferit;
create database izostanciferit;
use izostanciferit;

create table izostanak(
	sifra int not null primary key auto_increment,
	kolegij int not null,
	student int not null,
	brsati int,
	datum datetime);

create table student(
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	smjer int not null,
	grupa int,
	godina varchar(10) not null,
	jmbag char(10));

create table kolegij(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	semestar int,
	satipredavanja varchar(50),
	sativjezbi varchar(50),
	brojects int not null,
	nositelj varchar(50));

create table grupa(
	sifra int not null primary key auto_increment,
	naziv varchar (50) not null,
	smjer int,
	kolegij int, 
	student int);

create table smjer(
	sifra int not null primary key auto_increment,
	naziv varchar(50));

alter table izostanak add foreign key (kolegij) references kolegij(sifra);
alter table izostanak add foreign key (student) references student(sifra);

alter table student add foreign key (smjer) references smjer(sifra);

alter table grupa add foreign key (smjer) references smjer(sifra);
alter table grupa add foreign key (kolegij) references kolegij(sifra);

alter table student add foreign key (grupa) references grupa(sifra);

