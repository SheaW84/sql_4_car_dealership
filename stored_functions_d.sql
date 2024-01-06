--Stored Functions to insert data into dealer_car table.
CREATE OR REPLACE FUNCTION add_dealer_car (
	_dealer_car_id INTEGER,
	_make VARCHAR, 
	_model VARCHAR, 
	__year NUMERIC, 
	_price NUMERIC)
RETURNS void

AS $MAIN$
BEGIN	
	INSERT INTO dealer_car(dealer_car_id, make, model, _year, price)
	values(_dealer_car_id, _make, _model, __year, _price);
END;
$MAIN$
LANGUAGE plpgsql;

--Call of function for add_dealer_car
SELECT add_dealer_car(1, 'Chevrolet', 'Silverado 1500', '2022', '40000.00');
SELECT add_dealer_car(2, 'Chevrolet', 'Malibu', '2021', '35000.00');

--Verify car(s) have been added
--SELECT * FROM dealer_car


--Stored function to insert data into salesperson table
CREATE OR REPLACE FUNCTION add_salesperson(_salesperson_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS void

AS $main$
BEGIN
	INSERT INTO salesperson(salesperson_id, first_name, last_name)
	values(_salesperson_id,_first_name, _last_name );
END;
$main$
LANGUAGE plpgsql;


--NOTE TO INSTRUCTOR: In creating the table for the salesperson I made a mistake with the column name.
--I'm fixing it here
ALTER TABLE salesperson
RENAME COLUMN laste_name TO last_name;


--Call of function for add_salesperson
SELECT add_salesperson(1, 'Johnny','Bravo');
SELECT add_salesperson(2, 'Al','Harrington');

--Verify salesmen are added
--SELECT * FROM salesperson

--Add customer function
CREATE OR REPLACE FUNCTION add_customer(
	_customer_id INTEGER, 
	_first_name VARCHAR, 
	_last_name VARCHAR, 
	_billing_address VARCHAR )
RETURNS void

AS $MAIN$
BEGIN
	INSERT INTO customer(customer_id, first_name, last_name, billing_address)
	VALUES(_customer_id, _first_name, _last_name, _billing_address);
END;
$MAIN$
LANGUAGE plpgsql

--CALL add_customer
SELECT add_customer(1,'Peter','Griffin','31 Spooner Street, Quahog, RI');
SELECT add_customer(2,'Barbara','Pewterschmidt','None of your business, Newport, RI');

--Verify Customers
--SELECT * FROM customer

--Add invoice function
CREATE OR REPLACE FUNCTION add_invoice(
	_invoice_id INTEGER, 
	_dealer_car_id INTEGER, 
	_salesperson_id INTEGER, 
	_customer_id INTEGER, 
	_invoice_date DATE, 
	_total NUMERIC)
RETURNS void

AS $MAIN$
BEGIN	
	INSERT INTO invoice(invoice_id, dealer_car_id, salesperson_id, customer_id, invoice_date, total)
	values(_invoice_id, _dealer_car_id, _salesperson_id, _customer_id, _invoice_date, _total);
END;
$MAIN$
LANGUAGE plpgsql

--Calling add_invoice
SELECT add_invoice(1,1,1,1,TO_DATE('01-02-2024','mm-dd-yyyy'),41000.00);
SELECT add_invoice(2,2,2,2,TO_DATE('01-03-2024','mm-dd-yyyy'),36000.00);


--VERIFY invoice
--SELECT * FROM invoice

--add_customer_car function
CREATE OR REPLACE FUNCTION add_customer_car(
	_customer_car_id INTEGER, 
	_customer_id INTEGER, 
	_make VARCHAR, 
	_model VARCHAR, 
	__year NUMERIC) 
RETURNS void

AS $MAIN$
BEGIN
	INSERT INTO customer_car(customer_car_id, customer_id, make, model, _year)
	VALUES(_customer_car_id, _customer_id, _make, _model, __year);
END;
$MAIN$

LANGUAGE plpgsql

-- Calling add_customer_car
SELECT add_customer_car(1,1,'Honda','Civic','2012');
SELECT add_customer_car(2,2,'Rolls Royce','Phantom','2004');

-- Verify customer car
-- SELECT * FROM customer_car

-- add_mechanic function
CREATE OR REPLACE FUNCTION add_mechanic(_mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO mechanic(mechanic_id, first_name, last_name)
	VALUES(_mechanic_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql

-- calling add_mechanic
SELECT add_mechanic(1,'Joe','Gatto');
SELECT add_mechanic(156,'Sal','Volcano');

--Verify Mechanic
--SELECT * FROM mechanic

-- adding column description to table service_ticket
--ALTER TABLE service_ticket
--ADD service_description VARCHAR(255);


-- add_service_ticket
CREATE OR REPLACE FUNCTION add_service_ticket(
	_service_t_id INTEGER, 
	_customer_c_id INTEGER,
	_mechanic_id INTEGER, 
	_labor_date DATE, 
	_labor_price NUMERIC,
	_parts_price NUMERIC,
	_total NUMERIC,
	_service_d VARCHAR)
RETURNS void

AS $MAIN$
BEGIN
	INSERT INTO service_ticket(
		service_ticket_id, 
		customer_car_id, 
		mechanic_id, 
		labor_date, 
		labor_price, 
		parts_price, 
		total, 
		service_description)
	values(
	_service_t_id, 
	_customer_c_id,
	_mechanic_id, 
	_labor_date, 
	_labor_price,
	_parts_price,
	_total,
	_service_d );	
END;
$MAIN$
LANGUAGE plpgsql

--call add_service_ticket

SELECT add_service_ticket(1,1,1,TO_DATE('01-02-2024','mm-dd-yyyy'),55.00,0.00,55.00,'Maintenance Scan');
SELECT add_service_ticket(2,2,156,TO_DATE('01-02-2024','mm-dd-yyyy'),55.00,30.00,85.00,'Oil Pressure Sensor Replacement');

--Verify Service Ticket
--SELECT * FROM service_ticket

-- add_parts function

CREATE OR REPLACE FUNCTION add_parts(
	_part_id INTEGER, 
	_service_ticket_id INTEGER, 
	_part_name VARCHAR, 
	_manufacturer VARCHAR, 
	_manufacture_date DATE, 
	_price NUMERIC) 
RETURNS void
AS $MAIN$
BEGIN 
	INSERT INTO parts(part_id, service_ticket_id, part_name,manufacturer, manufacture_date, price)
	VALUES(_part_id, 
	_service_ticket_id, 
	_part_name, 
	_manufacturer, 
	_manufacture_date, 
	_price);
END;
$MAIN$
LANGUAGE plpgsql

--calling add_parts
SELECT add_parts(1,null,'Front and Rear Brake Kit','AutoShack', TO_DATE('01-02-2024','mm-dd-yyyy'),168.29);
SELECT add_parts(2,2,'Oil Pressure Sensor','Ronybuy',TO_DATE('01-02-2023','mm-dd-yyyy'),30.00);

--Verify parts
--SELECT * FROM parts


INSERT INTO service_record(
	service_record_id,
	customer_car_id)
	VALUES(
		1,
		1);

INSERT INTO service_record(
	service_record_id,
	customer_car_id)
	VALUES(
		2,
		2);
	
SELECT * FROM service_record


INSERT INTO service_history(
	service_history_id,
	service_record_id)
	VALUES(
		1,
		1);

INSERT INTO service_history(
	service_history_id,
	service_record_id)
	VALUES(
		2,
		2);
	
SELECT * FROM service_history
