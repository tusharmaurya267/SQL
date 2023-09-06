-- CREATION

CREATE TABLE Persons (
    PersonID int ,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
INSERT INTO Persons(PersonID,LastName,FirstName,Address,City)
values(1,	'Hansen',	'Ola',	'Timoteivn'	,'Sandnes'),
(2,	'Svendson',	'Tove',	'Borgvn', 'Sandnes' ),
(3,	'Pettersen'	,'Kari'	,'Storgt' ,'Stavanger');



-- INSERTION
INSERT INTO customers
VALUES(default, 'John' , 'Smith','1990-01-01',NULL,'address', 'city', 'CA', default);

-- INSERTION without defing NULL or default
INSERT INTO customers(first_name, last_name, birth_date, address, city, state)
VALUES('Laura' , 'Rose' , '1990-01-01' , 'address' , 'city' , 'CA');


-- INSERTING MULTIPLE ROWS
INSERT INTO shippers(name)
VALUES('Shipper1'),('Shipper2'),('Shipper3');


INSERT INTO products(name,quantity_in_stock,unit_price)
VALUES('Product1' , 10 , 1.95),
('Product2' , 12 , 1.95),
('Product3' , 13 , 1.95);


-- INSERTION INTO HIERARCHICAL ROWS
INSERT INTO orders(customer_id, order_date, status)
VALUES(1, '2019-01-02' , 1);

-- 'last_insert_id()' fetch the last id
INSERT INTO order_items
VALUES (last_insert_id(), 1 , 1, 2.95),
(last_insert_id(), 2 , 1, 3.95);

-- COPY THE TABLE
CREATE TABLE orders_archieved AS
SELECT * FROM orders;

-- COPY THE TABLE ON CONDITION
INSERT INTO orders_archieved 
SELECT * 
FROM orders 
WHERE order_date < '2019-01-01';


-- CREATE 
USE sql_invoicing;
CREATE TABLE invoices_archived AS
SELECT i.invoice_id, i.number, c.name AS client, i.payment_total, i.invoice_date, i.payment_date, i.due_date
FROM invoices i
JOIN clients c
USING (client_id)
WHERE payment_date IS NOT NULL;




-- UPDATE
UPDATE invoices
SET payment_total =10, payment_date ='2019-03-01'
WHERE invoice_id=1;

UPDATE invoices
SET payment_total =DEFAULT, payment_date =default
WHERE invoice_id=1;

UPDATE invoices
SET payment_total =invoice_total*2, payment_date = due_date
WHERE invoice_id IN (3,4);


USE sql_store;
UPDATE customers
SET points =points+50
WHERE birth_date < '1990-01-01';



-- UPDATE USING SUBQUERY
USE sql_invoicing;
UPDATE invoices 
SET payment_total =invoice_total*2, payment_date = due_date
WHERE client_id IN (SELECT client_id 
					FROM clients 
					WHERE state IN('CA','NY'));




-- REPLACE
-- it is similar to UPDATE

REPLACE INTO products(product_id,name,quantity_in_stock,unit_price)
VALUES(14,'Product1' , 10 , 5.6);


-- ALTER

ALTER TABLE sql_store.persons
CHANGE COLUMN PersonID PersonID INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE sql_store.persons
ADD COLUMN country varchar(50);

ALTER TABLE sql_store.Persons
MODIFY COLUMN City varchar(100);

-- try inseting into person_id
INSERT INTO sql_store.`persons` (PersonID,LastName,FirstName,Address,City)
VALUES (NULL,'Elladine','Rising','Social Worker','KO');



-- INDEXING

ALTER TABLE customers
ADD INDEX idx_name(phone);

ALTER TABLE customers
ADD INDEX location(city,state);

DROP INDEX idx_name ON customers;
DROP INDEX location ON customers;


-- FOREIGN KEY

CREATE TABLE races ( 
	race_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	race_name VARCHAR(30) NOT NULL 
)ENGINE=INNODB; 
    
CREATE TABLE characters ( 
	character_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY Key, 
    character_name VARCHAR (50) NOT NULL, 
    race_id TINYINT UNSIGNED NOT NULL, 
    INDEX idx_race (race_id), 
    CONSTRAINT fk_character_race 
    FOREIGN KEY (race_id) 
    REFERENCES races (race_id) ON UPDATE CASCADE ON DELETE RESTRICT
    ) ENGINE=INNODB;

-- DELETE KEYWORD
-- DELETE invoices 
-- SET payment_total =invoice_total*2, payment_date = due_date
-- WHERE client_id IN (
-- SELECT client_id 
-- FROM clients 
-- WHERE state IN('CA','NY'));


