--INSERT KOMUTU
--Oluşturulan tabloya veri eklemeye yarar.
--INSERT INTO tablo_ismi VALUES (veri1,veri2)
INSERT INTO ders VALUES (14,'Sibel','Keskin'),
						(25,'Ayse','Yilmaz'),
						(39,'Ali','Ozer')
;

SELECT * FROM ders
;


--COPY KOMUTU
--Veritabanındaki bir tablonun verilerini belirli dosyadan veritabanına veri yüklemeye yarar.
--COPY komutu sadece superuser veya tablo sahibi tarafından kullanılabilir.
--COPY tablo_ismi FROM '/path/.csv' DELIMITER ',' CSV

CREATE TABLE course_info
(
	course_id integer primary key,
	course_title varchar(150)
)
;

COPY course_info FROM '/Library/PostgreSQL/15/bin/365_course_info.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM course_info

--UPDATE KOMUTU
--Veritabanındaki bir tablonun belirli kayıtlarının değerlerini güncellemeye yarar.
--Aşağıdaki örnek komut ilgili tablonun ilgili sütununda "50000" olan değerlerini "55000" olarak güncelleyecektir
--UPDATE tablo_ismi SET kolon_ismi = 55000 WHERE kolon_ismi = 50000

SELECT * FROM ders;

UPDATE ders SET isim = 'Zehra' WHERE id = 14;

SELECT * FROM ders;

UPDATE ders SET id = 45 WHERE id= 39;

SELECT * FROM ders;

UPDATE ders SET soyisim = 'Ozgun' WHERE id = 25 ;

SELECT * FROM ders;

--ALTER KOMUTU
--Var olan tablolara yeni bir kolon eklemeye
--Var olan kolonu kaldırmaya
--Yeni bir kısıtlayıcı eklemeye (primary key, foreign key)
--Kısıtlayıcı kaldırmaya
--Var olan tablonun/kolonun ismini değiştirmeye yarar.


--Var olan tabloya yeni bir kolon eklemek için:
--ALTER TABLE tablo_ismi ADD COLUMN kolon_ismi veri_tipi
ALTER TABLE ders ADD COLUMN ogretmen varchar(30)



--Var olan kolonun veri tipini değiştirmek için:
--ALTER TABLE tablo_adi ALTER kolon_ismi TYPE veri_tipi
ALTER TABLE ders ALTER ogretmen TYPE varchar(50)




--Var olan kolonu kaldırmak için:
--ALTER TABLE tablo_ismi DROP COLUMN kolon_ismi
ALTER TABLE ders DROP COLUMN ogretmen




--Yeni bir kısıtlayıcı eklemek için:
--ALTER TABLE tablo_adi ADD CONSTRAINT kisitlayici_adi PRIMARY KEY kolon_ismi 
ALTER TABLE ogretmenler ADD CONSTRAINT ogretmen_pkey PRIMARY KEY(ogretmen_id)


--Var olan kısıtlayıcıyı kaldırmak için:
--ALTER TABLE tablo_adi DROP CONSTRAINT kısıtlayıcı_ismi
ALTER TABLE ogretmenler DROP CONSTRAINT ogretmen_pkey



---Var olan tablonun ismini değiştirmek için:
--ALTER TABLE tablo_ismi RENAME TO yeni_tablo_ismi
ALTER TABLE ogretmenler RENAME TO ogretmen

----Var olan kolonun ismini değiştirmek için:
--ALTER TABLE tablo_ismi RENAME COLUMN kolon_ismi TO yeni_kolon_ismi
ALTER TABLE ogretmen RENAME COLUMN isim TO yeni_isim



--DROP KOMUTU
--Oluşturduğumuz bir veri tabanını veya tabloyu veri tabanından tamamen kaldırmaya yarar.
--DROP TABLE tablo_ismi
DROP TABLE ogretmen

--DELETE KOMUTU
--Veritabanındaki bir tablonun belirli kayıtlarını silmeye yarar.
--DELETE FROM tablo_ismi WHERE kolon_ismi = veri_ismi
SELECT * FROM ders;

DELETE FROM ders WHERE id = 14
;

SELECT * FROM ders;

--TRUNCATE KOMUTU
--Veritabanındaki bir tablonun tüm kayıtlarını silmeye yarar.
--TRUNCATE tablo_ismi

TRUNCATE ders;

SELECT * FROM ders;


--TRUNCATE komutu DELETE komutundan daha hızlıdır.