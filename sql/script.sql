
begin transaction;

create table adresa(
	id int primary key identity(1,1),
	ulice varchar(50) not null,
	cislo_popisne int not null check(cislo_popisne > 0),
	psc int not null check(psc > 0),
	mesto varchar(30) not null,
	zeme varchar(30) not null
);

create table zakaznik(
	id int primary key identity(1,1),
	jmeno varchar(30) not null,
	prijmeni varchar(30) not null,
	email varchar(100) not null check(email like '%@%'),
	telefon varchar(9) not null,
	cislo_obc_prukazu int not null check(cislo_obc_prukazu > 0),
	rodne_cislo varchar(12) not null check(rodne_cislo like '%/%'),
	adresa_id int foreign key references adresa(id)
);

create table tarif(
	id int primary key identity(1,1),
	nazev varchar(30) not null,
	mnozstvi_dat varchar(30) not null,
	rychlost varchar(30) not null,
	rychlost_5G bit not null,
	sleva_na_mobil int not null check(sleva_na_mobil > 0),
	cena_mesicni int not null check(cena_mesicni > 0)
);


create table mobil(
	id int primary key identity(1,1),
	nazev varchar(50) not null,
	znacka varchar(30) not null,
	barva varchar(30) not null,
	velikost_pameti int not null check(velikost_pameti > 0),
	cena_ks int not null check(cena_ks > 0),
	tarif_id int foreign key references tarif(id)
);

create table platba(
	id int primary key identity(1,1),
	typ_platby varchar(20) check(typ_platby in ('kreditni karta', 'bankovnim prevodem')),
	referencni_cislo varchar(50) not null,
	poplatek int,
	poznamka varchar(30)
);

create table zamestnanec(
	id int primary key identity(1,1),
	jmeno varchar(30) not null,
	prijmeni varchar(30) not null,
	email varchar(100) not null check(email like '%@%'),
	speacializace varchar(50) not null
);

create table objednavka(
	id int primary key identity(1,1),
	cislo_obj int not null check(cislo_obj > 0),
	zakaznik_id int foreign key references zakaznik(id),
	mobil_id int foreign key references mobil(id),
	platba_id int foreign key references platba(id),
	zamestanec_id int foreign key references zamestnanec(id),
	datum_vytvoreni date not null,
	datum_konecny date not null,
	celkova_cena int not null check(celkova_cena > 0),
);

commit transaction;


begin transaction;

INSERT INTO adresa (ulice, cislo_popisne, psc, mesto, zeme)
VALUES
('V ulicce', 105, 22231, 'Kladno', 'Ceska republika'),
('Na vyhlidce', 32, 12131, 'Praha', 'Ceska republika'),
('Na kopci', 131, 12132, 'Praha', 'Ceska republika'),
('Pred divadlem', 95, 42758, 'Olomouc', 'Ceska republika'),
('Na rohu', 65, 15975, 'Plzen', 'Ceska republika'),
('Zahradni', 38, 12131, 'Praha', 'Ceska republika'),
('U halusek', 17, 31558, 'Bratislava', 'Slovensko'),
('Lidicka', 41, 32562, 'Kosice', 'Slovensko'),
('U lesa', 185, 36957, 'Liberec', 'Ceska republika'),
('U aquaparku', 501, 22231, 'Kladno', 'Ceska republika');

