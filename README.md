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

## Logický model
![Logical]

## Entitní integrita
př:
Každá entita obsahuje uměle vytvořený primární klíč, označený jako `id`, 
který se s každým dalším záznamem inkrementuje...

## Doménová integrita
př:
** zamestnanec
- jmeno - libovolné znaky, maximálně však 45 znaků
- prijmeni - libovolné znaky, maximálně však 45 znaků, not null, min délka 3znaky
- dat_nar - datový typ date, formát 'yyyy-mm-dd'
- email - libovolné znaky, maximálně však 50 znaků,not null,musí obsahovat znak '@'
...

## Referenční integrita
př:
** Návrh obsahuje několik cizích klíčů, které jsou uvedeny níže
- 'fk_ucet_zamestnanec1' ON DELETE NO ACTION ON UPDATE NO ACTION
...

## Indexy 
- Databáze má pro každou entitu pouze indexy vytvořené pro primární klíče, 
další indexy ...

## Pohledy
- Návrh obsahuje pohledy ...

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
- Databáze obsahuje/neobsahuje klientskou aplikaci ...

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
