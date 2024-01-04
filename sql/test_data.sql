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