INSERT INTO zakaznik (jmeno, prijmeni, email, telefon, cislo_obc_prukazu, rodne_cislo, adresa_id)
VALUES
('Jan', 'Novak', 'jan.novak@email.com', '123456789', 123456789, '010101/1234', 1),
('Eva', 'Svobodova', 'eva.svobodova@email.com', '987654321', 987654321, '020202/5678', 2),
('Petr', 'Prochazka', 'petr.prochazka@email.com', '111222333', 111222333, '030303/9876', 3),
('Katerina', 'Kovarova', 'katerina.kovarova@email.com', '555444333', 555444333, '040404/5678', 4),
('David', 'Dvorak', 'david.dvorak@email.com', '777888999', 777888999, '050505/1234', 5),
('Lucie', 'Lukasova', 'lucie.lukasova@email.com', '111333555', 111333555, '060606/9876', 6),
('Tomas', 'Tomasek', 'tomas.tomasek@email.com', '999888777', 999888777, '070707/5678', 7),
('Veronika', 'Vorlova', 'veronika.vorlova@email.com', '333222111', 333222111, '080808/1234', 8),
('Martin', 'Mares', 'martin.mares@email.com', '666777888', 666777888, '090909/9876', 9),
('Barbora', 'Bartova', 'barbora.bartova@email.com', '444555666', 444555666, '101010/5678', 10);

INSERT INTO tarif (nazev, mnozstvi_dat, rychlost, rychlost_5G, sleva_na_mobil, cena_mesicni)
VALUES
('Standard', '5 GB', '10 Mbps', 0, 100, 500),
('Premium', '10 GB', '20 Mbps', 1, 150, 700),
('Business', '20 GB', '50 Mbps', 1, 200, 1000),
('Family', '15 GB', '30 Mbps', 1, 120, 600),
('Starter', '2 GB', '5 Mbps', 0, 50, 300),
('Ultimate', '50 GB', '100 Mbps', 1, 250, 1200),
('Pro', '30 GB', '70 Mbps', 1, 180, 900),
('Lite', '8 GB', '15 Mbps', 0, 80, 400),
('Unlimited', 'Unlimited', '150 Mbps', 1, 300, 1500),
('Basic', '3 GB', '8 Mbps', 0, 70, 350);

INSERT INTO mobil (nazev, znacka, barva, velikost_pameti, cena_ks, tarif_id)
VALUES
('iPhone 13', 'Apple', 'Space Gray', 128, 15000, 1),
('Samsung Galaxy S21', 'Samsung', 'Phantom Black', 256, 12000, 2),
('OnePlus 9', 'OnePlus', 'Arctic Sky', 64, 8000, 3),
('Google Pixel 6', 'Google', 'Just Black', 128, 10000, 4),
('Xiaomi Redmi Note 10', 'Xiaomi', 'Aqua Green', 64, 6000, 5),
('Huawei P40', 'Huawei', 'Midnight Black', 256, 11000, 6),
('Sony Xperia 5 III', 'Sony', 'Frosted Black', 128, 13000, 7),
('Motorola Moto G Power', 'Motorola', 'Flash Gray', 64, 7000, 8),
('Nokia 8.3', 'Nokia', 'Polar Night', 128, 12000, 9),
('LG Velvet', 'LG', 'Aurora Gray', 128, 9000, 10);

INSERT INTO platba (typ_platby, referencni_cislo, poplatek, poznamka)
VALUES
('kreditni karta', '1234-5678-9012-3456', 50, 'Objednavka 1 platba'),
('bankovnim prevodem', 'CZ123456789', 20, 'Objednavka 2 platba')

INSERT INTO zamestnanec (jmeno, prijmeni, email, speacializace)
VALUES
('Michaela', 'Hodinova', 'michaela.hodinova@email.com', 'Customer Service'),
('Pavel', 'Novotny', 'pavel.novotny@email.com', 'Technical Support'),
('Karolina', 'Svobodova', 'karolina.svobodova@email.com', 'Sales'),
('Ondrej', 'Kovar', 'ondrej.kovar@email.com', 'Marketing'),
('Simona', 'Mareckova', 'simona.mareckova@email.com', 'Human Resources'),
('Jiri', 'Hruska', 'jiri.hruska@email.com', 'Finance'),
('Alena', 'Prochazkova', 'alena.prochazkova@email.com', 'IT'),
('Lukas', 'Vlasak', 'lukas.vlasak@email.com', 'Development'),
('Ivana', 'Havelkova', 'ivana.havelkova@email.com', 'Legal'),
('Jakub', 'Kovac', 'jakub.kovac@email.com', 'Operations');

