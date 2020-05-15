# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\galerija.sql
drop database if exists galerija;
create database galerija;
use galerija;

create table slika(
    sifra int not null primary key auto_increment,
    tema varchar(50) not null,
    opis text,
    autor int not null,
    datum datetime
);

create table autor(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

create table sponzor(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(100),
    slika int not null
);

alter table sponzor add foreign key (slika) references slika(sifra);
alter table slika add foreign key (autor) references autor(sifra);

# describe autor;
insert into autor(ime, prezime)
values
('Pablo', 'Picasso'),
('Edvard', 'Munch'),
('Gustav', 'Klimt');
# select * from autor;

# describe slika;
insert into slika(tema, autor)
values
('Dječak s lulom', 1),
('Krik', 2),
('Portret Adele Bloh-Bauer', 3);
# select * from slika;

# describe sponzor;
insert into sponzor(ime, prezime, slika)
values('Ivan', 'Ivić', 1),
('Pero', 'Peric', 2),
('Goran', 'Gogić', 3);
# select * from sponzor;