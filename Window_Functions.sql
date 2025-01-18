-- WINDOW FUNCTIONS

-- SQL'de, window functions (pencere işlevleri) bir veri kümesindeki verileri gruplandırmak,
--sıralamak, analiz etmek ve özetlemek için kullanılan özel bir fonksiyon türüdür.


-- <window function> ( [expression] ) OVER (
--     [PARTITION BY partition_expression, ... ]
--     [ORDER BY sort_expression [ASC|DESC], ... ]
--     [ROWS frame_specification] 
-- ) 

-- WINDOW FUNCTIONS WITH AGGREGATE
-- AVG(column_name) OVER (PARTITION BY column_name) 

--Her çalışan bilgisi ile, ilgili departmanın ortalama maaş bilgisini getirin.
with avg_salary as (
select department_id,
avg(salary) as department_avg_salary from employees
group by 1
)

select concat(first_name,' ',
last_name) as name,
email,
e.department_id,
e.salary,
d.department_name,
round(department_avg_salary,2)
from employees as e 
left join departments as d on e.department_id=d.department_id
left join avg_salary as a_s on e.department_id=a_s.department_id
order by e.department_id asc

--window function ile daha kısa bir yazım şekli elde edebiliyoruz. 

select
first_name,
last_name,
d.department_id,
salary,
d.department_name,
job_id,
avg(salary) over (partition by d.department_id) as avg_salary,
avg(salary) over (partition by job_id) as job_avg_salary
from employees
left join departments as d on employees.department_id=d.department_id

--COUNT
--İSTEDİĞİMİZ COMPANY DE İSTEDİĞİMİZ AYDA NE KADAR REZERVASYON OLMUŞ ? WİNDOW FUNC;

SELECT 
id as bookingid,
contactid,
contactemail,
bookingdate,
company,
count(id) over (partition by company,date_trunc('month',bookingdate)) as booking_count
FROM booking


--3369 2020 Ocak
--1238 2019 Aralık
select 
company,
count(id),
to_char(bookingdate,'YYYY-MM')
from booking 
where to_char(bookingdate,'YYYY-MM') in ('2020-01','2019-12')
group by 1,3;

--SUM 
--gün ve cardtype a göre o gün ne kadar amount oldu ? 

select id as payment_id,
amount,
cardtype,
paymentdate,
sum(amount) over (partition by date_trunc('day',paymentdate),cardtype) as daily_total_amount
from payment
order by 1,4


select id as bookingid,
contactid,
contactemail,
bookingdate,
company,
max(bookingdate) over (partition by contactid) as contact_max_bookingdate,
min(bookingdate) over (partition by contactid) as contact_min_bookingdate
from booking 

-- ROW_NUMBER
-- ROW_NUMBER fonksiyonu, sorgu sonucunda dönen tüm satırlarda benzersiz bir sayısal değer oluşturur ve her satıra bir sıra numarası atar.
-- ROW_NUMBER() OVER (PARTITION BY column_name ORDER BY column_name)

select id as bookingid,
contactid,
contactemail,
bookingdate,
company,
row_number() over (partition by contactid order by bookingdate) as row_n
from booking
--partition by ile contact id ye göre parçaladığımız her contact id ye bir sıra numarası atar. bunu da booking date e göre yapar
--booking date i en küçük olandan büyüğe doğru sıralar ve her işleme bir sıra numarası atar.


--Tüm müşteriler için toplam amount ve company bilgisini getirin. Company en son rezervasyon yaptığı company olarak seçilmelidir.
--En son rezervasyon yaptırdığı şirketi müşterinin şirketi olarak seçiniz.
WITH
	LAST_COMP AS (
		SELECT
			ID AS BOOKINGID,
			CONTACTID,
			BOOKINGDATE,
			COMPANY,
			ROW_NUMBER() OVER (
				PARTITION BY
					CONTACTID
				ORDER BY
					BOOKINGDATE DESC
			) AS ROW_N
		FROM
			BOOKING AS B
		ORDER BY
			CONTACTID
	),
	TOTAL_AMOUNT AS (
		SELECT
			CONTACTID,
			SUM(AMOUNT) AS AMOUNT_TOTAL
		FROM
			BOOKING AS B
			LEFT JOIN PAYMENT AS P ON P.BOOKINGID = B.ID
		GROUP BY
			1
	)
SELECT
	LAST_COMP.CONTACTID,
	COMPANY,
	TOTAL_AMOUNT.AMOUNT_TOTAL
FROM
	LAST_COMP LEFT JOIN TOTAL_AMOUNT ON LAST_COMP.CONTACTID = TOTAL_AMOUNT.CONTACTID
WHERE
	ROW_N = 1
