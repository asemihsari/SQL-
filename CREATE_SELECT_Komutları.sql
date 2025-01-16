--CREATE komutu bir database veya bir tablo oluşturmak için kullandığımız komuttur.
--test_db isimli bir database oluşturalım:

CREATE DATABASE TEST_DB;

--OGRENCI isimli bir tablo oluşturarak bu tablo içerisindeki kolonların dtypelarını ve key ilişkilerini tanımlıyoruz.
CREATE TABLE OGRENCI (
	ID INTEGER,
	ISIM VARCHAR(30),
	SOYISIM VARCHAR(30),
	PRIMARY KEY (ID)
);

CREATE TABLE DERS (
	ID INTEGER PRIMARY KEY,
	NAME VARCHAR(50),
	OGRENCI_ID INTEGER,
	FOREIGN KEY (OGRENCI_ID) REFERENCES
);

--SELECT KOMUTU
--Tablo içindeki verilerden istenilen kolondaki verileri çekmeye yarar.
--Eğer tablonun içindeki tüm veriyi çekmek istiyorsak:
--SELECT * FROM tablo_adi
--Eğer tablonun içinde belli kolonlardan veri çekmek istiyorsak:
--SELECT kolon_adi1,kolon_adi2,kolonadi3 FROM tablo_adi
SELECT
	*
FROM
	COURSE_INFO;

SELECT	*  FROM
	DERS;

SELECT	* FROM
	OGRENCI;

SELECT
	ISIM,
	SOYISIM
FROM
	OGRENCI;

SELECT
	DERS_ADI
FROM
	DERS;

--SELECT komutu ile sadece tablo üzerinde işlemler yapılmaz
--Matematiksel işlemler yapmaya ya da metinsel veriler yazmaya da yarar.
--ARITMETIK FONKSIYONLAR:
--Toplama (+)
SELECT
	3 + 5
	--Çıkarma (-)
SELECT
	12 -18
	--Çarpma (*)
SELECT
	18 * 7
	--Bölme (/)
SELECT
	45 / 5
SELECT
	45 / 4
SELECT
	45.0 / 4.0
	--Üstel İşlem (^)
SELECT
	3 ^ 4
	--Mod Alma (%)
SELECT
	5 % 4
	--Metinsel veri yazdırma
SELECT
	'Hello World!';

SELECT * FROM
	OGRENCI;

SELECT
	ID,
	ISIM,
	SOYISIM,
	(VIZE1 * 0.2) + (VIZE2 * 0.2) + (FINAL * 0.6)
FROM
	OGRENCI
-- Yukarıdaki bu işlem ile vizelerin %20 lerini ve final değerinin de %60 ını almış olduk.
