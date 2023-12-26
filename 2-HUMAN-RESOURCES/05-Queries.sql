--2. Şirketimizde halen çalışmaya devam eden çalışanların listesini getiren sorgu hangisidir?
--Not:İşten çıkış tarihi boş olanlar çalışmaya devam eden çalışanlardır. 
--Select persons who still working (OUTDATE is null) in the company
SELECT * FROM PERSONS WHERE OUTDATE IS NULL


--Select total women and men who is stil working for each department
--3. Şirketimizde departman bazlı halen çalışmaya devam eden çalışan sayısını getiren sorguyu yazınız? 
SELECT DP.DEPARTMENT,
 CASE
	WHEN P.GENDER='E' THEN 'Erkek'
	WHEN P.GENDER='K' THEN 'Kadın'
 END AS GENDER,
  COUNT(DP.DEPARTMENT) AS TOTALPERSON
FROM PERSONS AS P
  JOIN DEPARTMENTS AS DP ON DP.ID=P.DEPARTMENTID
WHERE OUTDATE IS NULL
GROUP BY DP.DEPARTMENT, P.GENDER
ORDER BY DP.DEPARTMENT, P.GENDER

--Select total women and men who is stil working for each department (as column)
--4. Şirketimizde departman bazlı halen çalışmaya devam KADIN ve ERKEK sayılarını getiren sorguyu yazınız. 
SELECT
  D.DEPARTMENT,
  (SELECT COUNT(*) FROM PERSONS WHERE D.ID=DEPARTMENTID AND GENDER='E' AND OUTDATE IS NULL) AS MALE,
  (SELECT COUNT(*) FROM PERSONS WHERE D.ID=DEPARTMENTID AND GENDER='K' AND OUTDATE IS NULL) AS FEMALE,
  (SELECT COUNT(*) FROM PERSONS WHERE D.ID=DEPARTMENTID AND OUTDATE IS NULL) AS TOTAL_PERSON
FROM 
  DEPARTMENTS AS D
ORDER BY 
  DEPARTMENT


--Select min, max and average salary for 'PLANLAMA ŞEFİ'
--5. Şirketimizin Planlama departmanına yeni bir şef ataması yapıldı 
--ve maaşını belirlemek istiyoruz.Planlama
--departmanı için minimum,maximum ve ortalama şef maaşı getiren sorgu hangisidir? (Not:işten çıkmış olan
--personel maaşları da dahildir.) 
SELECT POSITION,
  MIN(SALARY) AS MIN_SALARY,
  MAX(SALARY) AS MAX_SALARY,
  ROUND(AVG(SALARY), 0) AS AVG_SALARY
FROM PERSONS AS P
  JOIN POSITIONS AS PT ON PT.ID=P.POSITIONID
GROUP BY PT.POSITION
HAVING POSITION='PLANLAMA ŞEFİ'

--Write a query that shows total person who still working and them average salary for each position
--6. Her bir pozisyonda mevcut halde çalışanlar olarak kaç kişi ve ortalama maaşlarının ne kadar olduğunu
--listelettirmek istiyoruz. Sonucu getiren sorguyu yazınız.
SELECT PS.POSITION,
  COUNT(POSITION) AS TOTAL_PERSON,
  ROUND(AVG(SALARY), 0) AS AVG_SALARY
FROM PERSONS AS P
  JOIN POSITIONS AS PS ON PS.ID=P.POSITIONID
WHERE P.OUTDATE IS NULL
GROUP BY PS.POSITION
ORDER BY PS.POSITION

--Write a query that shows total recruitment male and female for each year
--7. Yıllara göre işe alınan personel sayısını kadın ve erkek bazında listelettiren sorguyu yazınız.
SELECT
  YEAR(P.INDATE) AS YEAR_,
  (SELECT COUNT(*) FROM PERSONS WHERE GENDER='E' AND YEAR(INDATE)=YEAR(P.INDATE)) AS TOTAL_MALE,
  (SELECT COUNT(*) FROM PERSONS WHERE GENDER='K' AND YEAR(INDATE)=YEAR(P.INDATE)) AS TOTAL_FEMALE
