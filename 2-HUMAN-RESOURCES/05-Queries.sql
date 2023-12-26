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