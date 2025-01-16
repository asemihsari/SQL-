--WHERE komutu sorgulama işlemi sırasında belirli koşullara göre verileri filtrelemeye yarar.
--SELECT * FROM tablo_adi WHERE sartlar
--WHERE komutu, karşılaştırma operatörleriyle ya da mantıksal operatörlerle birlikte kullanılır.
SELECT * FROM employees

-- Karşılaştırma Operatörleri
-- Eşittir Operatörü (=)
SELECT * FROM employees WHERE first_name = 'Nancy'
SELECT * FROM employees WHERE employee_id = 105
-- Eşit Değildir Operatörü (<> ya da !=)
SELECT * FROM employees WHERE employee_id <> 105
SELECT * FROM employees WHERE employee_id != 105
-- Büyüktür Operatörü (>)
SELECT first_name, last_name FROM employees WHERE job_id > 6
-- Küçüktür Operatörü (<)
SELECT first_name, last_name FROM employees WHERE job_id < 10
-- Büyük ya da Eşittir Operatörü (>=)
SELECT * FROM employees WHERE hire_date >= '1997-01-01'
-- Küçük ya da Eşittir Operatörü (<=)
SELECT * FROM employees WHERE salary <= 3500
-- IS NULL Opratörü (IS NULL)
SELECT * FROM employees WHERE manager_id IS NULL



-- Mantıksal Operatörler :
-- AND (VE) Operatörü  ; Her iki şartta doğru ise
SELECT * FROM employees WHERE hire_date > '1996-01-01' AND salary < 6000
SELECT employee_id, first_name, last_name, manager_id, employee_id FROM employees WHERE employee_id>=107 AND manager_id < 120
-- OR (VEYA) Operatörü  ; Şartların en az biri doğru ise
SELECT * FROM employees WHERE hire_date >= '1997-01-01' OR manager_id > 120 


-- IN (İÇİNDE) ; Belirtilen kümedeki değerleri kapsıyor ise 
SELECT * FROM employees WHERE job_id IN (13,6)
SELECT * FROM employees WHERE department_id IN (2,8)
-- BETWEEN (ARASINDA) Operatörü ; Belirli bir aralıkta doğru ise
SELECT * FROM employees WHERE employee_id BETWEEN 120 AND 170
SELECT * FROM employees WHERE employee_id = 170

-- LIKE (BENZER) Operatörü ; Wildcard'lar ile birlikte kullanılır, belirtilen patternde data geliyor ise
	--'%'
	--'_'
SELECT * FROM employees WHERE first_name LIKE '%'
-- NOT (DEĞİL) Operatörü ; Şart doğru değil ise

