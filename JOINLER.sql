-- SQL join işlemleri, bir veya daha fazla tablo arasında veri eşleme işlemidir. 



-- INNER JOIN
-- İki tablo arasındaki ortak kayıtlar döndürülür, diğer tüm kayıtlar dışlanır.
-- SELECT *
-- FROM table1
-- INNER JOIN table2
-- ON table1.column = table2.column;

SELECT first_name,
       last_name,
       e.department_id,
       department_name
  FROM employees AS e
 INNER JOIN departments AS d
    ON e.department_id = d.department_id
;


SELECT *
  FROM students AS s
 INNER JOIN payments AS p
    ON s.id = p.student_id

;

SELECT *
  FROM payments


;
SELECT 
 c.country_name,
 r.region_name
FROM countries AS c
INNER JOIN regions AS r ON c.region_id=r.region_id
;




--LEFT JOIN
--bir tablonun solundaki kayıtların diğer tablo ile eşleştiği veya eşleşmeyen tüm kayıtların birleştirilmesini sağlar. --Eşleşmeyen kayıtlar, diğer tablo için NULL değerleri olarak görüntülenir.
-- SELECT *
-- FROM table1
-- LEFT JOIN table2
-- ON table1.column = table2.column;



--RIGHT JOIN
--bir tablonun sağındaki kayıtların diğer tablo ile eşleştiği veya eşleşmeyen tüm kayıtların birleştirilmesini sağlar. --Eşleşmeyen kayıtlar, diğer tablo için NULL değerleri olarak görüntülenir.
-- SELECT *
-- FROM table1
-- RIGHT JOIN table2
-- ON table1.column = table2.column;



--Kayıt olan tüm öğrencilerle birlikte ödeme yapanların bilgisi.
SELECT *
  FROM students AS s
  LEFT JOIN payments AS p
    ON s.id = p.student_id
;


SELECT *
  FROM students AS s
 INNER JOIN payments AS p
    ON s.id = p.student_id
    ;

SELECT *
  FROM payments AS p
 RIGHT JOIN students AS s
    ON s.id = p.student_id
;


SELECT *
  FROM students AS s 
 RIGHT JOIN payments AS p
    ON s.id = p.student_id
;

--Hem kayıt olan, hem ödemesini yapmış kişiler.
SELECT * FROM students AS s
INNER JOIN payments AS p ON s.id=p.student_id
;






-- FULL OUTER JOIN
-- veritabanındaki iki tablonun tüm kayıtlarını birleştirir ve eşleşmeyen kayıtları da içerir. Her iki tablo -- da tamamıyla listelenir ve eşleşmeyen kayıtlar NULL değerleri ile doldurulur.
-- SELECT column1, column2, ...
-- FROM table1
-- FULL OUTER JOIN table2
-- ON table1.column = table2.column;


SELECT *
  FROM students AS s 
FULL OUTER JOIN payments AS p
    ON s.id = p.student_id;
    
select * from payments;

SELECT first_name,
       last_name,
       e.job_id,
       j.job_title
FROM employees as e
FULL OUTER JOIN jobs as j ON e.job_id=j.job_id


-- CROSS JOIN
--iki tablo arasındaki tüm satırların kombinasyonunu oluşturan bir join türüdür. Cross join, tablo adını takip eden ON --koşulu olmaksızın bir tablo ile diğer tablonun her satırının birleştirilmesi sonucu oluşur.
-- SELECT *
-- FROM table1
-- CROSS JOIN table2;


SELECT *
  FROM students AS s 
CROSS JOIN payments AS p
WHERE p.id != 1
ORDER BY 1
;






