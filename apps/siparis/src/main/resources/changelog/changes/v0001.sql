CREATE TABLE "urun" (
    id UUID NOT NULL PRIMARY KEY,
    isim VARCHAR(20) NOT NULL,
    fiyat DECIMAL NOT NULL
);

CREATE TABLE "siparis" (
    id UUID NOT NULL PRIMARY KEY,
    toplam_fiyat DECIMAL NOT NULL,
    musteri_id UUID NOT NULL
);

ALTER TABLE databasechangelog REPLICA IDENTITY FULL;