INSERT INTO objednavka (cislo_obj, zakaznik_id, mobil_id, platba_id, zamestanec_id, datum_vytvoreni, datum_konecny, celkova_cena)
VALUES
(101, 1, 1, 1, 2, '2023-01-01', '2023-01-10', 15050),
(102, 2, 2, 2, 1, '2023-02-01', '2023-02-15', 12150),
(103, 3, 3, 1, 3, '2023-03-01', '2023-03-20', 8270),
(104, 4, 4, 1, 4, '2023-04-01', '2023-04-15', 11040),
(105, 5, 5, 1, 5, '2023-05-01', '2023-05-10', 6140),
(106, 6, 6, 2, 6, '2023-06-01', '2023-06-20', 11490),
(107, 7, 7, 1, 7, '2023-07-01', '2023-07-15', 8445),
(108, 8, 8, 2, 8, '2023-08-01', '2023-08-10', 11420),
(109, 9, 9, 2, 9, '2023-09-01', '2023-09-20', 8335),
(110, 10, 10, 2, 10, '2023-10-01', '2023-10-15', 9480);

commit transaction;

/* -- INDEX -- */
/*Index pro sloupec nazev v tabulce mobil*/
create index idx_nazev on mobil(nazev);

/*Index pro sloupec nazev v tabulce tarif*/
create index idx_nazev_tarif on tarif(nazev);


/* -- VIEWS -- */
/*vypis objednavky*/
go
create view vypis_objednavky as
select objednavka.cislo_obj as cislo_obj, zakaznik.jmeno as jmeno, zakaznik.prijmeni as prijmeni, mobil.nazev as mobil, tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, platba.typ_platby as typ_platby, zamestnanec.prijmeni as zamestnanec, objednavka.celkova_cena
from objednavka inner join zakaznik on objednavka.zakaznik_id = zakaznik.id inner join mobil on objednavka.mobil_id = mobil.id inner join tarif on mobil.tarif_id = tarif.id inner join platba on objednavka.platba_id = platba.id inner join zamestnanec on objednavka.zamestanec_id = zamestnanec.id;
go

/*vypis zamestnancu*/
go
create view vypis_zamestnancu as 
select zamestnanec.jmeno as jmeno, zamestnanec.prijmeni as prijmeni, zamestnanec.email as email, zamestnanec.speacializace as specializace
from zamestnanec;
go

/*vypis mobilu*/
go
create view vypis_mobilu as
select mobil.nazev as nazev, mobil.znacka as znacka, mobil.barva as barva, mobil.velikost_pameti as vel_pameti, mobil.cena_ks as cena
from mobil;
go

/*vypis_platby*/
go
create view vypis_platby as 
select platba.typ_platby as typ, platba.referencni_cislo as ref_cislo, platba.poplatek as poplatek, platba.poznamka as poznamka
from platba;
go

/*vypis tarifu*/
go
create view vypis_tarifu as
select tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, tarif.rychlost as rychlost, tarif.rychlost_5G as rychlost_5G, tarif.sleva_na_mobil as sleva_na_mobil, tarif.cena_mesicni as cena
from tarif;
go

/*vypis zakazniku*/
go
create view vypis_zakazniku as
select zakaznik.jmeno as jmeno, zakaznik.prijmeni as prijmeni, zakaznik.email as email, zakaznik.telefon as telefon, zakaznik.cislo_obc_prukazu as cislo_obc_prukazu, zakaznik.rodne_cislo as rodne_cislo
from zakaznik;
go

/*vypis adres*/
go 
create view vypis_adres as
select adresa.ulice as ulice, adresa.cislo_popisne as cislo_popisne, adresa.psc as psc, adresa.mesto as mesto, adresa.zeme as zeme
from adresa;
go

