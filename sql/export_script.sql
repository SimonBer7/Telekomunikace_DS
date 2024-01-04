USE [master]
GO
/****** Object:  Database [bernard]    Script Date: 4. 1. 2024 22:15:58 ******/
CREATE DATABASE [bernard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bernard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\bernard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bernard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\bernard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bernard] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bernard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bernard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bernard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bernard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bernard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bernard] SET ARITHABORT OFF 
GO
ALTER DATABASE [bernard] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [bernard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bernard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bernard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bernard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bernard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bernard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bernard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bernard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bernard] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bernard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bernard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bernard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bernard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bernard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bernard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bernard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bernard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bernard] SET  MULTI_USER 
GO
ALTER DATABASE [bernard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bernard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bernard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bernard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bernard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bernard] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [bernard] SET QUERY_STORE = OFF
GO
USE [bernard]
GO
/****** Object:  Table [dbo].[zakaznik]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zakaznik](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jmeno] [varchar](30) NOT NULL,
	[prijmeni] [varchar](30) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[telefon] [varchar](9) NOT NULL,
	[cislo_obc_prukazu] [int] NOT NULL,
	[rodne_cislo] [varchar](12) NOT NULL,
	[adresa_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[objednavka]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[objednavka](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cislo_obj] [int] NOT NULL,
	[zakaznik_id] [int] NULL,
	[mobil_id] [int] NULL,
	[platba_id] [int] NULL,
	[zamestanec_id] [int] NULL,
	[datum_vytvoreni] [date] NOT NULL,
	[datum_konecny] [date] NOT NULL,
	[celkova_cena] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tarif]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarif](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazev] [varchar](30) NOT NULL,
	[mnozstvi_dat] [varchar](30) NOT NULL,
	[rychlost] [varchar](30) NOT NULL,
	[rychlost_5G] [bit] NOT NULL,
	[sleva_na_mobil] [int] NOT NULL,
	[cena_mesicni] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[platba]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platba](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typ_platby] [varchar](20) NULL,
	[referencni_cislo] [varchar](50) NOT NULL,
	[poplatek] [int] NULL,
	[poznamka] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zamestnanec]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zamestnanec](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jmeno] [varchar](30) NOT NULL,
	[prijmeni] [varchar](30) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[speacializace] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mobil]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobil](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazev] [varchar](50) NOT NULL,
	[znacka] [varchar](30) NOT NULL,
	[barva] [varchar](30) NOT NULL,
	[velikost_pameti] [int] NOT NULL,
	[cena_ks] [int] NOT NULL,
	[tarif_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vypis_objednavky]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vypis_objednavky] as
select objednavka.cislo_obj as cislo_obj, zakaznik.jmeno as jmeno, zakaznik.prijmeni as prijmeni, mobil.nazev as mobil, tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, platba.typ_platby as typ_platby, zamestnanec.prijmeni as zamestnanec, objednavka.celkova_cena
from objednavka inner join zakaznik on objednavka.zakaznik_id = zakaznik.id inner join mobil on objednavka.mobil_id = mobil.id inner join tarif on mobil.tarif_id = tarif.id inner join platba on objednavka.platba_id = platba.id inner join zamestnanec on objednavka.zamestanec_id = zamestnanec.id;
GO
/****** Object:  View [dbo].[vypis_zamestnancu]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vypis_zamestnancu] as 
select zamestnanec.jmeno as jmeno, zamestnanec.prijmeni as prijmeni, zamestnanec.email as email, zamestnanec.speacializace as specializace
from zamestnanec;
GO
/****** Object:  View [dbo].[vypis_mobilu]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vypis_mobilu] as
select mobil.nazev as nazev, mobil.znacka as znacka, mobil.barva as barva, mobil.velikost_pameti as vel_pameti, mobil.cena_ks as cena
from mobil;
GO
/****** Object:  View [dbo].[vypis_platby]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vypis_platby] as 
select platba.typ_platby as typ, platba.referencni_cislo as ref_cislo, platba.poplatek as poplatek, platba.poznamka as poznamka
from platba;
GO
/****** Object:  View [dbo].[vypis_tarifu]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vypis_tarifu] as
select tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, tarif.rychlost as rychlost, tarif.rychlost_5G as rychlost_5G, tarif.sleva_na_mobil as sleva_na_mobil, tarif.cena_mesicni as cena
from tarif;
GO
/****** Object:  View [dbo].[vypis_zakazniku]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vypis_zakazniku] as
select zakaznik.jmeno as jmeno, zakaznik.prijmeni as prijmeni, zakaznik.email as email, zakaznik.telefon as telefon, zakaznik.cislo_obc_prukazu as cislo_obc_prukazu, zakaznik.rodne_cislo as rodne_cislo
from zakaznik;
GO
/****** Object:  Table [dbo].[adresa]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adresa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ulice] [varchar](50) NOT NULL,
	[cislo_popisne] [int] NOT NULL,
	[psc] [int] NOT NULL,
	[mesto] [varchar](30) NOT NULL,
	[zeme] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vypis_adres]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vypis_adres] as
select adresa.ulice as ulice, adresa.cislo_popisne as cislo_popisne, adresa.psc as psc, adresa.mesto as mesto, adresa.zeme as zeme
from adresa;
GO
/****** Object:  View [dbo].[count_of_all]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[count_of_all] as
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
GO
/****** Object:  View [dbo].[vypis_souctu_trzeb]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vypis_souctu_trzeb] as
select sum(celkova_cena) as soucet_cen_objednavek
from objednavka;
GO
/****** Object:  View [dbo].[vypis_max_tarif]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vypis_max_tarif] as
select tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, tarif.rychlost as rychlost, tarif.rychlost_5G as rychlost_5G, tarif.sleva_na_mobil as sleva_na_mobil, tarif.cena_mesicni as cena
from tarif
where (select max(tarif.cena_mesicni) from tarif) = tarif.cena_mesicni;
GO
/****** Object:  View [dbo].[vypis_min_tarif]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vypis_min_tarif] as
select tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, tarif.rychlost as rychlost, tarif.rychlost_5G as rychlost_5G, tarif.sleva_na_mobil as sleva_na_mobil, tarif.cena_mesicni as cena
from tarif
where (select min(tarif.cena_mesicni) from tarif) = tarif.cena_mesicni;
GO
SET IDENTITY_INSERT [dbo].[adresa] ON 
GO
INSERT [dbo].[adresa] ([id], [ulice], [cislo_popisne], [psc], [mesto], [zeme]) VALUES (1, N'V brcale', 11, 66666, N'Brno', N'Ceska republika')
GO
INSERT [dbo].[adresa] ([id], [ulice], [cislo_popisne], [psc], [mesto], [zeme]) VALUES (2, N'Na vyhlidce', 32, 12131, N'Praha', N'Ceska republika')
GO
INSERT [dbo].[adresa] ([id], [ulice], [cislo_popisne], [psc], [mesto], [zeme]) VALUES (3, N'Na kopci', 131, 12132, N'Praha', N'Ceska republika')
GO
INSERT [dbo].[adresa] ([id], [ulice], [cislo_popisne], [psc], [mesto], [zeme]) VALUES (4, N'Pred divadlem', 95, 42758, N'Olomouc', N'Ceska republika')
GO
INSERT [dbo].[adresa] ([id], [ulice], [cislo_popisne], [psc], [mesto], [zeme]) VALUES (5, N'Na rohu', 65, 15975, N'Plzen', N'Ceska republika')
GO
INSERT [dbo].[adresa] ([id], [ulice], [cislo_popisne], [psc], [mesto], [zeme]) VALUES (6, N'Zahradni', 38, 12131, N'Praha', N'Ceska republika')
GO
INSERT [dbo].[adresa] ([id], [ulice], [cislo_popisne], [psc], [mesto], [zeme]) VALUES (7, N'U halusek', 17, 31558, N'Bratislava', N'Slovensko')
GO
INSERT [dbo].[adresa] ([id], [ulice], [cislo_popisne], [psc], [mesto], [zeme]) VALUES (8, N'Lidicka', 41, 32562, N'Kosice', N'Slovensko')
GO
INSERT [dbo].[adresa] ([id], [ulice], [cislo_popisne], [psc], [mesto], [zeme]) VALUES (9, N'U lesa', 185, 36957, N'Liberec', N'Ceska republika')
GO
INSERT [dbo].[adresa] ([id], [ulice], [cislo_popisne], [psc], [mesto], [zeme]) VALUES (10, N'U aquaparku', 501, 22231, N'Kladno', N'Ceska republika')
GO
SET IDENTITY_INSERT [dbo].[adresa] OFF
GO
SET IDENTITY_INSERT [dbo].[mobil] ON 
GO
INSERT [dbo].[mobil] ([id], [nazev], [znacka], [barva], [velikost_pameti], [cena_ks], [tarif_id]) VALUES (1, N'iPhone 13', N'Apple', N'Space Gray', 128, 15000, 1)
GO
INSERT [dbo].[mobil] ([id], [nazev], [znacka], [barva], [velikost_pameti], [cena_ks], [tarif_id]) VALUES (2, N'Samsung Galaxy S21', N'Samsung', N'Phantom Black', 256, 12000, 2)
GO
INSERT [dbo].[mobil] ([id], [nazev], [znacka], [barva], [velikost_pameti], [cena_ks], [tarif_id]) VALUES (3, N'OnePlus 9', N'OnePlus', N'Arctic Sky', 64, 8000, 3)
GO
INSERT [dbo].[mobil] ([id], [nazev], [znacka], [barva], [velikost_pameti], [cena_ks], [tarif_id]) VALUES (4, N'Google Pixel 6', N'Google', N'Just Black', 128, 10000, 4)
GO
INSERT [dbo].[mobil] ([id], [nazev], [znacka], [barva], [velikost_pameti], [cena_ks], [tarif_id]) VALUES (5, N'Xiaomi Redmi Note 10', N'Xiaomi', N'Aqua Green', 64, 6000, 5)
GO
INSERT [dbo].[mobil] ([id], [nazev], [znacka], [barva], [velikost_pameti], [cena_ks], [tarif_id]) VALUES (6, N'Huawei P40', N'Huawei', N'Midnight Black', 256, 11000, 6)
GO
INSERT [dbo].[mobil] ([id], [nazev], [znacka], [barva], [velikost_pameti], [cena_ks], [tarif_id]) VALUES (7, N'Sony Xperia 5 III', N'Sony', N'Frosted Black', 128, 13000, 7)
GO
INSERT [dbo].[mobil] ([id], [nazev], [znacka], [barva], [velikost_pameti], [cena_ks], [tarif_id]) VALUES (8, N'Motorola Moto G Power', N'Motorola', N'Flash Gray', 64, 7000, 8)
GO
INSERT [dbo].[mobil] ([id], [nazev], [znacka], [barva], [velikost_pameti], [cena_ks], [tarif_id]) VALUES (9, N'Nokia 8.3', N'Nokia', N'Polar Night', 128, 12000, 9)
GO
INSERT [dbo].[mobil] ([id], [nazev], [znacka], [barva], [velikost_pameti], [cena_ks], [tarif_id]) VALUES (10, N'LG Velvet', N'LG', N'Aurora Gray', 128, 9000, 10)
GO
SET IDENTITY_INSERT [dbo].[mobil] OFF
GO
SET IDENTITY_INSERT [dbo].[objednavka] ON 
GO
INSERT [dbo].[objednavka] ([id], [cislo_obj], [zakaznik_id], [mobil_id], [platba_id], [zamestanec_id], [datum_vytvoreni], [datum_konecny], [celkova_cena]) VALUES (1, 101, 1, 1, 1, 2, CAST(N'2023-01-01' AS Date), CAST(N'2023-01-10' AS Date), 15050)
GO
INSERT [dbo].[objednavka] ([id], [cislo_obj], [zakaznik_id], [mobil_id], [platba_id], [zamestanec_id], [datum_vytvoreni], [datum_konecny], [celkova_cena]) VALUES (2, 102, 2, 2, 2, 1, CAST(N'2023-02-01' AS Date), CAST(N'2023-02-15' AS Date), 12150)
GO
INSERT [dbo].[objednavka] ([id], [cislo_obj], [zakaznik_id], [mobil_id], [platba_id], [zamestanec_id], [datum_vytvoreni], [datum_konecny], [celkova_cena]) VALUES (3, 103, 3, 3, 1, 3, CAST(N'2023-03-01' AS Date), CAST(N'2023-03-20' AS Date), 8270)
GO
INSERT [dbo].[objednavka] ([id], [cislo_obj], [zakaznik_id], [mobil_id], [platba_id], [zamestanec_id], [datum_vytvoreni], [datum_konecny], [celkova_cena]) VALUES (4, 104, 4, 4, 1, 4, CAST(N'2023-04-01' AS Date), CAST(N'2023-04-15' AS Date), 11040)
GO
INSERT [dbo].[objednavka] ([id], [cislo_obj], [zakaznik_id], [mobil_id], [platba_id], [zamestanec_id], [datum_vytvoreni], [datum_konecny], [celkova_cena]) VALUES (5, 105, 5, 5, 1, 5, CAST(N'2023-05-01' AS Date), CAST(N'2023-05-10' AS Date), 6140)
GO
INSERT [dbo].[objednavka] ([id], [cislo_obj], [zakaznik_id], [mobil_id], [platba_id], [zamestanec_id], [datum_vytvoreni], [datum_konecny], [celkova_cena]) VALUES (6, 106, 6, 6, 2, 6, CAST(N'2023-06-01' AS Date), CAST(N'2023-06-20' AS Date), 11490)
GO
INSERT [dbo].[objednavka] ([id], [cislo_obj], [zakaznik_id], [mobil_id], [platba_id], [zamestanec_id], [datum_vytvoreni], [datum_konecny], [celkova_cena]) VALUES (7, 107, 7, 7, 1, 7, CAST(N'2023-07-01' AS Date), CAST(N'2023-07-15' AS Date), 8445)
GO
INSERT [dbo].[objednavka] ([id], [cislo_obj], [zakaznik_id], [mobil_id], [platba_id], [zamestanec_id], [datum_vytvoreni], [datum_konecny], [celkova_cena]) VALUES (8, 108, 8, 8, 2, 8, CAST(N'2023-08-01' AS Date), CAST(N'2023-08-10' AS Date), 11420)
GO
INSERT [dbo].[objednavka] ([id], [cislo_obj], [zakaznik_id], [mobil_id], [platba_id], [zamestanec_id], [datum_vytvoreni], [datum_konecny], [celkova_cena]) VALUES (9, 109, 9, 9, 2, 9, CAST(N'2023-09-01' AS Date), CAST(N'2023-09-20' AS Date), 8335)
GO
INSERT [dbo].[objednavka] ([id], [cislo_obj], [zakaznik_id], [mobil_id], [platba_id], [zamestanec_id], [datum_vytvoreni], [datum_konecny], [celkova_cena]) VALUES (10, 110, 10, 10, 2, 10, CAST(N'2023-10-01' AS Date), CAST(N'2023-10-15' AS Date), 9480)
GO
SET IDENTITY_INSERT [dbo].[objednavka] OFF
GO
SET IDENTITY_INSERT [dbo].[platba] ON 
GO
INSERT [dbo].[platba] ([id], [typ_platby], [referencni_cislo], [poplatek], [poznamka]) VALUES (1, N'kreditni karta', N'1234-5678-9012-3456', 50, N'Objednavka 1 platba')
GO
INSERT [dbo].[platba] ([id], [typ_platby], [referencni_cislo], [poplatek], [poznamka]) VALUES (2, N'bankovnim prevodem', N'CZ123456789', 20, N'Objednavka 2 platba')
GO
SET IDENTITY_INSERT [dbo].[platba] OFF
GO
SET IDENTITY_INSERT [dbo].[tarif] ON 
GO
INSERT [dbo].[tarif] ([id], [nazev], [mnozstvi_dat], [rychlost], [rychlost_5G], [sleva_na_mobil], [cena_mesicni]) VALUES (1, N'Standard', N'5 GB', N'10 Mbps', 0, 100, 500)
GO
INSERT [dbo].[tarif] ([id], [nazev], [mnozstvi_dat], [rychlost], [rychlost_5G], [sleva_na_mobil], [cena_mesicni]) VALUES (2, N'Premium', N'10 GB', N'20 Mbps', 1, 150, 700)
GO
INSERT [dbo].[tarif] ([id], [nazev], [mnozstvi_dat], [rychlost], [rychlost_5G], [sleva_na_mobil], [cena_mesicni]) VALUES (3, N'Business', N'20 GB', N'50 Mbps', 1, 200, 1000)
GO
INSERT [dbo].[tarif] ([id], [nazev], [mnozstvi_dat], [rychlost], [rychlost_5G], [sleva_na_mobil], [cena_mesicni]) VALUES (4, N'Family', N'15 GB', N'30 Mbps', 1, 120, 600)
GO
INSERT [dbo].[tarif] ([id], [nazev], [mnozstvi_dat], [rychlost], [rychlost_5G], [sleva_na_mobil], [cena_mesicni]) VALUES (5, N'Starter', N'2 GB', N'5 Mbps', 0, 50, 300)
GO
INSERT [dbo].[tarif] ([id], [nazev], [mnozstvi_dat], [rychlost], [rychlost_5G], [sleva_na_mobil], [cena_mesicni]) VALUES (6, N'Ultimate', N'50 GB', N'100 Mbps', 1, 250, 1200)
GO
INSERT [dbo].[tarif] ([id], [nazev], [mnozstvi_dat], [rychlost], [rychlost_5G], [sleva_na_mobil], [cena_mesicni]) VALUES (7, N'Pro', N'30 GB', N'70 Mbps', 1, 180, 900)
GO
INSERT [dbo].[tarif] ([id], [nazev], [mnozstvi_dat], [rychlost], [rychlost_5G], [sleva_na_mobil], [cena_mesicni]) VALUES (8, N'Lite', N'8 GB', N'15 Mbps', 0, 80, 400)
GO
INSERT [dbo].[tarif] ([id], [nazev], [mnozstvi_dat], [rychlost], [rychlost_5G], [sleva_na_mobil], [cena_mesicni]) VALUES (9, N'Unlimited', N'Unlimited', N'150 Mbps', 1, 300, 1500)
GO
INSERT [dbo].[tarif] ([id], [nazev], [mnozstvi_dat], [rychlost], [rychlost_5G], [sleva_na_mobil], [cena_mesicni]) VALUES (10, N'Basic', N'3 GB', N'8 Mbps', 0, 70, 350)
GO
SET IDENTITY_INSERT [dbo].[tarif] OFF
GO
SET IDENTITY_INSERT [dbo].[zakaznik] ON 
GO
INSERT [dbo].[zakaznik] ([id], [jmeno], [prijmeni], [email], [telefon], [cislo_obc_prukazu], [rodne_cislo], [adresa_id]) VALUES (1, N'Jan', N'Novak', N'novak.jan@seznam.cz', N'666777666', 123456789, N'010101/1234', 1)
GO
INSERT [dbo].[zakaznik] ([id], [jmeno], [prijmeni], [email], [telefon], [cislo_obc_prukazu], [rodne_cislo], [adresa_id]) VALUES (2, N'Eva', N'Svobodova', N'eva.svobodova@email.com', N'987654321', 987654321, N'020202/5678', 2)
GO
INSERT [dbo].[zakaznik] ([id], [jmeno], [prijmeni], [email], [telefon], [cislo_obc_prukazu], [rodne_cislo], [adresa_id]) VALUES (3, N'Petr', N'Prochazka', N'petr.prochazka@email.com', N'111222333', 111222333, N'030303/9876', 3)
GO
INSERT [dbo].[zakaznik] ([id], [jmeno], [prijmeni], [email], [telefon], [cislo_obc_prukazu], [rodne_cislo], [adresa_id]) VALUES (4, N'Katerina', N'Kovarova', N'katerina.kovarova@email.com', N'555444333', 555444333, N'040404/5678', 4)
GO
INSERT [dbo].[zakaznik] ([id], [jmeno], [prijmeni], [email], [telefon], [cislo_obc_prukazu], [rodne_cislo], [adresa_id]) VALUES (5, N'David', N'Dvorak', N'david.dvorak@email.com', N'777888999', 777888999, N'050505/1234', 5)
GO
INSERT [dbo].[zakaznik] ([id], [jmeno], [prijmeni], [email], [telefon], [cislo_obc_prukazu], [rodne_cislo], [adresa_id]) VALUES (6, N'Lucie', N'Lukasova', N'lucie.lukasova@email.com', N'111333555', 111333555, N'060606/9876', 6)
GO
INSERT [dbo].[zakaznik] ([id], [jmeno], [prijmeni], [email], [telefon], [cislo_obc_prukazu], [rodne_cislo], [adresa_id]) VALUES (7, N'Tomas', N'Tomasek', N'tomas.tomasek@email.com', N'999888777', 999888777, N'070707/5678', 7)
GO
INSERT [dbo].[zakaznik] ([id], [jmeno], [prijmeni], [email], [telefon], [cislo_obc_prukazu], [rodne_cislo], [adresa_id]) VALUES (8, N'Veronika', N'Vorlova', N'veronika.vorlova@email.com', N'333222111', 333222111, N'080808/1234', 8)
GO
INSERT [dbo].[zakaznik] ([id], [jmeno], [prijmeni], [email], [telefon], [cislo_obc_prukazu], [rodne_cislo], [adresa_id]) VALUES (9, N'Martin', N'Mares', N'martin.mares@email.com', N'666777888', 666777888, N'090909/9876', 9)
GO
INSERT [dbo].[zakaznik] ([id], [jmeno], [prijmeni], [email], [telefon], [cislo_obc_prukazu], [rodne_cislo], [adresa_id]) VALUES (10, N'Barbora', N'Bartova', N'barbora.bartova@email.com', N'444555666', 444555666, N'101010/5678', 10)
GO
SET IDENTITY_INSERT [dbo].[zakaznik] OFF
GO
SET IDENTITY_INSERT [dbo].[zamestnanec] ON 
GO
INSERT [dbo].[zamestnanec] ([id], [jmeno], [prijmeni], [email], [speacializace]) VALUES (1, N'Michaela', N'Hodinova', N'michaela.hodinova@email.com', N'Customer Service')
GO
INSERT [dbo].[zamestnanec] ([id], [jmeno], [prijmeni], [email], [speacializace]) VALUES (2, N'Pavel', N'Novotny', N'pavel.novotny@email.com', N'Technical Support')
GO
INSERT [dbo].[zamestnanec] ([id], [jmeno], [prijmeni], [email], [speacializace]) VALUES (3, N'Karolina', N'Svobodova', N'karolina.svobodova@email.com', N'Sales')
GO
INSERT [dbo].[zamestnanec] ([id], [jmeno], [prijmeni], [email], [speacializace]) VALUES (4, N'Ondrej', N'Kovar', N'ondrej.kovar@email.com', N'Marketing')
GO
INSERT [dbo].[zamestnanec] ([id], [jmeno], [prijmeni], [email], [speacializace]) VALUES (5, N'Simona', N'Mareckova', N'simona.mareckova@email.com', N'Human Resources')
GO
INSERT [dbo].[zamestnanec] ([id], [jmeno], [prijmeni], [email], [speacializace]) VALUES (6, N'Jiri', N'Hruska', N'jiri.hruska@email.com', N'Finance')
GO
INSERT [dbo].[zamestnanec] ([id], [jmeno], [prijmeni], [email], [speacializace]) VALUES (7, N'Alena', N'Prochazkova', N'alena.prochazkova@email.com', N'IT')
GO
INSERT [dbo].[zamestnanec] ([id], [jmeno], [prijmeni], [email], [speacializace]) VALUES (8, N'Lukas', N'Vlasak', N'lukas.vlasak@email.com', N'Development')
GO
INSERT [dbo].[zamestnanec] ([id], [jmeno], [prijmeni], [email], [speacializace]) VALUES (9, N'Ivana', N'Havelkova', N'ivana.havelkova@email.com', N'Legal')
GO
INSERT [dbo].[zamestnanec] ([id], [jmeno], [prijmeni], [email], [speacializace]) VALUES (10, N'Jakub', N'Kovac', N'jakub.kovac@email.com', N'Operations')
GO
SET IDENTITY_INSERT [dbo].[zamestnanec] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_nazev]    Script Date: 4. 1. 2024 22:15:58 ******/
CREATE NONCLUSTERED INDEX [idx_nazev] ON [dbo].[mobil]
(
	[nazev] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_nazev_tarif]    Script Date: 4. 1. 2024 22:15:58 ******/
