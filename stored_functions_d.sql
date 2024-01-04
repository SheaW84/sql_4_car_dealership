--Stored Functions to insert data into dealer_car table.
CREATE OR REPLACE FUNCTION add_dealer_car (_dealer_car_id INTEGER,_make VARCHAR, _model VARCHAR, __year NUMERIC, _price NUMERIC)
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
SELECT * FROM dealer_car


--Stored function to insert data into salesperson table
CREATE OR REPLACE FUNCTION add_salesperson (_salesperson_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
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
SELECT * FROM salesperson

--Add customer function
CREATE OR REPLACE FUNCTION add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _billing_address VARCHAR )
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
SELECT * FROM customer

--Add invoice function
CREATE OR REPLACE FUNCTION add_invoice(_invoice_id INTEGER, _dealer_car_id INTEGER, _salesperson_id INTEGER, _customer_id INTEGER, _invoice_date DATE, _total NUMERIC)
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
SELECT * FROM invoice








