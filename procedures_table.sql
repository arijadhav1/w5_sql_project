
CREATE OR REPLACE PROCEDURE PartData
(
	parts_id INTEGER,
	part_name VARCHAR(50),
	price NUMERIC
)

LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO parts
	VALUES (parts_id, part_name, price);
	
	COMMIT;
END;
$$

CALL PartData(1, 'Wheels', 109.99)
CALL PartData(2, 'Engine', 2599.99)
CALL PartData(3, 'Headlights', 159.99)
CALL PartData(4, 'Brakepads', 399.99)

CALL *
FROM parts


CREATE OR REPLACE PROCEDURE SalespersonData
(
	salesperson_id integer,
 	first_name VARCHAR(100),
  	last_name VARCHAR(100),
  	phone_number VARCHAR(20),
  	email VARCHAR(100),
  	cars_sold integer
)

LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO salesperson
	VALUES (salesperson_id, first_name, last_name, phone_number, email, cars_sold);
	
	COMMIT;
END;
$$

CALL SalespersonData(1, 'Mark', 'Jones', '123-456-7890', 'markjones@gmail.com', 17)
CALL SalespersonData(2, 'Henry', 'David', '143-356-7670', 'henrydavid@gmail.com', 153)
CALL SalespersonData(3, 'John', 'Smith', '983-463-7680', 'markjones@gmail.com', 49)
CALL SalespersonData(4, 'Horace', 'Grant', '938-435-7008', 'markjones@gmail.com', 82)

CALL *
FROM salesperson


CREATE OR REPLACE PROCEDURE InventoryData
(
	inventory_id integer,
  	price numeric,
  	color VARCHAR(50),
  	year_ integer,
  	make VARCHAR(100),
  	model VARCHAR(100),
  	service_history VARCHAR(1000),
  	pre_owned boolean
)

LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO inventory
	VALUES (inventory_id, price, color, year_, make, model, service_history, pre_owned);
	
	COMMIT;
END;
$$

CALL InventoryData(1, 24999, 'gold', 2018, 'Toyota', 'Prius', 'Tires Changed, Oil Changed', True)
CALL InventoryData(2, 9999, 'blue', 2009, 'BMW', '328i', 'Engine Replaced, Tinted Windows', True)
CALL InventoryData(3, 13999, 'grey', 2014, 'Honda', 'Odyssey', 'Brakepads Replaced', False)
CALL InventoryData(4, 59999, 'yellow', 2021, 'BMW', 'M3', 'N/A', False)


CREATE OR REPLACE PROCEDURE CustomerData
(
	customer_id integer,
  	first_name VARCHAR(100),
  	last_name VARCHAR(100),
  	email VARCHAR(100),
  	phone_number VARCHAR(20)
)

LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customer
	VALUES (customer_id, first_name, last_name, email, phone_number);
	
	COMMIT;
END;
$$

CALL CustomerData(1, 'Gabe', 'Dave', 'gabedave@gmail.com', '655-242-8537')
CALL CustomerData(2, 'David', 'Winter', 'davidwinter@gmail.com', '784-683-8977')
CALL CustomerData(3, 'Tom', 'Brady', 'tombrady@gmail.com', '302-967-0734')
CALL CustomerData(4, 'Tiger', 'Woods', 'tigerwoods@gmail.com', '583-463-0056')


CREATE OR REPLACE PROCEDURE ServiceData
(
	service_id integer,
  	service_provided VARCHAR(100),
  	price numeric
)

LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service
	VALUES (service_id, service_provided, price);
	
	COMMIT;
END;
$$

CALL ServiceData(1, 'Oil Change', 24.99);
CALL ServiceData(2, 'Tire Rotation', 149.99);
CALL ServiceData(3, 'Oil Change', 24.99);
CALL ServiceData(4, 'Brakepad Replacement', 89.99);


CREATE OR REPLACE PROCEDURE MechanicData
(
	mechanic_id integer,
  	first_name VARCHAR(100),
  	last_name VARCHAR(100),
  	price numeric
)

LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO mechanic
	VALUES (mechanic_id, first_name, last_name, price);
	
	COMMIT;
END;
$$

CALL MechanicData(1, 'Mech', 'One', 49.99)
CALL MechanicData(2, 'Two', 'Mech', 39.99)
CALL MechanicData(3, 'Three', 'Mechanic', 59.99)
CALL MechanicData(4, 'Mechanic', 'Four', 29.99)


CREATE OR REPLACE PROCEDURE CarData
(
	car_id integer,
  	color VARCHAR(50),
  	year_ integer,
  	make VARCHAR(100),
  	model VARCHAR(100),
  	service_history boolean,
	customer_id integer
)

LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO car
	VALUES (car_id, color, year_, make, model, service_history, customer_id);
	
	COMMIT;
END;
$$

CALL CarData(1, 'yellow', 2022, 'BMW', 'i4', True, 1)
CALL CarData(2, 'black', 2017, 'Toyota', 'Camry', True, 1)
CALL CarData(3, 'blue', 2002, 'Honda', 'Civic', False, 1)
CALL CarData(4, 'grey', 2023, 'Audi', 'Q8', False, 1)


CREATE OR REPLACE PROCEDURE ServInvData
(
	mec_service_id integer,
  	total_price numeric,
  	mechanic_id integer,
  	parts_id integer,
  	service_id integer,
	car_id integer
)

LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_invoice
	VALUES (mec_service_id, total_price, mechanic_id, parts_id, service_id, car_id);
	
	COMMIT;
END;
$$

CALL ServInvData(1, 359.99, 1, 1, 1, 1)
CALL ServInvData(2, 2599.99, 2, 2, 2, 2)
CALL ServInvData(3, 1299.99, 3, 3, 3, 3)
CALL ServInvData(4, 789.99, 4, 4, 4, 4)


CREATE OR REPLACE PROCEDURE SaleInvData
(
	s_invoice_id integer,
  	customer_id integer,
  	inventory_id integer,
  	salesperson_id integer
)

LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO sales_invoice
	VALUES (s_invoice_id, customer_id, inventory_id, salesperson_id);
	
	COMMIT;
END;
$$

CALL SaleInvData(1, 1, 1, 1)
CALL SaleInvData(2, 2, 2, 2)
CALL SaleInvData(3, 3, 3, 3)
CALL SaleInvData(4, 4, 4, 4)

CALL *
from sales_invoice