
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
WHERE client_id IN (
SELECT client_id 
FROM clients 
WHERE state IN('CA','NY'));


-- DELETE KEYWORD
-- DELETE invoices 
-- SET payment_total =invoice_total*2, payment_date = due_date
-- WHERE client_id IN (
-- SELECT client_id 
-- FROM clients 
-- WHERE state IN('CA','NY'));


