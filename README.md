  # SQL-Developer 🚀                                      
                         
 MS SQL Developer eğitimi boyunca, SQL dilini temel seviyeden başlayarak kapsamlı bir şekilde öğrenme şansı buldum. Eğitim sürecinde, Select, Insert, Update, Delete gibi temel SQL cümleleri ile veritabanı sorgulamayı etkili bir biçimde gerçekleştirebilmeyi öğrendim.

Ayrıca, Create, Alter, Drop gibi DDL komutlarını nasıl kullanacağımı öğrenmenin yanı sıra, ilişkisel veritabanı mantığı ve mimarisini de detaylı bir şekilde kavradım. Öğretim yöntemleri, iç içe select (subquery) kullanımı, Index, View, Procedure, Function gibi kavramları gerçek veri ve senaryolar üzerinde uygulayarak öğrenmemi sağladı.
  
         
       
## İçerikler  

- **Temel SQL Cümleleri:** Select, Insert, Update, Delete gibi temel SQL cümlelerini etkili bir şekilde kullanmayı öğrenin.
- **DDL Komutları:** Create, Alter, Drop gibi DDL komutlarını nasıl kullanacağınızı öğrenin.
- **İlişkisel Veritabanı Mantığı:** Veritabanı tasarımı ve ilişkisel veritabanı mantığını kavrayın.
- **Öğretim Yöntemleri:** İç içe select (subquery) kullanımı, Index, View, Procedure, Function gibi kavramları gerçek veri ve senaryolar üzerinde uygulayarak öğrenin.

##  MSSQL Platformu



##### 🔍 SELECT: Retrieve information from the database.
#####  🗂️ FROM: Specify where to look for the info. 
#####  🎯 WHERE: Filter and find specific stuff.
##### 👥 GROUP BY: Organize similar things together.
##### 🔀 ORDER BY: Arrange your info in a specific order.
##### 🤝 JOIN: Combine info from different places.
##### ➕ INSERT INTO: Add new stuff to the database.
##### 🔄 UPDATE: Modify existing info.
##### 🗑️ DELETE FROM: Remove things (careful with this one!).
##### 🔧 ALTER TABLE: Make changes to the structure of your database.
## 1-CUSTOMERS  
![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/bf0dca36-a2bc-4d0c-8759-31c5f6703aae)
## SCENARIO 1 ![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/d123ed34-81b5-4ffe-a628-2ade9ebec230)
## SCENARIO 2 ![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/64874044-519b-4a33-8ecb-70a0b4363fd3)

### 1- Creating Database Tables

![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/989cadb8-fae5-406f-a690-0d384fdf2ec5)

### 2- Insert Customers

![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/f9bcb12a-3a9d-44a9-8ea0-b9bc4b220877)
![sssssss](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/7fe45cdf-737b-4d70-90c3-2622163e6b81)

### 3- Insert Cities

![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/2d835ddf-5046-4263-aed2-9df74ab3ce3c)

## 4- Insert Districts

![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/aa018510-5abf-47de-9cad-037c1ca8e490)

## 5- Queries

### Query 1: Select the customers that names starts with 'A'

![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/74c189c7-ad4d-494e-9cb3-278a976bb4b9)

### Query 2: Select the male customers that starts with 'A'

![cusss](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/e816f73e-aa3e-4e2f-a6a9-ef4fc71de883)

### Query 3: Select the customers that born between 1990 and 1995

![333](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/0de58187-374d-4d49-b557-b63fd30a0861)

### Query 4: With 'JOIN' command, select the customers who live in İSTANBUL

![Adsız](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/5f10ea96-c4b4-4154-9742-40546f288b1c)

### Query 5: With subquery, select the customers who live in İSTANBUL

![555](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/91ead721-fa32-4664-8905-462f81b8f927)

### Query 6: Write the query that shows how many customers are in which city and order them in desending

![66](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/46d01d05-d420-46da-b813-3ccec46bf0d6)

### Query 7: Write the query that shows cities have more than 10 customers and order them in descending

![7](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/8c37a400-b077-4aa5-8d93-23b16ae4b932)

### Query 8: Write the query that shows how many female and male customers are in which city

![8](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/926b0387-0979-4b02-aeb6-88a3ae678cd5)
![888](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/5435763c-5dd5-477d-b053-ed9acd5bc900)

