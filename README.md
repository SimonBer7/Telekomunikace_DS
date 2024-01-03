# Praktická maturitní zkouška

**Střední průmyslová škola elektrotechnická, Praha 2, Ječná 30**
**Školní rok 2023/2024**
---
 Jméno a příjmení: Šimon Bernard    
 Třída: C4b
---

## Úvod

Problém v oblasti telekomunikace jsem se rozhodl řešit v MSSQL Server, jako návrhové prostředí jsem 
využil Oracle DataModeler, v němž jsem vytvořil logické a relační schéma.

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
- DOPLŇIT !!!!!!!!!!!!!!!!!!!!!!!!!

## Přístupové údaje do databáze
př:
- Přístupové údaje jsou volně konfigurovatelné v souboru /config/... .doc
pro vývoj byly použity tyto:
host		: localhost
uživatel	: sa
heslo		: student
databáze	: ...

## Import struktury databáze a dat od zadavatele
př:
Nejprve je nutno si vytvořit novou databázi, čistou, bez jakýchkoliv dat...
Poté do této databáze nahrát soubor, který se nachází v /sql/structure.sql ...
Pokud si přejete načíst do databáze testovací data, je nutno nahrát ještě soubor /sql/data.sql ...

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




## Klientská aplikace
- Databáze neobsahuje klientskou aplikaci.

## Požadavky na spuštění
př:
- Oracle DataModeler, rok vydání 2014 a více ... 
- MSSQL Server, rok vydání 2014 a více ... 
- připojení k internetu alespoň 2Mb/s ...
...

## Návod na instalaci a ovládání aplikace
př:
Uživatel by si měl vytvořit databázi a nahrát do ní strukturu, dle kroku "Import struktury databáze 
a dat od zadavatele" ...
Poté se přihlásit předdefinovaným uživatelem, nebo si vytvořit vlastního pomocí SQL příkazů ...
Měl by upravit konfigurační soubor klientské aplikace, aby odpovídal jeho podmínkám ...
Dále nahrát obsah složky src na server a navštívit adresu serveru ... 
Přihlásit se a může začít pracovat ... 

## Závěr
př:
Tento systém by po menších úpravách mohl být převeden na jiný databázový systém, 
klientská aplikace není zabezpečená, 
počítá se s tím, že klient byl proškolen o používání této aplikace ...
Nepodařilo se dořešit ...
Pro další vývoj aplikace by bylo vhodné ...
