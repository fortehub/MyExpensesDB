USE master; 
GO

CREATE DATABASE MyExpensesDB
ON PRIMARY (
NAME = 'MyExpensesDB',
FILENAME = 'D:\MSSQL\DataLogs\MyExpensesDB.mdf',
SIZE = 1024MB, MAXSIZE = UNLIMITED, FILEGROWTH = 64MB)
LOG ON (
NAME = 'MyExpensesDB_log',
FILENAME = 'D:\MSSQL\DataLogs\MyExpensesDB_log.mdf',
SIZE = 64MB, MAXSIZE = UNLIMITED, FILEGROWTH = 64MB);