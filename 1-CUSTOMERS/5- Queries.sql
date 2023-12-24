-- Query 1: Select the customers that names starts with 'A'
-- Customers tablosundan adı ‘A’ harfi ile başlayan kişileri çeken sorguyu yazınız.
SELECT * FROM CUSTOMERS WHERE CUSTOMERNAME LIKE 'A%'
-- Query 2: Select the male customers that starts with 'A'
--'A' ile başlayan erkek müşterileri seçin
SELECT * FROM CUSTOMERS WHERE CUSTOMERNAME LIKE 'A%' AND GENDER='E'

-- Query 3: Select the customers that born between 1990 and 1995
--3. 1990 ve 1995 yılları arasında doğan müşterileri çekiniz. 1990 ve 1995 yılları dahildir.
SELECT * FROM CUSTOMERS WHERE BIRTDATE BETWEEN '1990-01-01' AND '1995-12-31'
-- 2
SELECT * FROM CUSTOMERS WHERE YEAR(BIRTDATE) BETWEEN 1990 AND 1995

-- Query  4: With 'JOIN' command, select the customers who live in İSTANBUL
--4. İstanbul’da yaşayan kişileri Join kullanarak getiren sorguyu yazınız.
SELECT C.*, CT.CITY FROM CUSTOMERS C
  JOIN CITIES CT ON CT.ID=C.CITYID
WHERE CT.CITY='İSTANBUL'

-- Query 5: With subquery, select the customers who live in İSTANBUL
--5. İstanbul’da yaşayan kişileri subquery kullanarak getiren sorguyu yazınız.
SELECT *, (SELECT CITY FROM CITIES WHERE CITIES.ID=CUSTOMERS.CITYID) CITY FROM  CUSTOMERS
WHERE (SELECT CITY FROM CITIES WHERE CITIES.ID=CUSTOMERS.CITYID)='İSTANBUL'

-- Option 2
SELECT   * FROM CUSTOMERS WHERE CITYID IN (SELECT ID FROM CITIES WHERE CITY IN ('İSTANBUL'))

--6. Hangi şehirde kaç müşterimizin olduğu bilgisini getiren sorguyu yazınız.
-- Query  6: Write the query that shows how many customers are in which city and order them in desending
-- 6. Hangi şehirde kaç müşterimizin olduğu bilgisini getiren sorguyu yazınız.
SELECT CT.CITY, COUNT(CT.CITY) TOTAL_CUSTOMERS FROM CUSTOMERS C
  JOIN CITIES CT ON CT.ID=C.CITYID
GROUP BY
  CT.CITY
ORDER BY 
  2 DESC

  -- Query 7: Write the query that shows cities have more than 10 customers and order them in descending
/*10’dan fazla müşterimiz olan şehirleri müşteri sayısı ile birlikte müşteri sayısına göre fazladan aza doğru sıralı
şekilde getiriniz*/
SELECT  CITY, COUNT(CITY) TOTAL_CUSTOMERS FROM CUSTOMERS C
  JOIN CITIES CT ON CT.ID=C.CITYID
GROUP BY CITY
HAVING COUNT(CITY)>10
ORDER BY TOTAL_CUSTOMERS DESC

-- Query 8: Write the query that shows how many female and male customers are in which city
--8. Hangi şehirde kaç erkek, kaç kadın müşterimizin olduğu bilgisini getiren sorguyu yazınız
SELECT CT.CITY,C.GENDER,COUNT(GENDER) TOTAL_CUSTOMERS FROM CUSTOMERS C
  JOIN CITIES CT ON CT.ID=C.CITYID
GROUP BY CITY, GENDER
ORDER BY CITY, GENDER

