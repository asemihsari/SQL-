-- CASE WHEN EXPRESSION 
-- "CASE WHEN" SQL'de koşul ifadesi ile kullanılan bir kontrol yapısıdır.  Bu ifade, belirli bir koşulu test etmenizi ve koşulun doğru veya yanlış olmasına bağlı olarak farklı bir değer veya ifade döndürmenizi sağlar.
-- Genel sözdizimi şu şekildedir:
-- CASE
--     WHEN condition1 THEN result1
--     WHEN condition2 THEN result2
--     ...
--     ELSE result
-- END

SELECT employee_id,
       first_name,
       last_name,
       salary,
       CASE WHEN salary < 8500                     THEN salary*1.5
            WHEN salary >= 8500 AND salary < 15000 THEN salary*1.25
            ELSE salary*1.15
             END
  FROM employees


-- OTHER CLAUSES 

-- ORDER BY
-- SQL'de ORDER BY komutu, veritabanındaki belirli bir tablo veya sütun içindeki kayıtların belirli bir kriterlere göre sıralanmasını sağlar.

select * from employees 
ORDER BY first_name

--ASC:küçükten büyüğe
--DESC:büyükten küçüğe


-- AS
-- SQL'de AS komutu, sorgularda kullanılan sütun veya tablo adlarının yerine farklı bir isim vermenizi sağlar. 

SELECT employee_id,
       first_name,
       last_name,
       salary,
       CASE WHEN salary < 8500                     THEN salary*1.5
            WHEN salary >= 8500 AND salary < 15000 THEN salary*1.25
            ELSE salary*1.15
             END AS new_salary
  FROM employees AS e 


-- LIMIT
-- LIMIT, SQL sorgularında sorgunun sonucunda döndürülecek olan satır sayısını belirlemek için kullanılan bir ifadedir. 

select * from employees 
order by salary desc
limit 3


-- DISTINCT
-- DISTINCT, SQL sorgularında veritabanındaki aynı değerleri tekrar etmeden sadece farklı değerleri döndürmek için kullanılan bir ifadedir.

select distinct
job_id,department_id
from employees