CREATE NONCLUSTERED INDEX [idx_nazev_tarif] ON [dbo].[tarif]
(
	[nazev] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mobil]  WITH CHECK ADD FOREIGN KEY([tarif_id])
REFERENCES [dbo].[tarif] ([id])
GO
ALTER TABLE [dbo].[objednavka]  WITH CHECK ADD FOREIGN KEY([mobil_id])
REFERENCES [dbo].[mobil] ([id])
GO
ALTER TABLE [dbo].[objednavka]  WITH CHECK ADD FOREIGN KEY([platba_id])
REFERENCES [dbo].[platba] ([id])
GO
ALTER TABLE [dbo].[objednavka]  WITH CHECK ADD FOREIGN KEY([zakaznik_id])
REFERENCES [dbo].[zakaznik] ([id])
GO
ALTER TABLE [dbo].[objednavka]  WITH CHECK ADD FOREIGN KEY([zamestanec_id])
REFERENCES [dbo].[zamestnanec] ([id])
GO
ALTER TABLE [dbo].[zakaznik]  WITH CHECK ADD FOREIGN KEY([adresa_id])
REFERENCES [dbo].[adresa] ([id])
GO
ALTER TABLE [dbo].[adresa]  WITH CHECK ADD CHECK  (([cislo_popisne]>(0)))
GO
ALTER TABLE [dbo].[adresa]  WITH CHECK ADD CHECK  (([psc]>(0)))
GO
ALTER TABLE [dbo].[mobil]  WITH CHECK ADD CHECK  (([cena_ks]>(0)))
GO
ALTER TABLE [dbo].[mobil]  WITH CHECK ADD CHECK  (([velikost_pameti]>(0)))
GO
ALTER TABLE [dbo].[objednavka]  WITH CHECK ADD CHECK  (([celkova_cena]>(0)))
GO
ALTER TABLE [dbo].[objednavka]  WITH CHECK ADD CHECK  (([cislo_obj]>(0)))
GO
ALTER TABLE [dbo].[platba]  WITH CHECK ADD CHECK  (([typ_platby]='bankovnim prevodem' OR [typ_platby]='kreditni karta'))
GO
ALTER TABLE [dbo].[tarif]  WITH CHECK ADD CHECK  (([cena_mesicni]>(0)))
GO
ALTER TABLE [dbo].[tarif]  WITH CHECK ADD CHECK  (([sleva_na_mobil]>(0)))
GO
ALTER TABLE [dbo].[zakaznik]  WITH CHECK ADD CHECK  (([cislo_obc_prukazu]>(0)))
GO
ALTER TABLE [dbo].[zakaznik]  WITH CHECK ADD CHECK  (([email] like '%@%'))
GO
ALTER TABLE [dbo].[zakaznik]  WITH CHECK ADD CHECK  (([rodne_cislo] like '%/%'))
GO
ALTER TABLE [dbo].[zamestnanec]  WITH CHECK ADD CHECK  (([email] like '%@%'))
GO
/****** Object:  StoredProcedure [dbo].[delete_obj]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_obj] @cislo_obj int
as
delete from objednavka 
where cislo_obj = @cislo_obj;
GO
/****** Object:  StoredProcedure [dbo].[update_adresa]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_adresa] @rodne_cislo nvarchar(12), @new_ulice nvarchar(50), @new_cislo_popisne int, @new_psc int, @new_mesto nvarchar(30), @new_zeme nvarchar(30)
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
GO
/****** Object:  StoredProcedure [dbo].[update_kontaktni_udaje]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_kontaktni_udaje] @rodne_cislo nvarchar(12), @new_email nvarchar(100), @new_telefon nvarchar(9)
as
update zakaznik
set email = @new_email,
telefon = @new_telefon
where rodne_cislo = @rodne_cislo;
GO
/****** Object:  StoredProcedure [dbo].[vypis_by_cislo_obj]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[vypis_by_cislo_obj] @cislo_obj int
as
select objednavka.cislo_obj as cislo_obj, zakaznik.jmeno as jmeno, zakaznik.prijmeni as prijmeni, mobil.nazev as mobil, tarif.nazev as nazev, tarif.mnozstvi_dat as mnozstvi_dat, platba.typ_platby as typ_platby, zamestnanec.prijmeni as zamestnanec, objednavka.celkova_cena
from objednavka inner join zakaznik on objednavka.zakaznik_id = zakaznik.id inner join mobil on objednavka.mobil_id = mobil.id inner join tarif on mobil.tarif_id = tarif.id inner join platba on objednavka.platba_id = platba.id inner join zamestnanec on objednavka.zamestanec_id = zamestnanec.id
where objednavka.cislo_obj = @cislo_obj;
GO
/****** Object:  StoredProcedure [dbo].[vypis_by_name]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[vypis_by_name] @name nvarchar(30), @surname nvarchar(30)
as
select zakaznik.jmeno as jmeno, zakaznik.prijmeni as prijmeni, zakaznik.email as email, zakaznik.telefon as telefon, zakaznik.cislo_obc_prukazu as cislo_prukazu, zakaznik.rodne_cislo as rodne_cislo, adresa.ulice as ulice, adresa.cislo_popisne as cislo_popisne, adresa.psc as psc, adresa.mesto as mesto, adresa.zeme as zeme
from zakaznik inner join adresa on zakaznik.adresa_id = adresa.id
where zakaznik.jmeno = @name and zakaznik.prijmeni = @surname;
GO
/****** Object:  StoredProcedure [dbo].[vypis_by_rodne_cislo]    Script Date: 4. 1. 2024 22:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[vypis_by_rodne_cislo] @rodne_cislo varchar(12)
as
select zakaznik.jmeno as jmeno, zakaznik.prijmeni as prijmeni, zakaznik.email as email, zakaznik.telefon as telefon, zakaznik.cislo_obc_prukazu as cislo_prukazu, zakaznik.rodne_cislo as rodne_cislo, adresa.ulice as ulice, adresa.cislo_popisne as cislo_popisne, adresa.psc as psc, adresa.mesto as mesto, adresa.zeme as zeme
from zakaznik inner join adresa on zakaznik.adresa_id = adresa.id
where zakaznik.rodne_cislo = @rodne_cislo
GO
USE [master]
GO
ALTER DATABASE [bernard] SET  READ_WRITE 
GO