-- RANK
-- SQL'deki "RANK" fonksiyonu, sorgu sonucunda dönen verileri belirli bir sıralama düzenine göre sıralar 
--ve her bir satıra bir sıra numarası atar. Ancak, ROW_NUMBER fonksiyonundan farklı olarak, 
--RANK fonksiyonu, birden fazla satırın aynı sıralama düzeninde aynı değere sahip olması durumunda aynı sıra numarasını atar.
-- RANK() OVER (PARTITION BY column_name ORDER BY column_name)
SELECT 
contactid,
bookingdate,
to_char(bookingdate,'YYYY-MM-DD'),
row_number() over(partition by contactid order by to_char(bookingdate,'YYYY-MM-DD')) as row_mn
from booking
--row_number ve rank arasındaki fark:
SELECT 
contactid,
bookingdate,
to_char(bookingdate,'YYYY-MM-DD'),
row_number() over(partition by contactid order by to_char(bookingdate,'YYYY-MM-DD')) as row_mn,
rank() over(partition by contactid order by to_char(bookingdate,'YYYY-MM-DD')) as row_mn
from booking

--DENSE_RANK
-- DENSE_RANK, SQL'deki bir pencere işlevi (window function) olarak kullanılan bir fonksiyondur.
--RANK fonksiyonuna benzer şekilde sorgu sonuçlarındaki satırları sıralamaya yarar, 
--ancak RANK fonksiyonundan farklı olarak eşit sıralama değerlerine sahip satırlar 
--için aynı sıra numarası atar ve sıradaki boşlukları atlama özelliğine sahiptir.
-- DENSE_RANK() OVER (PARTITION BY column_name ORDER BY column_name)

select contactid,
bookingdate,
DATE(bookingdate) as date_booking_date,
DATE(userregisterdate),
row_number() over (partition by contactid order by DATE(userregisterdate) desc) as row_n,
rank() over (partition by contactid order by DATE(userregisterdate) desc) as rank,
dense_rank() over (partition by contactid order by DATE(userregisterdate) desc) as dense_rank_n
from booking
where contactid=136

--PERCENT_RANK(yüzdelik dilim manasına geliyor diyebiliriz.)
-- Bu fonksiyon, "0" ile "1" arasında bir değer döndürür. "0" değeri, sıralamanın en düşük değerini temsil
--ederken, "1" değeri, sıralamanın en yüksek değerini temsil eder. Diğer tüm değerler ise, 
--sıralamadaki her bir öğenin yüzdelik pozisyonunu ifade eder.
--genellikle istatistiksel veriler üzerinde kullanılıyor diyebiliriz.
--Ödeme tutarlarının hangi yüzdelik dilimini hesaplayınız.

--Amount = (p/100) * (n-1) + 1
select percent_rank() over (partition by to_char(paymentdate , 'YYYY-MM-DD') order by amount) as percent_rank,
amount ,
bookingid,
paymentdate
from payment
where to_char(paymentdate , 'YYYY-MM-DD')='2021-05-27'
order by to_char(paymentdate , 'YYYY-MM-DD') desc,amount desc
--n tane satırımız var.en büyük değere 1 atadık en küçüğe 0.
--en yüksek ödeme tutarına 1 ve en düşük ödeme tutarına da 0 verir. arkada bir hesaplama yaparak,
--bookingid nin ödeme tutarının yüzdelik dilimini öğrenmiş oluyoruz.



-- NTILE
-- NTILE() fonksiyonu, bir veri kümesini eşit sayıda parçaya bölerek, her bir parçanın sıralama içindeki yerini belirlemek için kullanılan bir SQL pencere fonksiyonudur. 
-- NTILE(n) OVER (ORDER BY <order_sutunu>)

select percent_rank() over (partition by to_char(paymentdate , 'YYYY-MM-DD') order by amount) as percent_rank,
ntile(4) over(order by amount) as ntile_,
amount ,
bookingid,
paymentdate
from payment
where to_char(paymentdate , 'YYYY-MM-DD')='2021-05-27'
order by to_char(paymentdate , 'YYYY-MM-DD') desc,2 desc




-- LAG 
-- Lag, SQL'de bir önceki satırdaki değerini almak için kullanılır.
-- LAG(column_name, <offset>, <default_deger>) OVER ( PARTITION BY <partition_sutunu> ORDER BY <order_sutunu>)
-- LAG(bookingdate, 1 , NULL) OVER (PARTITION BY contactid ORDER BY bookingdate ) as prev_bookingdate
select id as bookingid,
contactid,
bookingdate,
lag(bookingdate) over (partition by contactid order by bookingdate) prev_bookingdate
from booking



-- LEAD
-- LEAD fonksiyonu, bir tablodaki bir sütunun bir sonraki satırdaki değerini döndürür. Bu, LAG fonksiyonunun tam tersidir.
-- LEAD(bookingdate, 1 , NULL) OVER (PARTITION BY contactid ORDER BY bookingdate ) as next_bookingdate

select id as bookingid,
contactid,
bookingdate,
lead(bookingdate) over (partition by contactid order by bookingdate) next_bookingdate,
lead(bookingdate,2,null) over (partition by contactid order by bookingdate) next_second_bookingdate
from booking





--FIRST_VALUE
-- "FIRST_VALUE" fonksiyonu, bir sütunda bulunan değerlerin ilk değerini döndürür.
--FIRST_VALUE(column_name) OVER (PARTITION BY column_name ORDER BY column_name)

select id as bookingid,
contactid,
bookingdate,
first_value(bookingdate) over (partition by contactid order by bookingdate)
from booking


