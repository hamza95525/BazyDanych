-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-10-13 17:31:56.118

-- tables
-- Table: godziny
CREATE TABLE firma.godziny (
    id_godziny serial  NOT NULL,
    data date  NOT NULL,
    liczba_godzin int  NOT NULL,
    id_pracownika int  NOT NULL,
    miesiac int  NOT NULL,
    tydzien int  NOT NULL,
    CONSTRAINT godziny_pk PRIMARY KEY (id_godziny)
);

-- Table: pensja_stanowisko
CREATE TABLE firma.pensja_stanowisko (
    id_pensji serial  NOT NULL,
    stanowisko int  NOT NULL,
    kwota money  NOT NULL,
    CONSTRAINT pensja_stanowisko_pk PRIMARY KEY (id_pensji)
);

-- Table: pracownicy
CREATE TABLE firma.pracownicy (
    id_pracownika serial  NOT NULL,
    imie varchar(30)  NOT NULL,
    nazwisko varchar(30)  NOT NULL,
    adres varchar(50)  NOT NULL,
    telefon varchar(15)  NOT NULL,
    CONSTRAINT id_pracownika PRIMARY KEY (id_pracownika)
);

-- Table: premia
CREATE TABLE firma.premia (
    id_premii serial  NOT NULL,
    rodzaj varchar(50)  NOT NULL,
    kwota money  NOT NULL,
    CONSTRAINT premia_pk PRIMARY KEY (id_premii)
);

-- Table: producenci
CREATE TABLE sklep.producenci (
    id_producenta serial  NOT NULL,
    nazwa_producenta varchar(50)  NOT NULL,
    mail varchar(50)  NOT NULL,
    telefon varchar(15)  NOT NULL,
    CONSTRAINT producenci_pk PRIMARY KEY (id_producenta)
);

-- Table: produkty
CREATE TABLE sklep.produkty (
    id_produktu serial  NOT NULL,
    nazwa_produktu varchar(50)  NOT NULL,
    cena money  NOT NULL,
    producenci_id_producenta int  NOT NULL,
    CONSTRAINT produkty_pk PRIMARY KEY (id_produktu)
);

-- Table: wynagrodzenie
CREATE TABLE firma.wynagrodzenie (
    id_wynagrodzenia serial  NOT NULL,
    data date  NOT NULL,
    pracownicy_id_pracownika int  NOT NULL,
    pensja_stanowisko_id_pensji int  NOT NULL,
    godziny_id_godziny int  NOT NULL,
    premia_id_premii int  NOT NULL,
    CONSTRAINT wynagrodzenie_pk PRIMARY KEY (id_wynagrodzenia)
);

-- Table: zamowienia
CREATE TABLE sklep.zamowienia (
    id_zamowienia serial  NOT NULL,
    ilosc int  NOT NULL,
    data date  NOT NULL,
    produkty_id_produktu int  NOT NULL,
    CONSTRAINT zamowienia_pk PRIMARY KEY (id_zamowienia)
);

-- foreign keys
-- Reference: produkty_producenci (table: produkty)
ALTER TABLE sklep.produkty ADD CONSTRAINT produkty_producenci
    FOREIGN KEY (producenci_id_producenta)
    REFERENCES sklep.producenci (id_producenta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenie_godziny (table: wynagrodzenie)
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT wynagrodzenie_godziny
    FOREIGN KEY (godziny_id_godziny)
    REFERENCES firma.godziny (id_godziny)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenie_pensja_stanowisko (table: wynagrodzenie)
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT wynagrodzenie_pensja_stanowisko
    FOREIGN KEY (pensja_stanowisko_id_pensji)
    REFERENCES firma.pensja_stanowisko (id_pensji)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenie_pracownicy (table: wynagrodzenie)
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT wynagrodzenie_pracownicy
    FOREIGN KEY (pracownicy_id_pracownika)
    REFERENCES firma.pracownicy (id_pracownika)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenie_premia (table: wynagrodzenie)
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT wynagrodzenie_premia
    FOREIGN KEY (premia_id_premii)
    REFERENCES firma.premia (id_premii)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: zamowienia_produkty (table: zamowienia)
ALTER TABLE sklep.zamowienia ADD CONSTRAINT zamowienia_produkty
    FOREIGN KEY (produkty_id_produktu)
    REFERENCES sklep.produkty (id_produktu)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- sequences
-- Sequence: Sequence_2
CREATE SEQUENCE Sequence_2
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- End of file.
