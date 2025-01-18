--Veri Tipi Değiştirme
--SQL'de veri tipini değiştirmek için cast (dönüştürme) fonksiyonu kullanılır.
--SELECT cast(kolon_adi as veri_tipi)
--FROM tablo;
--SELECT (kolon_adi::veri_tipi)
--FROM tablo;

SELECT bookingdate,
       CAST(bookingdate as DATE),
       bookingdate::DATE
  FROM booking;

SELECT LEFT('20 TL Indirim!' , 2),
       CAST (LEFT('20 TL Indirim!' , 2) AS INTEGER ),
       LEFT('20 TL Indirim!' , 2) :: VARCHAR
;


--To Char
--to_char fonksiyonu, veritabanındaki bir veriyi belirli bir formatta görüntülemek için kullanılır.

SELECT bookingdate,
       to_char(bookingdate, 'YYYY-MM' ),
       to_char(bookingdate, 'YY-MM' ),
        to_char(bookingdate, 'YY-MM-DD' ),
       to_char(bookingdate, 'Day' )
FROM booking
WHERE bookingdate>='2019-01-01 00:00'...



SELECT bookingdate,
       to_char(bookingdate, 'YYYY-MM' ),
       to_char(bookingdate, 'YY-MM' ),
       to_char(bookingdate, 'YY-MM-DD' ),
       to_char(bookingdate, 'Day' )
FROM booking
WHERE to_char(bookingdate, 'YY-MM') = '20-11'
--2020 YILININ 11. AYINDAKİ VERİLERİ ÇEKMEK İÇİN KULLANABİLİRİZ
--GERÇEKTEN KULLANIMI BASİT VE HAYAT KURTARAN BİR OPERATÖR.

;

 ....
 WHERE to_char ( bookingdate,'YYYY') = '2020';
 
 .....
WHERE date_trunc('year' , bookingdate ) :: date = '2020-01-01';


SELECT to_char ( bookingdate,'YYYY-MM') as booking_month,
       count(DISTINCT contactid) as musteri_sayisi
FROM booking
GROUP BY 1
;


SELECT to_char ( bookingdate,'YYYY-MM') as booking_month,
       count(DISTINCT contactid) as musteri_sayisi
FROM booking
WHERE bookingdate BETWEEN '2020-01-01 00:00:00' AND '2021-01-01 00:00:00' 
GROUP BY 1
;

SELECT to_char (bookingdate,'YYYY-MM') as booking_month,
       environemnt,
       count(DISTINCT contactid) as musteri_sayisi
FROM booking
WHERE bookingdate>='2020-01-01 00:00:00' AND bookingdate<'2021-01-01 00:00:00' 
GROUP BY 1,2

;
-- Date/Time Functions

-- current_date: Bugünün tarihini döndürür.
SELECT current_date;
	

-- current_time: Şu andaki saati döndürür.
SELECT current_time;


-- current_timestamp: Şu anki tarih ve saati döndürür.
SELECT current_timestamp;

-- Recency : Müşterinin son siparişinin üzerinden kaç gün geçmiş. 
--Bunu hesaplamak için bugünden müşterinin son sipariş günü arasındaki fark alınır. Bunun için current_date kullanılır.


-- date_trunc: Belirtilen birimi kullanarak tarihi birleştirir.


SELECT bookingdate,
       date_trunc('month',bookingdate),--BELİRTİLEN TARİHİ AY OLARAK 1. GÜNÜNE YUVARLAR
       date_trunc('day',bookingdate),--BELİRTLEN TARİHİ GÜN OLARAK İLK SAATİNE YUVARLAR
       date_trunc('year',bookingdate),--BELİRTİLEN TARİHİ YIL OLARAK İLK AYA YUVARLAR
       date_trunc('year',bookingdate)::date-- BELİRTİLEN TARİHİ TİMESTAMP VERİ TİPİNDEN TARİH VERİ TİPİNE DÖNÜŞTÜRÜR.
FROM booking



-- extract: Belirtilen birimi kullanarak tarih veya zaman verisinden bir parçayı döndürür.

SELECT EXTRACT(YEAR FROM '2022-06-01 12:30:15'::TIMESTAMP);
--İLGİLİ TARİHİN YIL BİLGİSİNİ VERİR.
SELECT EXTRACT(DAY FROM '2022-06-01 12:30:15'::TIMESTAMP);
--İLGİLİ TARİHİN GÜN BİLGİSİNİ VERİR.

SELECT bookingdate,
       EXTRACT(MONTH FROM bookingdate)
FROM booking
;

-- age: İki tarih arasındaki farkı döndürür.
SELECT AGE('2022-06-03 11:30:15'::TIMESTAMP, '2022-06-01 12:30:15'::TIMESTAMP);

SELECT EXTRACT(DAY FROM '2022-06-03 11:30:15'::TIMESTAMP - '2022-06-01 12:30:15'::TIMESTAMP )
;

SELECT 
    bookingdate,
    AGE(current_date , bookingdate ),
    current_date - bookingdate 
FROM booking
;



-- date_part: Belirtilen birimi kullanarak tarih verisinden bir parçayı döndürür.
SELECT date_part('month', '2022-06-01 12:30:15'::TIMESTAMP);

SELECT EXTRACT (MONTH FROM '2022-06-01 12:30:15'::TIMESTAMP);

-- interval: İki tarih arasında işlem yapmaya yarar.
SELECT to_date('2022-06-01', 'YYYY-MM-DD') - interval '1 month';

SELECT 
    bookingdate,
    bookingdate + interval '1 week'
FROM booking;


--bugünden 1 hafta önce rezervasyon yapmış kişiler için;

SELECT 
    bookingdate,
    id as booking_id,
    contactid
FROM booking
WHERE bookingdate = current_date - interval '1 week'
;

-- now: Şu anki tarih ve saati döndürür.
SELECT NOW();
