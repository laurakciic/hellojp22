# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\galerija.sql
drop database if exists galerija;
create database galerija;

create table slika(
    sifra int not null primary key auto_increment,
    tema varchar(50) not null,
    opis text,
    autor int not null,
    datum datetime
);

create table autor(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    slika int not null
);

create table sponzor(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    slika int not null
);

alter table autor add foreign key (slika) references slika(sifra);
alter table sponzor add foreign key (slika) references slika(sifra);
alter table slika add foreign key (autor) references autor(sifra);