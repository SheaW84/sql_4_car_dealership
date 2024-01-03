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
