CREATE TABLE car (
  car_id integer,
  color VARCHAR(50),
  year_ integer,
  make VARCHAR(100),
  model VARCHAR(100),
  service_history boolean,
  customer_id integer NOT NULL,
  PRIMARY KEY (car_id),
	FOREIGN KEY (customer_id)
      REFERENCES customer(customer_id)
	
);

CREATE TABLE parts (
  parts_id integer,
  part_name VARCHAR(50),
  price numeric,
  PRIMARY KEY (parts_id)
);

CREATE TABLE service_invoice (
  mec_service_id integer,
  total_price numeric,
  mechanic_id integer NOT NULL,
  parts_id integer NOT NULL,
  service_id integer NOT NULL,
  car_id integer NOT NULL,
  PRIMARY KEY (mec_service_id),
    FOREIGN KEY (mechanic_id)
      REFERENCES mechanic(mechanic_id),
    FOREIGN KEY (parts_id)
      REFERENCES parts(parts_id),
	FOREIGN KEY (service_id)
      REFERENCES service(service_id),
	FOREIGN KEY (car_id)
	  REFERENCES car(car_id)
);

CREATE TABLE salesperson (
  salesperson_id integer,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  phone_number VARCHAR(20),
  email VARCHAR(100),
  cars_sold integer,
  PRIMARY KEY (salesperson_id)
);

CREATE TABLE sales_invoice (
  s_invoice_id integer,
  customer_id integer NOT NULL,
  inventory_id integer NOT NULL,
  salesperson_id integer NOT NULL,
  PRIMARY KEY (s_invoice_id),
    FOREIGN KEY (customer_id)
      REFERENCES customer(customer_id),
	FOREIGN KEY (salesperson_id)
      REFERENCES salesperson(salesperson_id)
);

CREATE TABLE inventory (
  inventory_id integer,
  price numeric,
  color VARCHAR(50),
  year_ integer,
  make VARCHAR(100),
  model VARCHAR(100),
  service_history VARCHAR(1000),
  pre_owned boolean,
  PRIMARY KEY (inventory_id)
);

CREATE TABLE customer (
  customer_id integer,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(100),
  phone_number VARCHAR(20),
  PRIMARY KEY (customer_id)
);

CREATE TABLE service (
  service_id integer,
  service_provided VARCHAR(100),
  price numeric,
  PRIMARY KEY (service_id)
);

CREATE TABLE mechanic (
  mechanic_id integer,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  price numeric,
  PRIMARY KEY (mechanic_id)
);
