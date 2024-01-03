# Objednání mobilu s tarifem od společnosti T-Mobile

**Střední průmyslová škola elektrotechnická, Praha 2, Ječná 30**
**Školní rok 2023/2024**
---
 Jméno a příjmení: Šimon Bernard    
 Třída: C4b
---

## Úvod

Problém jsem se rozhodl řešit v MSSQL Server, jako návrhové prostředí jsem 
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
- Databáze má pro každou entitu pouze indexy vytvořené pro primární klíče, 
další indexy ...

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
- Databáze obsahuje triggery ...

## Uložené procedury a funkce
- Databáze obsahuje procedury  ... a funkce ...

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
