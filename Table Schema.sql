﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/SFOSR1
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE Department (
    -- DepartmentID  int identity
    Dept_No varchar(5)   NOT NULL,
    Dept_Name varchar(25)   NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (
        Dept_No
     )
);

CREATE TABLE Dept_Emp (
    -- DeptEmpID int identity PK
    Emp_No int   NOT NULL,
    Dept_No varchar(5)   NOT NULL,
    From_Date date   NOT NULL,
    To_Date date   NOT NULL
);

CREATE TABLE Dept_Manager (
    -- DeptManagerID int identity PK
    Dept_No varchar(5)   NOT NULL,
    Emp_No int   NOT NULL,
    From_Date date   NOT NULL,
    To_Date date   NOT NULL
);

CREATE TABLE Employees (
    -- EmployeeID int identity
    Emp_No int   NOT NULL,
    Birth_Date date   NOT NULL,
    First_name varchar(50)   NOT NULL,
    Last_name varchar(50)   NOT NULL,
    Gender varchar(1)   NOT NULL CHECK(Gender IN ('M','F')),
    Hire_Date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_No
     )
);

CREATE TABLE Salaries (
    -- SalaryID int identity PK
    Emp_No int   NOT NULL,
    Salary money   NOT NULL,
    From_Date date   NOT NULL,
    To_Date date   NOT NULL
);

CREATE TABLE Titles (
    -- TitleID int identity PK
    Emp_No int   NOT NULL,
    Title varchar(50)   NOT NULL,
    From_Date date   NOT NULL,
    To_Date date   NOT NULL
);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_Dept_No FOREIGN KEY(Dept_No)
REFERENCES Department (Dept_No);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Dept_No FOREIGN KEY(Dept_No)
REFERENCES Department (Dept_No);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);