-- Query 8: Write the query that shows how many female and male customers are in which city as columns
--8. Hangi şehirde kaç erkek, kaç kadın müşterimizin olduğu bilgisini getiren sorguyu yazınız
SELECT CITY,
  (SELECT COUNT(*) FROM CUSTOMERS WHERE CUSTOMERS.CITYID=CT.ID AND GENDER='K') FEMALE_CUSTOMERS,
  (SELECT COUNT(*) FROM CUSTOMERS WHERE CUSTOMERS.CITYID=CT.ID AND GENDER='E') MALE_CUSTOMERS
FROM 
  CITIES CT

-- Query 9: Add new columns called AGE GROUP in customers table. type should be varchar(50)
--Customers tablosuna yaş grubu için yeni bir alan ekleyiniz. Bu işlemi hem management studio ile hem de sql
--kodu ile yapınız. Alanı adı AGEGROUP veritipi Varchar(50) 
ALTER TABLE 
  CUSTOMERS
ADD 
  AGEGROUP VARCHAR(50)


-- Query 10: Update AGEGROUP as 20-35, 36-45, 46-55, 56-65, 65+
--Customers tablosuna eklediğiniz AGEGROUP alanını 20-35 yaş arası,36-45 yaş arası,46-55 yaş arası,55-65 --yaş
--arası ve 65 yaş üstü olarak güncelleyiniz.
UPDATE  CUSTOMERS SET AGEGROUP ='20-35' WHERE 
  DATEDIFF(YEAR, BIRTDATE, GETDATE()) BETWEEN 20 AND 35

UPDATE CUSTOMERS SET  AGEGROUP='36-45' WHERE
  DATEDIFF(YEAR, BIRTDATE, GETDATE()) BETWEEN 36 AND 45


UPDATE CUSTOMERS SET AGEGROUP='46-55' WHERE
  DATEDIFF(YEAR, BIRTDATE, GETDATE()) BETWEEN 46 AND 55


UPDATE CUSTOMERS SET AGEGROUP='56-65' WHERE
  DATEDIFF(YEAR, BIRTDATE, GETDATE()) BETWEEN 56 AND 65

UPDATE CUSTOMERS SET AGEGROUP='65+' WHERE
  DATEDIFF(YEAR, BIRTDATE, GETDATE())>65


-- Query 10-1: Write the query that shows how many customers are in which group without using AGEGROUP
-- Sorgu 10-1: AGEGROUP kullanmadan hangi grupta kaç müşteri olduğunu gösteren sorguyu yazınız.
SELECT AGEGROUP2, COUNT(AGEGROUP2) AS TOTAL_CUSTOMERS FROM
	(
	SELECT *,
	  CASE
		WHEN DATEDIFF(YEAR, BIRTDATE, GETDATE()) BETWEEN 20 AND 35 THEN '20-35'
		WHEN DATEDIFF(YEAR, BIRTDATE, GETDATE()) BETWEEN 36 AND 45 THEN '36-45'
		WHEN DATEDIFF(YEAR, BIRTDATE, GETDATE()) BETWEEN 46 AND 55 THEN '46-55'
		WHEN DATEDIFF(YEAR, BIRTDATE, GETDATE()) BETWEEN 56 AND 65 THEN '56-65'
		WHEN DATEDIFF(YEAR, BIRTDATE, GETDATE())>65 THEN '65+'
	  END 
	  AGEGROUP2 FROM CUSTOMERS ) TMB
GROUP BY AGEGROUP2 
ORDER BY TOTAL_CUSTOMERS DESC

-- Query 11: Write the query that shows customers live in Istanbul but district is not 'Kadıköy'
--11. İstanbul’da yaşayıp ilçesi ‘Kadıköy’ dışında olanları listeleyiniz.
SELECT C.*, CT.CITY,D.DISTRICT FROM CUSTOMERS AS C
  JOIN CITIES CT ON CT.ID=C.CITYID
  JOIN DISTRICTS D ON D.ID=C.DISTRICTID
WHERE CITY='İSTANBUL' AND DISTRICT<>'KADIKÖY'
 
