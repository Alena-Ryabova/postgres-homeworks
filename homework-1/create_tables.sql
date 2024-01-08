-- SQL-команды для создания таблиц

CREATE TABLE customers_data
(
    customer_id varchar(100) PRIMARY KEY,
    company_name varchar(100) NOT NULL,
    contact_name varchar(100) NOT NULL
);


CREATE TABLE employees_data
(
    employee_id int PRIMARY KEY,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
	title varchar(100) NOT NULL,
	birth_date DATE NOT NULL,
	notes text
);


CREATE TABLE orders_data
(
    order_id int PRIMARY KEY,
    customer_id varchar(100) REFERENCES customers_data(customer_id) NOT NULL,
    employee_id int REFERENCES employees_data(employee_id) NOT NULL,
	order_date DATE NOT NULL,
	ship_city varchar(100) NOT NULL
);

