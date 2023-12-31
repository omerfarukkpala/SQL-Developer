-- CREATE CUSTOMERS DATABASE
CREATE DATABASE CUSTOMERS

-- CREATE CITIES TABLE
CREATE TABLE CITIES (
  ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  CITY VARCHAR(50)
)

-- CREATE DISTRICT TABLE
CREATE TABLE DISTRICT (
  ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  CITYID INT,
  DISTRICT VARCHAR(50)
)

-- CREATE CUSTOMERS TABLES
CREATE TABLE CUSTOMERS (
  ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  CUSTOMERNAME VARCHAR(100),
  TCNUMBER VARCHAR(11),
  GENDER VARCHAR(1),
  EMAIL VARCHAR(100),
  BIRTDATE DATE,
  CITYID INT,
  DISTRICTID INT,
  TELNR1 VARCHAR(15),
  TELNR2 VARCHAR(15)
)