/*vypis tabulky a poctu zaznamu v ni*/
go 
create view count_of_all as
select 'adresa' as tabulka, (select count(*) from adresa) as pocet_zaznamu
union
select 'zakaznik' as tabulka, (select count(*) from zakaznik) as pocet_zaznamu
union
select 'tarif' as tabulka, (select count(*) from tarif) as pocet_zaznamu
union
select 'mobil' as tabulka, (select count(*) from mobil) as pocet_zaznamu
union
select 'platba' as tabulka, (select count(*) from platba) as pocet_zaznamu
union
select 'zamestnanec' as tabulka, (select count(*) from zamestnanec) as pocet_zaznamu
union
select 'objednavka' as tabulka, (select count(*) from objednavka) as pocet_zaznamu;
go


/*vypis souctu trzby*/
go
create view vypis_souctu_trzeb as
select sum(celkova_cena) as soucet_cen_objednavek
from objednavka;
go

/*vypis nejdrazsiho tarifu*/
go
create view vypis_max_tarif as
select tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, tarif.rychlost as rychlost, tarif.rychlost_5G as rychlost_5G, tarif.sleva_na_mobil as sleva_na_mobil, tarif.cena_mesicni as cena
from tarif
where (select max(tarif.cena_mesicni) from tarif) = tarif.cena_mesicni;
go

/*vypis nejlevnejsiho tarifu*/
go
create view vypis_min_tarif as
select tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, tarif.rychlost as rychlost, tarif.rychlost_5G as rychlost_5G, tarif.sleva_na_mobil as sleva_na_mobil, tarif.cena_mesicni as cena
from tarif
where (select min(tarif.cena_mesicni) from tarif) = tarif.cena_mesicni;
go


select * from vypis_adres;
select * from vypis_zakazniku;
select * from vypis_tarifu;
select * from vypis_mobilu;
select * from vypis_platby;
select * from vypis_zamestnancu;
select * from vypis_objednavky;
select * from count_of_all;
select * from vypis_souctu_trzeb;
select * from vypis_max_tarif;
select * from vypis_min_tarif;

/* -- PROCEDURES -- */
/*procedura pro vypis zakaznika na zaklade jeho jmena*/
go
create procedure vypis_by_name @name nvarchar(30), @surname nvarchar(30)
as
select zakaznik.jmeno as jmeno, zakaznik.prijmeni as prijmeni, zakaznik.email as email, zakaznik.telefon as telefon, zakaznik.cislo_obc_prukazu as cislo_prukazu, zakaznik.rodne_cislo as rodne_cislo, adresa.ulice as ulice, adresa.cislo_popisne as cislo_popisne, adresa.psc as psc, adresa.mesto as mesto, adresa.zeme as zeme
from zakaznik inner join adresa on zakaznik.adresa_id = adresa.id
where zakaznik.jmeno = @name and zakaznik.prijmeni = @surname;
go

/*procedura pro vypis zakaznika na zaklade jeho rodneho cisla, protoze je unikatni*/
go 
create procedure vypis_by_rodne_cislo @rodne_cislo varchar(12)
as
select zakaznik.jmeno as jmeno, zakaznik.prijmeni as prijmeni, zakaznik.email as email, zakaznik.telefon as telefon, zakaznik.cislo_obc_prukazu as cislo_prukazu, zakaznik.rodne_cislo as rodne_cislo, adresa.ulice as ulice, adresa.cislo_popisne as cislo_popisne, adresa.psc as psc, adresa.mesto as mesto, adresa.zeme as zeme
from zakaznik inner join adresa on zakaznik.adresa_id = adresa.id
where zakaznik.rodne_cislo = @rodne_cislo
go

