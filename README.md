# Praktická maturitní zkouška

**Střední průmyslová škola elektrotechnická, Praha 2, Ječná 30**
**Školní rok 2023/2024**
---
 Jméno a příjmení: Šimon Bernard    
 Třída: C4b
---

## Úvod

- **Téma: Telekomunikace, web**    
    
Problém v oblasti telekomunikace jsem se rozhodl řešit v MSSQL Server, jako návrhové prostředí jsem 
využil Oracle DataModeler, v němž jsem vytvořil logické a relační schéma.    
    
Dokumentace poskytuje komplexní informace o databázi a cílem projektu je vytvoření databáze pro firmu T-Mobile, kde zaznaménavám informace o objednávkách, zaměstnancích, mobilech, tarifech, zákaznících a jejich adresách.    
    
Struktura databáze je navržena, aby co nejvíce napodobila reálné procesy podniku a samotná databáze obsahuje hned několik propojených tabulek a vztahů k rychlé a efektvní práci.    

## E-R model

Konceptuální (logický) model databáze se nachází v /img/Logical.png    
Relační model databáze se také nachází v /img/Relational.png

### Logický model
![Logical](https://raw.githubusercontent.com/SimonBer7/Telekomunikace_DS/main/img/Logical.png)

### Relační model
![Relational](https://raw.githubusercontent.com/SimonBer7/Telekomunikace_DS/main/img/Relational.png)

## Entitní integrita

Každá entita obsahuje uměle vytvořený primární klíč, označený jako `id`, 
který se s každým dalším záznamem inkrementuje a slouží jako jedinečný identifikátor. Tento klíč usnadňuje propojování mezi tabulkami a vyhledávání.

## Doménová integrita

adresa
 - ulice - textový řetězec, maximálně 50 znaků, povinný
 - cislo_popisne - celé číslo, povinné, musí být kladné
 - psc - celé číslo, povinné, musí být kladné
 - mesto - textový řetězec, maximálně 30 znaků, povinný
 - zeme - textový řetězec, maximálně 30 znaků, povinný

zakaznik
- jmeno - textový řetězec, maximálně 30 znaků, povinný
- prijmeni - textový řetězec, maximálně 30 znaků, povinný
- email - textový řetězec, maximálně 100 znaků, povinný, musí obsahovat "@"
- telefon - textový řetězec, maximálně 9 znaků, povinný
- cislo_obc_prukazu - celé číslo, povinný, musí být kladné
- rodne_cislo - textový řetězec, maximálně 12 znaků, povinný, musí obsahovat "/"

tarif
- nazev - textový řetězec, maximálně 30 znaků, povinný
- mnozstvi_dat - textový řetězec, maximálně 30 znaků, povinný
- rychlost - textový řetězec, maximálně 30 znaků, povinný
- rychlost_5G - jeden znak (0/1), povinný
- sleva_na_mobil - celé číslo, povinný, musí být kladné
- cena_mesicni - celé číslo, povinný, musí být kladné

mobil 
- nazev - textový řetězec, maximálně 50 znaků, povinný
- znacka - textový řetězec, maximálně 30 znaků, povinný
- barva - textový řetězec, maximálně 30 znaků, povinný
- velikost_pameti - celé číslo, povinný, musí být kladné
- cena_ks - celé číslo, povinný, musí být kladné

platba
- typ_platby - textový řetězec, maximálně 20 znaků, povinný, přímé hodnoty ('kreditni karta', 'bankovnim prevodem')
- referencni_cislo - textový řetězec, maximálně 50 znaků, povinný
- poplatek - celé číslo
- poznamka - textový řetězec, maximálně 30 znaků

zamestnanec
- jmeno - textový řetězec, maximálně 30 znaků, povinný
- prijmeni - textový řetězec, maximálně 30 znaků, povinný
- email - textový řetězec, maximálně 100 znaků, povinný, musí obsahovat "@"
- specializace - textový řetězec, maximálně 50 znaků, povinný

objednavka
- cislo_obj - celé číslo, povinný, musí být kladné
- datum_vytvoreni - datum, povinný
- datum_konecny - datum, povinný
- celkova_cena - celé číslo, povinný, musí být kladné


## Referenční integrita

Návrh obsahuje několik cizích klíčů, které jsou uvedeny níže    
    
zakaznik 
- adresa_id - cizí klíč, kterým odkazuji na tabulku adresa

mobil
- tarif_id - cizí klíč, kterým odkazuji na tabulku tarif

objednavka
- zakaznik_id - cizí klíč, kterým odkazuji na tabulku zakaznik
- mobil_id - cizí klíč, kterým odkazuji na tabulku mobil
- platba_id - cizí klíč, kterým odkazuji na tabulku platba
- zamestnanec_id - cizí klíč, kterým odkazuji na tabulku zamestnanec



## Indexy 
- Databáze má pro každou entitu indexy vytvořené pro primární klíče, další jsou uvedeny níže:
```
/* -- INDEX -- */
/*Index pro sloupec nazev v tabulce mobil*/
create index idx_nazev on mobil(nazev);

/*Index pro sloupec nazev v tabulce tarif*/
create index idx_nazev_tarif on tarif(nazev);
```

## Pohledy
- Návrh obsahuje hned několik pohledů základních pohledů, které vypíšou data z jednotlivých tabulek. Dále návrh obsahuje pohledy, které využívají agregační funkce:
   - vypis_souctu_trzeb - pohled, který vypíše součet cen objednávek, sum()
   - vypis_max_tarif - pohled, který vypíše nejdražší tarif, max()
   - vypis_min_tarif - pohled, který vypíše nejlevnější tarif, min()
 
```
go
create view vypis_max_tarif as
select tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, tarif.rychlost as rychlost, tarif.rychlost_5G as rychlost_5G, tarif.sleva_na_mobil as sleva_na_mobil, tarif.cena_mesicni as cena
from tarif
where (select max(tarif.cena_mesicni) from tarif) = tarif.cena_mesicni;
go
```
- Důležitý pro tento návrh je také pohled pro výpis celé objednávky
```
go
create view vypis_objednavky as
select objednavka.cislo_obj as cislo_obj, zakaznik.jmeno as jmeno, zakaznik.prijmeni as prijmeni, mobil.nazev as mobil, tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, platba.typ_platby as typ_platby, zamestnanec.prijmeni as zamestnanec, objednavka.celkova_cena
from objednavka inner join zakaznik on objednavka.zakaznik_id = zakaznik.id inner join mobil on objednavka.mobil_id = mobil.id inner join tarif on mobil.tarif_id = tarif.id inner join platba on objednavka.platba_id = platba.id inner join zamestnanec on objednavka.zamestanec_id = zamestnanec.id;
go
``` 
 

## Triggery
- Databáze obsahuje triggery, které se provedou vždy po přidání nové objednávky:
- set_poplatek - jedná se o trigger (after insert), který přičte poplatek za typ platby k celkové ceně objednávky
- set_datum - jedná se o trigger (after insert), který pro nastavení datumu po vytvoření objednávky
- set_sleva - jedná se o trigger (after insert), který odečítá slevu na mobil z vybraného tarifu při vytvoření objednávky
```
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
```


## Uložené procedury a funkce
- Databáze obsahuje:
  - vypis_by_cislo_obj - proceduru pro výpis objednávky na základě čísla dané objednávky, která má jako vstupní parametr číslo objednávky
  - vypis_by_name - proceduru pro výpis zákazníka na základě jeho jména a příjmení (vstupní parametry jsou jméno a příjmení)
  - vypis_by_rodne_cislo - proceduru pro výpis zákazníka na základě rodného čísla, protože je unikátní a omezím tak výpis lidí se stejnými jmény (vstupní parametr je rodné číslo)
  - update_adresa - proceduru pro změnu bydliště zákazníka na základě jeho rodného čísla (vstupní parametry jsou rodné číslo, nová ulice, číslo_popisné
  - update_kontaktni_udaje - proceduru, ve které zákazník může upravit své kontaktní údaje na základě rodného čísla(vstupní parametry jsou rodné číslo, nový email a nový telefon)
  - delete_obj - proceduru, která smaže objednávku na základě čísla objednávky (vstupní parametr je číslo objendávky)
  
```
go
create procedure vypis_by_cislo_obj @cislo_obj int
as
select objednavka.cislo_obj as cislo_obj, zakaznik.jmeno as jmeno, zakaznik.prijmeni as prijmeni, mobil.nazev as mobil, tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, platba.typ_platby as typ_platby, zamestnanec.prijmeni as zamestnanec, objednavka.celkova_cena
from objednavka inner join zakaznik on objednavka.zakaznik_id = zakaznik.id inner join mobil on objednavka.mobil_id = mobil.id inner join tarif on mobil.tarif_id = tarif.id inner join platba on objednavka.platba_id = platba.id inner join zamestnanec on objednavka.zamestanec_id = zamestnanec.id
where objednavka.cislo_obj = @cislo_obj;
go
```

## Transakce
- Databáze obsahuje dvě transakce.
- První při vytváření tabulek, kde hlídá, že se tabulky vytvoří správně, pokud nastane chyba, nevytvoří se.
- Druhá je u vkládání dat do tabulek, kde hlídá, aby se data do tabulek vložily správně, pokud nastane chyba, nepřidají se.

```
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
```

## Zálohování

K celkovému vytvoření databáze a manipulace s ní používám Microsoft SQL Server, který provozuje SPŠE Ječná, a proto nemohu provést zálohu své databáze. Níže alespoň popíši, jak postupovat při zálohování.    

Zálohování je klíčovou částí správy databáze, která zajišťuje bezpečnost dat a obnovitelnost systému v případě havárie nebo nežádoucí události. Rozlišujeme tři typy:    
- Plná záloha (Full Backup): Zahrnuje kompletní zálohu všech dat v databázi.
```
BACKUP DATABASE [YourDatabaseName]
TO DISK = 'C:\Path\To\Your\Backup.bak'
WITH INIT;
```
  
- Diferenciální záloha (Differential Backup): Zahrnuje pouze změny od poslední plné zálohy.
```
BACKUP DATABASE [YourDatabaseName] 
TO DISK = 'C:\Path\To\Your\Backup_Differential.bak' 
WITH DIFFERENTIAL, INIT;
```

- Transakční záloha (Transaction Log Backup): Zahrnuje transakce od poslední plné nebo diferenciální zálohy. 

## Nastavení uživatelských oprávnění
K celkovému vytvoření databáze a manipulace s ní používám Microsoft SQL Server, který provozuje SPŠE Ječná, a proto nemohu nijak vytvářet LOGIN a USER. Níže alespoň popíši, jak bych pracoval s LOGIN, USER a uživatelskými oprávněními.    
    
### Vytvoření LOGINU
- Login symbolizuje přihlašovací údaje pro přístup do SQL Serveru.
```
CREATE LOGIN jmenoLoginu
WITH PASSWORD = 'hesloLoginu';
```
    
- Samotný login však nemá přístup do žádné databáze, jedná se pouze o identifikaci pro přihlášení do serveru.

### Vytvoření USERA
- User je propojený s loginem a přiděluje specifická práva k databázím.
```
USE nazevDatabaze;
CREATE USER jmenoUsera FOR LOGIN jmenoLoginu;
```
     
- Vytvořený user patří konkretní databázi a je spojený s loginem.
- Oprávnění v databázi může mít různá.

### Vytvoření ROLE
- Jedná se o skupinu oprávnění, která může být přidělena userům.
```
USE nazevDatabaze;
CREATE ROLE jmenoRole;
```

- Role může obsahovat různá oprávnění, může být přidělena jednomu nebo více userům.

### Přidělení oprávnění pro ROLI
- Následujícím příkazem roli jmenoRole přidělím pouze určitá oprávnění na daném schématu (select, insert, update).

```
USE nazevDatabaze;
GRANT SELECT, INSERT, UPDATE ON SCHEMA::jmenoSchema TO jmenoRole;
```

## Import struktury databáze a dat od zadavatele

- Nejprve je nutno si vytvořit novou databázi, čistou, bez jakýchkoliv dat.    
- Poté do této databáze nahrát soubor, který se nachází v /sql/export_script.sql, kterým nahrajete strukturu vytvořené databáze.
- Pokud si přejete načíst do databáze testovací data, je nutno nahrát ještě soubor /sql/export_test_data.sql.
- Pro nahrání všech triggerů, pohledů, procedur, transakcí a indexů, je zapotřebí nahrát soubor /sql/script.sql.
 
## Klientská aplikace
- Databáze neobsahuje klientskou aplikaci.

## Požadavky na spuštění

- Pro spuštění je nutná verze MSSQL Serveru 2014 a novější a také připojení k internetu alespoň 2Mb/s.
- Je hodné mít nainstalovaný SQL Server Management Studio pro SQL Server.
- Pro efektivní práci je dobrá i základní znalost jazyka SQL.
- Důležité je seznaméní s **Importem struktury databáze a dat od zadavatele**


## Závěr

Databáze pro firmu T-Mobile je navržena s ohledem na telekomunikační oblast. Entitní a doménová integrita jsou řádně zajištěny, včetně referenční integrity. Pro efektivní práci jsou vytvořeny indexy a pohledy, z nichž některé využívají agregační funkce. Triggery jsou implementovány pro automatické úpravy cen a dat po vytvoření objednávky.    

Databáze obsahuje uložené procedury a funkce pro výpis, aktualizaci a mazání dat. Jsou definovány transakce pro vytváření a vkládání dat. Zálohování je klíčovou součástí správy databáze, ačkoliv v rámci tohoto prostředí není možné jej demonstrovat. To samé platí i pro vytvoření loginu, usera a rolí.
     
Do budoucna může být databáze dále vylepšována a upravována.





