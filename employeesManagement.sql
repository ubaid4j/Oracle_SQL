drop table "SYSTEM"."REGIONS"; 
CREATE TABLE regions
(
    region_id INT PRIMARY KEY,
    region_name VARCHAR(255)
);
drop table "SYSTEM"."countries"; 
create table countries
(
    country_id int primary key,
    country_name varchar(255),
    region_id int,
    constraint fk_cout_reg foreign key (countries) REFERENCES regions(region_id)
);
drop table "SYSTEM"."locations"; 
create table locations
(
    location_id int primary key,
    street_address varchar(255),
    postal_code int,
    city varchar(255),
    state_province varchar(255),
    country_id int,
    constraint fk_loc_country foreign key(country_id) references countries(country_id)
);
drop table "SYSTEM"."jobs"; 
create table jobs
(
    job_id int primary key,
    job_title varchar(255),
    min_salary int,
    max_salary int
);
drop table "SYSTEM"."departments"; 
create table departments
(
    department_id int primary key,
    department_name varchar(255),
    manager_id int,
    location_id int,
    constraint fk_dept_loc foreign key(locations) references locations(location_id)
);
drop table "SYSTEM"."employees"; 
create table employees
(
    employee_id int primary key,
    first_name varchar(255),
    last_nmae varchar(255),
    email varchar(255),
    phone_number varchar(255),
    hire_date date,
    job_id int,
    salary int,
    commision_pct int,
    manager_id int,
    department_id int,
    constraint fk_employees_job foreign key(job_id) references jobs(job_id),
    constraint fk_emp_dept foreign key(deparment_id) references departments(department_id)
    
);
drop table "SYSTEM"."job_history"; 
create table job_history
(
    employee_id int primary key,
    start_data date,
    end_date data,
    job_id int,
    department_id int,
    constraint fk_job_history_job foreign key (job_id) references jobs(job_id),
    constraint fk_job_history_emp foreign key (employee_id) references employees (employee_id),
    constraint fk_job_history_dept foreign key (department_id) REFERENCES ddepartments(department_id)
);