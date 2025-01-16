--AGGREGATE FUNCTIONS ve GROUP BY
--SQL'de aggregate functionlar, bir veri tablosundaki verileri
--toplamak, 
--saymak, 
--ortalamak, 
--en yüksek veya en düşük değerleri bulmak 
--gibi işlemleri gerçekleştirmek için kullanılan fonksiyonlardır.

-- SQL'de kullanılan aggregate functionlar şunlardır:

-- COUNT(): Veri tablosunda kaç satır olduğunu sayar.
SELECT * FROM countries
SELECT COUNT(*) FROM countries;
SELECT COUNT(region_id) FROM countries;
SELECT * FROM employees;
SELECT COUNT(*) FROM employees;
SELECT COUNT(manager_id) FROM employees;
SELECT region_id, COUNT(*) FROM countries GROUP BY region_id
SELECT job_id, COUNT(*) FROM employees GROUP BY job_id


-- SUM(): Veri tablosunda belirli bir sütunun değerlerinin toplamını döndürür.
SELECT SUM(salary) FROM employees;
SELECT department_id, SUM(salary) FROM employees GROUP BY department_id
-- AVG(): Veri tablosunda belirli bir sütunun değerlerinin ortalamasını döndürür.
SELECT AVG(salary) FROM employees;
SELECT COUNT(job_id), SUM(salary) FROM employees GROUP BY job_id
-- MIN(): Veri tablosunda belirli bir sütunun en küçük değerini döndürür.
SELECT MIN(salary) FROM employees;
SELECT job_id, MIN(salary) FROM employees GROUP BY job_id
-- MAX(): Veri tablosunda belirli bir sütunun en büyük değerini döndürür.
SELECT MAX(salary) FROM employees;
SELECT job_id, MAX(salary) FROM employees WHERE  job_id= 5 GROUP BY job_id