FROM PERSONS AS P
GROUP BY YEAR(INDATE)
ORDER BY 1

--Write the query that shows how many months each employee has worked.
--Her çalışanın kaç ay çalıştığını gösteren sorguyu yazınız.
SELECT  NAME_+' '+ SURNAME, INDATE , OUTDATE,
  CASE
	WHEN OUTDATE IS NULL THEN DATEDIFF(MONTH, INDATE, GETDATE())
	WHEN OUTDATE IS NOT NULL THEN DATEDIFF(MONTH, INDATE, OUTDATE)
 END AS WORKING_TIME
FROM PERSONS

--Write the query that shows total shortnames
--Toplam kısa adları gösteren sorguyu yazın
SELECT
  LEFT(NAME_, 1) + '.' + LEFT(SURNAME, 1) AS SHORT_NAME,
  COUNT(LEFT(NAME_, 1) + '.' + LEFT(SURNAME, 1)) AS TOTAL_SHORTNAMES
FROM PERSONS
GROUP BY LEFT(NAME_, 1) + '.' + LEFT(SURNAME, 1)
ORDER BY TOTAL_SHORTNAMES DESC

--Write the query that shows departments ordinary salary greater than 5500
--8. Maaş ortalaması 5.500 TL’den fazla olan departmanları listeleyecek sorguyu yazınız. 
SELECT DEPARTMENT,
  ROUND(AVG(SALARY), 0) AS AVG_SALARY
FROM PERSONS AS P
  JOIN DEPARTMENTS AS DP ON DP.ID=P.DEPARTMENTID
GROUP BY DP.DEPARTMENT
HAVING ROUND(AVG(SALARY), 0) > 5500
ORDER BY AVG_SALARY DESC

--Option 2
SELECT DP.DEPARTMENT,
  ROUND((SELECT AVG(SALARY) FROM PERSONS WHERE DEPARTMENTID=DP.ID), 0) AS AVG_SALARY
FROM DEPARTMENTS AS DP
WHERE ROUND((SELECT AVG(SALARY) FROM PERSONS WHERE DEPARTMENTID=DP.ID), 0)>5500
ORDER BY AVG_SALARY DESC

--Write the query that shows person nanme, position, manager and manager position for each person
--9. Her personelin adını, pozisyonunu bağlı olduğu birim yöneticisinin adını ve pozisyonunu yönetici 
--pozisyonunu getiren sorguyu yazınız.
--Write the query that shows person nanme, position, manager and manager position for each person
SELECT  P.NAME_ + ' ' + P.SURNAME AS PERSON,
  PS.POSITION,
  P2.NAME_ + ' ' + P2.SURNAME AS MANAGER,
  PS2.POSITION AS MANAGER_POSITION
FROM  PERSONS AS P
  JOIN POSITIONS AS PS ON PS.ID=P.POSITIONID
  JOIN PERSONS AS P2 ON P2.MANAGERID=P2.ID
  JOIN POSITIONS AS PS2 ON PS2.ID=P2.POSITIONID

  --Write the query that captures the average seniority of the departments.
--10. Departmanların ortalama kıdemini ay olarak hesaplayacak sorguyu yazınız. 
SELECT DEPARTMENT, 
  AVG(WORKING_TIME) AS TOTAL_PERSON 
FROM 
  ( SELECT DP.DEPARTMENT, 
      CASE WHEN OUTDATE IS NULL THEN DATEDIFF(
        MONTH, 
        INDATE, 
        GETDATE()
      ) WHEN OUTDATE IS NOT NULL THEN DATEDIFF(MONTH, INDATE, OUTDATE) END AS WORKING_TIME 
    FROM PERSONS AS P 
      JOIN DEPARTMENTS AS DP ON DP.ID = P.DEPARTMENTID) AS T
GROUP BY DEPARTMENT


