-- STRING FUNCTIONS (Metinsel Fonksiyonlar)

-- CONCAT
-- Verilen iki veya daha fazla dizeyi birleştirerek tek bir dize oluşturur. Fonksiyonun kullanımı şu şekildedir:
-- concat(string1, string2, ...)
select
first_name,
last_name, concat (first_name,' ',last_name) as birlesik_ad
from employees 

-- LEFT
-- LEFT()  fonksiyonu, verilen bir dizenin belirli bir sayıda sol karakterini döndürür. Fonksiyonun kullanımı şu şekildedir:
-- left(string, length)
select first_name,
last_name,
left(first_name,3),left(last_name,3)  from employees ;

-- RIGHT
-- RIGHT fonksiyonu, verilen bir dizenin belirli bir sayıda sağ karakterini döndürür. Fonksiyonun kullanımı şu şekildedir:
-- right(string, length)
select first_name,
last_name,
right(first_name,3),right(last_name,3)  from employees ;



-- LENGTH
-- LENGTH() fonksiyonu, bir karakter dizisinin uzunluğunu döndüren bir fonksiyondur. Yani, bu fonksiyon bir karakter dizisindeki karakterlerin sayısını sayar.
--length(stiring)
select first_name,length(first_name) from employees

--LOWER
--PostgreSQL'de LOWER() fonksiyonu, bir karakter dizisindeki tüm karakterleri küçük harflere dönüştürür.
--LOWER(string)
select first_name,
lower(first_name) from employees;

--UPPER
--PostgreSQL'de UPPER() fonksiyonu, bir karakter dizisindeki tüm karakterleri büyük harflere dönüştürür.
--UPPER(string)
select first_name,last_name,
concat(first_name,' ',upper(last_name))
from employees;
-- TRIM
-- PostgreSQL'de TRIM() fonksiyonu, bir karakter dizisindeki boşlukları, belirtilen karakterleri veya karakter dizisini kırparak temizler.
-- Genel kullanımı şu şekildedir:
-- TRIM([characters FROM] string)
select TRIM(LEADING 'Leading' from 'Leading from remover .....');
--baştaki leading kısmını siler ve gerisini döndürür
select trim(Trailing from'trailin from asdasfda     ');
--trailing sondaki boşluk ifadesini siler. belirtmediğimiz değer boşluk olarak algılanır
select trim(both from '     both      ');
--both ifadesi baştaki ve sondaki ikine birden bakar ve temizler
select trim(both 'both' from 'both semih sari  ....');
--both ifadesi başta ve sonra 'both' arar. bu ifadede sadece başta olduğu için baştaki both ifadesini siler.

-- REPLACE
-- PostgreSQL'deki REPLACE() fonksiyonu, bir karakter dizisinde belirli bir karakter dizisini bulur ve onu başka bir karakter dizisiyle değiştirir.
-- Genel kullanımı şu şekildedir:
-- REPLACE(string, search_string, replace_string)
select replace(first_name,'John','ahmet') from employees
--first_name kolonunda john gördüğü yere ahmet yazar ve değiştirir.

-- SPLIT PART
-- PostgreSQL'deki SPLIT_PART() fonksiyonu, bir karakter dizisini belirli bir ayraç karakterine göre parçalar ve parçalardan birini seçer.
-- Genel kullanımı şu şekildedir:
-- SPLIT_PART(string, delimiter, field)
select SPLIT_PART(email,'@',1) from employees
--emaildeki ifadeyi @ işaretine göre böldü ve ilk ifadesini döndürdü.