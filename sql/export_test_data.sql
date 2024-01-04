USE [bernard]
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
SET IDENTITY_INSERT [dbo].[platba] ON 
GO
INSERT [dbo].[platba] ([id], [typ_platby], [referencni_cislo], [poplatek], [poznamka]) VALUES (1, N'kreditni karta', N'1234-5678-9012-3456', 50, N'Objednavka 1 platba')
GO
INSERT [dbo].[platba] ([id], [typ_platby], [referencni_cislo], [poplatek], [poznamka]) VALUES (2, N'bankovnim prevodem', N'CZ123456789', 20, N'Objednavka 2 platba')
GO
SET IDENTITY_INSERT [dbo].[platba] OFF
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
