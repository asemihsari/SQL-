--VERİ TİPİ DEĞİŞTİRME
--Sql de veri tipini değiştirmek için CAST (dönüştürme) fonk. kullanılır
--select cast(kolon_adi as veri_tipi)
--from tablo;
--select(kolon_adi::veri_tipi)
--from tablo;

SELECT
	CAST('123' AS INTEGER);

SELECT
	BOOKINGDATE::DATE
FROM
	BOOKING;

SELECT
	CAST(BOOKINGDATE AS DATE)
FROM
	BOOKING;

SELECT
	*
FROM
	BOOKING
WHERE
	BOOKINGDATE::DATE= '2019-12-13';

--UNION ve WHERE kullanımlarında işimize yarayabilir.
--filtreleme işlerimizi çok kolaylaştırıyor.
--önemli bir konu

--To_char
--to_char fonksiyonu görüntüleme şeklimizi seçmeye yarar.

SELECT
	TO_CHAR(DATE '2023-01-01', 'day-mon-yy')
SELECT
	BOOKINGDATE,
	TO_CHAR(BOOKINGDATE, 'YYYY-MM')
FROM
	BOOKING LIMIT 10

--Date/Time functions
--current_date:bugünün tarihini döndürür
SELECT
	CURRENT_DATE;

SELECT
	BOOKINGDATE::DATE,
	CURRENT_DATE
FROM
	BOOKING LIMIT 10

--current_time:bugünün tarhini yanında saat olarak gösterir.

select current_time;

--date_trunc:belirtilen birimi kullanarak tarihi birleştirir.
--aşağıdaki örnekte 2023-02-10 tarihini ay olarak belirttiğimiz için ayın 1 ine yuvarlar.
SELECT
	DATE_TRUNC('month', '2023-02-10 13:30:15'::TIMESTAMP);

SELECT
	BOOKINGDATE,
	DATE_TRUNC('year', BOOKINGDATE), --yıla kadar alır gerisini sıfırlar
	DATE_TRUNC('day', BOOKINGDATE) --güne kadar alır gerisini sıfırlar
FROM
	BOOKING


--EXTRACT:belirtilen birimi kullanarak tarih veya zaman verisinden bir parçayı döndürür.
SELECT
	EXTRACT(YEAR FROM '2022-06-01 12:12:20'::TIMESTAMP) --sadece yıl verisini getirdi.

SELECT
	BOOKINGDATE,
	EXTRACT(MONTH FROM BOOKINGDATE)
FROM
	BOOKING --BELİRTİLEN TABLODA YALNIZCA AY BİLGİSİNİÇEKMİŞ OLDU.
--AGE :iki tarih arasındaki farkı döndürür.
SELECT
	AGE ('2022-06-02 12:30:00', '2022-05-20'::TIMESTAMP)

--DATE_PART:belirtilen birimi kullanarak belirtilen veriden bir parçayı döndürür.
--extract ile ayni işlemi görür. where koşulundan sonra kullanılabilir.

SELECT
	DATE_PART('month', '2022-06-01 12:30:00'::TIMESTAMP)

--interval:ilgili tarihe bir tarih ekleyebilir veya çıkarabiliriz.

SELECT
	TO_TIMESTAMP('2022-01-01', 'YYYY-MM-DD') - INTERVAL '1 month'
SELECT
	TO_TIMESTAMP('2022-01-01', 'YYYY-MM-DD') + INTERVAL '1 month'
SELECT
	TO_TIMESTAMP('2022-01-01', 'YYYY-MM-DD') - INTERVAL '1 day'
SELECT
	BOOKINGDATE,
	BOOKINGDATE + INTERVAL '15 days'
FROM
	BOOKING --15 gün ekler

--NOW:şu anki tarih ve saati döndürür.

SELECT	NOW();

SELECT
	AGE (
		TIMESTAMP '2024-12-15 22:29:30',
		TIMESTAMP '1993-11-08 00:00:00'
	)
	--belirttiğimiz tarih ile yine belirttiğimiz tarih arasındaki hesaplamayı yapar.

	-- CAST
-- SQL'de veri tipini değiştirmek için cast (dönüştürme) fonksiyonu kullanılır. Bu fonksiyon, verinin belirli bir veri tipine dönüştürülmesini sağlar.

-- SELECT cast(kolon_adi as veri_tipi)
-- FROM tablo;

-- SELECT veri::veri_tipi
-- FROM tablo;

SELECT
	CAST('123' AS INTEGER);

SELECT
	'123'
;

SELECT
	HIRE_DATE::TIMESTAMP
FROM
	EMPLOYEES;

SELECT
	CAST(HIRE_DATE AS TIMESTAMP),
	HIRE_DATE
FROM
	EMPLOYEES;
	-- TO Char
--TO_CHAR fonksiyonu, veritabanındaki bir veriyi belirli bir formatta görüntülemek için kullanılır. 

SELECT
	TO_CHAR(HIRE_DATE, 'MM-YYYY'),
	HIRE_DATE
FROM
	EMPLOYEES
WHERE
	TO_CHAR(HIRE_DATE, 'YYYY') = '1997'
