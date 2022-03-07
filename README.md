# **MyExpensesDB**

**Introduction**
------------------------------------------------------------------------------------------------------------------------------------
 **MyExpensesDB**, a very basic and simple SQL Server database. I started this project to practice my database creation knowledge, boost my skills for T-SQL and SQL Server knowledge on on-premises and cloud. The second purpose of this project, I want a database that I can interact and update everyday. This database will serve as a database to record all my daily bought items, calculate my per cut-off/payday expenses and savings. I will just use Excel with add-ins that will connect to SQL Server and enter records. For my privacy, I will only show the database creation, management, & etc not my personal spending records :)


**Prerequisites**
------------------------------------------------------------------------------------------------------------------------------------
Download and install the following:
1. Microsoft SQL Server Developer Edition (https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
2. Microsoft SQL Server Management Studio (https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15)
3. Optional, Microsoft Azure Studio (part of SQL Server Management Studio)


**Database Diagram**
------------------------------------------------------------------------------------------------------------------------------------
Here's my diagram of the database:

![image](https://user-images.githubusercontent.com/95063830/157035347-75a511b8-d3a5-45ca-b3e0-f3ed23f3ffed.png)


**Database Tables description**
------------------------------------------------------------------------------------------------------------------------------------
**Tables:**

**_PyExSvtbl_** = table to log my every Cut-off/PayDay salary. Here in my home country, the typical Cut-off/PayDay salary is every 15th and last of day of the month. This was the setup of my previous job. My current job (as of March 2022), my Cut-off/PayDay salary is every 10th and 25th of the Month. This table also serve to compute my per Cut-off/PayDay expenses (how much money I spent) and savings (how money I saved). <br/>
**_Paidtbl_** =  table to list anything that I spend (paid, bought, & etc). <br/>
**_FrmDepotbl_** =  table to list my expenses directly from my deposit account.<br/>



**Database Creation**
----------------------------------------------------------------------------------------------------------------------------------

**Step 1** - Create the database (MyExpensesDB). Execute the following SQL statements to create the Database. Script file also uploaded.

USE master;                                                  <br/>
GO

CREATE DATABASE MyExpensesDB                                  <br/>
ON PRIMARY (                                                  <br/>
    NAME = 'MyExpensesDB',                                    <br/>
    FILENAME = 'D:\MSSQL\DataLogs\MyExpensesDB.mdf',          <br/>
    SIZE = 1024MB, MAXSIZE = UNLIMITED, FILEGROWTH = 64MB)                                                            
LOG ON (                                                      <br/>
    NAME = 'MyExpensesDB_log',                                <br/>
    FILENAME = 'D:\MSSQL\DataLogs\MyExpensesDB_log.mdf',      <br/>
    SIZE = 64MB, MAXSIZE = UNLIMITED, FILEGROWTH = 64MB);     <br/>

![image](https://user-images.githubusercontent.com/95063830/157047148-bbbc9cdb-5dac-415f-84f1-14eaaea6d425.png)

Database succesfully created!

![image](https://user-images.githubusercontent.com/95063830/157047315-946e482d-0bb8-4054-83ac-6fe6ab01dfd9.png)

