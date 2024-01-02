CREATE TABLE dealer_car (
	dealer_car_id SERIAL PRIMARY KEY, 
	make VARCHAR(100), 
	model VARCHAR(100), 
	_year NUMERIC(4),
	price NUMERIC(10,2)
)

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	laste_name VARCHAR(100)
)
	
CREATE TABLE customer (
	customer_id serial PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	billing_address VARCHAR(200)
)	

CREATE TABLE mechanic(
	mechanic_id serial PRIMARY KEY,
	first_name VARCHAR (100),
	last_name VARCHAR(100)
)


CREATE TABLE invoice(
	invoice_id serial PRIMARY KEY,
	dealer_car_id Integer NOT NULL,
	salesperson_id Integer NOT NULL,
	customer_id Integer NOT NULL,
	invoice_date DATE,
	total NUMERIC (11,2),
	FOREIGN KEY (dealer_car_id) REFERENCES dealer_car(dealer_car_id),
	FOREIGN KEY	(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
)

CREATE TABLE customer_car (
	customer_car_id serial PRIMARY KEY,
	customer_id integer NOT NULL,
	make varchar(100),
	model varchar(100),
	_year NUMERIC(4),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
)

CREATE TABLE service_ticket(
	service_ticket_id serial PRIMARY KEY,
	customer_car_id integer NOT NULL,
	mechanic_id integer NOT NULL,
	labor_date DATE,
	labor_price NUMERIC(5,2),
	parts_price NUMERIC(5,2),
	total NUMERIC(7,2),
	FOREIGN KEY (customer_car_id) REFERENCES customer_car(customer_car_id),
	FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)	
)

CREATE TABLE parts (
	part_id serial PRIMARY KEY,
	service_ticket_id integer,
	part_name VARCHAR(100),
	manufacturer VARCHAR(100),
	manufacture_date DATE,
	price NUMERIC (6,2),
	FOREIGN KEY (service_ticket_id) REFERENCES service_ticket(service_ticket_id)
)

CREATE TABLE service_record (
	service_record_id serial PRIMARY KEY,
	customer_car_id Integer NOT NULL,
	FOREIGN KEY (customer_car_id) REFERENCES customer_car(customer_car_id)
)

CREATE TABLE service_history(
	service_history_id serial PRIMARY KEY,
	service_record_id Integer NOT NULL,
	FOREIGN KEY (service_record_id) REFERENCES service_record(service_record_id)
)



