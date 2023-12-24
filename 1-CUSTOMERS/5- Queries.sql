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