/*procedura pro vypis objednavky na zaklade cisla objednavky*/
go
create procedure vypis_by_cislo_obj @cislo_obj int
as
select objednavka.cislo_obj as cislo_obj, zakaznik.jmeno as jmeno, zakaznik.prijmeni as prijmeni, mobil.nazev as mobil, tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, platba.typ_platby as typ_platby, zamestnanec.prijmeni as zamestnanec, objednavka.celkova_cena
from objednavka inner join zakaznik on objednavka.zakaznik_id = zakaznik.id inner join mobil on objednavka.mobil_id = mobil.id inner join tarif on mobil.tarif_id = tarif.id inner join platba on objednavka.platba_id = platba.id inner join zamestnanec on objednavka.zamestanec_id = zamestnanec.id
where objednavka.cislo_obj = @cislo_obj;
go

/*procedura pro zmenu bydliste zakaznika podle rodneho cisla*/
go
create procedure update_adresa @rodne_cislo nvarchar(12), @new_ulice nvarchar(50), @new_cislo_popisne int, @new_psc int, @new_mesto nvarchar(30), @new_zeme nvarchar(30)
as
begin 
declare @adresa_id int

select @adresa_id = zakaznik.adresa_id
from zakaznik
where zakaznik.rodne_cislo = @rodne_cislo;

update adresa
set ulice = @new_ulice,
cislo_popisne = @new_cislo_popisne,
psc = @new_psc,
mesto = @new_mesto,
zeme = @new_zeme
where id = @adresa_id;

end
go

/*procedura pro zmenu emailu a telefonu u zakaznika podle rodneho cisla*/
go
create procedure update_kontaktni_udaje @rodne_cislo nvarchar(12), @new_email nvarchar(100), @new_telefon nvarchar(9)
as
update zakaznik
set email = @new_email,
telefon = @new_telefon
where rodne_cislo = @rodne_cislo;
go


/*procedura pro smazani objednavky na zaklade cisla objednavky*/
go
create procedure delete_obj @cislo_obj int
as
delete from objednavka 
where cislo_obj = @cislo_obj;
go

exec vypis_by_name @name = 'Jan', @surname = 'Novak';
exec vypis_by_rodne_cislo @rodne_cislo = '010101/1234';
exec vypis_by_cislo_obj @cislo_obj = 101;
exec update_adresa @rodne_cislo = '010101/1234', @new_ulice = 'V brcale', @new_cislo_popisne = 11, @new_psc = 66666, @new_mesto = 'Brno', @new_zeme = 'Ceska republika';
exec update_kontaktni_udaje @rodne_cislo = '010101/1234', @new_email = 'novak.jan@seznam.cz', @new_telefon = '666777666';
exec delete_obj @cislo_obj = 202;

/* -- TRIGGERS -- */

/*trigger pro nastaveni datumu po vytvoreni objednavky*/
go
create trigger set_datum
on objednavka
after insert
as
begin

declare @obj_id int;
declare @datum_vytvoreni date;

select @obj_id = id,
@datum_vytvoreni = datum_vytvoreni
from inserted;

update objednavka
set datum_konecny = DATEADD(day, 30, @datum_vytvoreni)
where id = @obj_id;

end
go

/*trigger ktery pricte poplatek za typ platby k celkove cene objednavky*/
go
create trigger set_poplatek
on objednavka
after insert
as
begin

declare @obj_id int;
declare @platba_id int;
declare @poplatek int;

select @obj_id = i.id,
@platba_id = i.platba_id
from inserted i

select @poplatek = poplatek from platba where id = @platba_id;

update objednavka
set celkova_cena = (celkova_cena + @poplatek)
where id = @obj_id;

end
go



/*trigger na odecteni slevy na mobil z tarifu pri vytvoreni objednavky*/
go
create trigger set_sleva
on objednavka
after insert
as
begin

declare @obj_id int;
declare @mobil_id int;
declare @tarif_sleva int;
declare @cena_mobilu int;

select @obj_id = id,
@mobil_id = mobil_id
from inserted;

select @tarif_sleva = t.sleva_na_mobil,
@cena_mobilu = m.cena_ks
from mobil m
join tarif t on m.tarif_id = t.id
where m.id = @mobil_id;

update objednavka
set celkova_cena = celkova_cena - @tarif_sleva
where id = @obj_id;

end 
go



