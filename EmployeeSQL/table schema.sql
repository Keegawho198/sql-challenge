-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/SCftjA
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Keegan Nair Using QuickDBD to make ERD and table code.
--Quick note also had to make some adjustments in python
--to change format for date columns in employee table as it was not properly changing in excel
--see readme for more details

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- SET datestyle = 'ISO, MDY';


CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);


-- ADD CSV FILES FIRST BEFORE ADDING FK CODE

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");



-- I forgot to add character limits, added below

-- Alter the departments Table:

ALTER TABLE "departments" 
ALTER COLUMN "dept_no" TYPE VARCHAR(10),
ALTER COLUMN "dept_name" TYPE VARCHAR(50);

--Alter the dept_emp Table:

ALTER TABLE "dept_emp" 
ALTER COLUMN "dept_no" TYPE VARCHAR(10);

--Alter the dept_manager Table:

ALTER TABLE "dept_manager" 
ALTER COLUMN "dept_no" TYPE VARCHAR(10);

--Alter the employees Table:

ALTER TABLE "employees" 
ALTER COLUMN "emp_title_id" TYPE VARCHAR(10),
ALTER COLUMN "first_name" TYPE VARCHAR(30),
ALTER COLUMN "last_name" TYPE VARCHAR(30),
ALTER COLUMN "sex" TYPE VARCHAR(1);

--NO Alter the salaries Table: (No changes needed here since there are no VARCHAR columns.)

--Alter the titles Table:

ALTER TABLE "titles" 
ALTER COLUMN "title_id" TYPE VARCHAR(10),
ALTER COLUMN "title" TYPE VARCHAR(60);

