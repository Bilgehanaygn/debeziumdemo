INSERT INTO "urun" (id, isim, fiyat) VALUES
    (gen_random_uuid(), 'Laptop', 1200.99),
    (gen_random_uuid(), 'Smartphone', 799.50),
    (gen_random_uuid(), 'Tablet', 499.99),
    (gen_random_uuid(), 'Headphones', 199.99),
    (gen_random_uuid(), 'Monitor', 299.99);

INSERT INTO "siparis" (id, toplam_fiyat, musteri_id) VALUES
    (gen_random_uuid(), 2199.99, gen_random_uuid()),
    (gen_random_uuid(), 799.50, gen_random_uuid()),
    (gen_random_uuid(), 499.99, gen_random_uuid()),
    (gen_random_uuid(), 299.99, gen_random_uuid()),
    (gen_random_uuid(), 999.99, gen_random_uuid());
