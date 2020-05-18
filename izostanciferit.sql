# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\izostanciferit.sql
drop database if exists izostanciferit;
create database izostanciferit;
use izostanciferit;

create table student(
	sifra int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	smjer varchar(50),
	godina varchar(10),
	jmbag char(10));

create table kolegij(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	semestar int,
	satipredavanja varchar(50),
	sativjezbi varchar(50),
	brojects int);

create table izostanak(
	sifra int not null primary key auto_increment,
	kolegij int not null,
	student int not null,
	brojsati int,
	datum datetime);

alter table izostanak add foreign key (kolegij) references kolegij(sifra);
alter table izostanak add foreign key (student) references student(sifra);
