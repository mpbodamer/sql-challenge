-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/kvs8zk
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "department_number" VARCHAR   NOT NULL,
    "department_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "department_number"
     )
);

CREATE TABLE "department_employees" (
    "employee_number" INT   NOT NULL,
    "department_number" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "department_manager" (
    "department_number" VARCHAR   NOT NULL,
    "employee_number" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "employees" (
    "employee_number" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_number"
     )
);

CREATE TABLE "salaries" (
    "employee_number" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "titles" (
    "employee_number" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_department_number" FOREIGN KEY("department_number")
REFERENCES "departments" ("department_number");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_department_number" FOREIGN KEY("department_number")
REFERENCES "departments" ("department_number");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