-- Query 12: Write the query that shows customers phones operators as OPERATOR1 and OPERATOR2
--12. Müşterilerimizin telefon numalarının operatör bilgisini getirmek istiyoruz. 
--TELNR1 ve TELNR2 alanlarının yanına
--operatör numarasını (532),(505) gibi getirmek istiyoruz. Bu sorgu için gereken SQL cümlesini yazınız.
SELECT CUSTOMERNAME , TELNR1 , TELNR2,
  LEFT(TELNR1, 5) AS OPERATOR1,
  LEFT(TELNR2, 5) AS OPERATOR2
FROM CUSTOMERS

  -- Option 2
SELECT CUSTOMERNAME , TELNR1 , TELNR2,
  SUBSTRING(TELNR1, 2, 3) AS OPERATOR1,
  SUBSTRING(TELNR2, 2, 3) AS OPERATOR2
FROM  CUSTOMERS

--13. Müşterilerimizin telefon numaralarının operatör bilgisini getirmek istiyoruz. Örneğin telefon numaraları “50”
--ya da “55” ile başlayan “X” operatörü “54” ile başlayan “Y” operatörü “53” ile başlayan “Z” operatörü olsun.
--Burada hangi operatörden ne kadar müşterimiz olduğu bilgisini getirecek sorguyu yazınız

SELECT Operator,
    COUNT(DISTINCT ID) AS CustomerCount
FROM (
    SELECT 
        ID,
        CASE 
            WHEN SUBSTRING(TELNR1, 2, 2) IN ('50', '55') THEN 'X Operator'
            WHEN SUBSTRING(TELNR1, 2, 2) = '54' THEN 'Y Operator'
            WHEN SUBSTRING(TELNR1, 2, 2) = '53' THEN 'Z Operator'
            ELSE 'Unknown Operator'
        END AS Operator
    FROM  CUSTOMERS
    WHERE TELNR1 IS NOT NULL
    UNION ALL
    SELECT ID,
        CASE 
            WHEN SUBSTRING(TELNR2, 2, 2) IN ('50', '55') THEN 'X Operator'
            WHEN SUBSTRING(TELNR2, 2, 2) = '54' THEN 'Y Operator'
            WHEN SUBSTRING(TELNR2, 2, 2) = '53' THEN 'Z Operator'
            ELSE 'Unknown Operator'
        END AS Operator
    FROM  CUSTOMERS
    WHERE TELNR2 IS NOT NULL
) AS Subquery
GROUP BY 
    Operator


-- Query 14: Write the query that shows total customers of district and order them in descending
--Her ilde en çok müşteriye sahip olduğumuz ilçeleri müşteri sayısına göre çoktan aza doğru sıralı şekilde
--şekildeki gibi getirmek için gereken sorguyu yazınız
SELECT CT.CITY , D.DISTRICT, COUNT(D.DISTRICT) AS CUSTOMERCOUNT FROM 
  CUSTOMERS AS C
  JOIN CITIES AS CT ON CT.ID=C.CITYID
  JOIN DISTRICTS AS D ON D.ID=C.DISTRICTID
GROUP BY 
  CT.CITY, D.DISTRICT
ORDER BY 
  CT.CITY,
  CUSTOMERCOUNT DESC

  -- Query 15: Write the query that shows customer birth date as a weekday
--15. Müşterilerin doğum günlerini haftanın günü(Pazartesi, Salı, Çarşamba..) olarak getiren sorguyu yazınız.

SELECT CUSTOMERNAME, BIRTDATE,
  DATENAME(weekday, BIRTDATE) AS BIRTDAY
FROM CUSTOMERS



-- Query 15-1: Write the query that shows customer birth date is today
--Müşterinin doğum tarihinin bugün olduğunu gösteren sorguyu yazınız.
SELECT
  CUSTOMERNAME,
  BIRTDATE,
  DATENAME(weekday, BIRTDATE)
FROM
  CUSTOMERS
WHERE 
  BIRTDATE=GETDATE()