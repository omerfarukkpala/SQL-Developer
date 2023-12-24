-- Query 1: Select the customers that names starts with 'A'
-- Customers tablosundan adı ‘A’ harfi ile başlayan kişileri çeken sorguyu yazınız.
SELECT * FROM CUSTOMERS WHERE CUSTOMERNAME LIKE 'A%'
-- Query 2: Select the male customers that starts with 'A'
--'A' ile başlayan erkek müşterileri seçin
SELECT * FROM CUSTOMERS WHERE CUSTOMERNAME LIKE 'A%' AND GENDER='E'