### Query 9: Add new columns called AGEGROUP in customers table. Type should be varchar(50)

![9](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/4e96a876-bf1f-4f7c-bf9f-28f7aaa9cba5)

### Query 10: Update AGEGROUP as 20-35, 36-45, 46-55, 56-65, 65+

![10](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/375a6dae-850a-4820-b07c-e180d4fe4f5e)

### Query 10-1: Write the query that shows how many customers are in which group without using AGEGROUP

![10-1](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/a2871bc7-bcdf-47b8-be7b-f2ce2e4782b4)

### Query 11: Write the query that shows customers live in Istanbul but district is not 'Kadıköy'

![11](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/2c6d851a-cc93-40a1-988f-6de3b002680a)

### Query 11-1: Write the query that shows customers whose city table's is null

![11-1](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/dfaf3d3e-520d-40d2-9fec-bcbe59c97b54)

### Query 12: Write the query that shows customers phones operators as OPERATOR1 and OPERATOR2

![12](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/70940404-6869-4808-9a57-e778670f16f1)

### Query 13: Here, write the query that will provide information about how many customers we have from which operator

![13](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/ea73576c-7a2e-4446-bcd5-b7cb8ea210d8)

### Query 14: Write the query that shows total customers of district and order them in descending

![14](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/205a2b6c-f86c-463d-940d-5f3818494ac3)

### Query 15: Write the query that shows customer birth date as a weekday

![15](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/06ebecbc-6275-4bfc-80d4-e73436f479e3)

### Query 15-1: Write the query that shows customer birth date is today

![15-1](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/fee60b63-a800-47da-b2e8-e2988a60f6bf)

## 2-HUMAN-RESOURCES
### 1- Creating Database Tables![1](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/daeef128-c1f8-4e68-beee-7b0bfd76ea91)
### 2- Insert DEPARTMENTS 
![İNSERTABLEEE](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/d5c1f61f-3f20-4b31-afcb-9c2edaf70286)
### 3- INSERT DATA IN PERSONS TABLE
![1111111111](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/e1c45efa-d87c-4bc6-be38-3d5765e26084)
### 4- INSERT DATA IN POSITIONS TABLE ![POSİTİON ADD](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/e9f6a956-74c2-46ef-9b97-b90f3e0939a1)
## 5- Queries
### Select persons who still working (OUTDATE is null) in the company
![2](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/af22c80a-0924-4d94-a76b-c28ffd11e70d)
### Select total women and men who is stil working for each department
![333](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/77ea3a15-9c39-4e3a-a034-e5296ef71392)
### Select total women and men who is stil working for each department (as column)
![4444](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/362a12b6-b8ea-4a0a-a169-719feaf1b315)
### Select min, max and average salary for 'PLANLAMA ŞEFİ'
![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/b2cc6457-c8c5-463e-9c17-b3831a164648)
![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/d8057a29-ed8c-4981-bbc6-a5bbff9f2788)
### Write a query that shows total person who still working and them average salary for each position
![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/433f30da-8ad7-48d8-9f34-777bf17b0157)
![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/b56d35f2-084d-4401-afb0-da700fdb8d40)
### Write a query that shows total recruitment male and female for each year
![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/de247478-dd21-4fa6-9239-fe6d9dfdd576)
![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/56e2a121-d7d7-416d-8b63-4f619938bd7b)

### Write the query that shows how many months each employee has worked.
![dadsadsa](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/316ab59f-dde9-412b-8fa0-c43d4a75a9fa)
### Write the query that shows total shortnames
![231321](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/5f4d829c-a261-45f1-ac4a-7b2c21aca799)
### Write the query that shows departments ordinary salary greater than 5500
![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/baa8aa85-1738-4221-a1c4-68197681996c)
![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/faafc6fc-113e-4763-86bd-a5537b2725a1)
### Write the query that shows person nanme, position, manager and manager position for each person
![9999](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/d41bb6c0-ce1b-4275-84af-b5ea093e7f48)
### Write the query that captures the average seniority of the departments
![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/742f5a09-b7c3-4370-966f-d27b12175673)
![image](https://github.com/omerfarukkpala/SQL-Developer/assets/101570820/9e7569c3-2235-4847-be25-3b45468525b8)

## 3-ETRADE
