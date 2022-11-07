
-- INNER JOIN

use sql_store;
SELECT * 
FROM orders AS o
INNER JOIN customers AS c
ON o.customer_id=c.customer_id;


SELECT c.customer_id, o.order_id, first_name, last_name
FROM customers c
JOIN orders o
ON o.customer_id=c.customer_id;


SELECT order_id, p.product_id, quantity
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;


-- JOINING ACROSS DATABASE

SELECT *
FROM order_items oi
JOIN sql_inventory.products p
ON oi.product_id=p.product_id;


-- SELF JOIN
-- merge employee with their manager
USE sql_hr;
SELECT * 
FROM employees e
JOIN employees m
ON e.reports_to = m.employee_id;

-- same as above
SELECT e.employee_id, e.first_name, m.first_name AS manager
FROM employees e
JOIN employees m
ON e.reports_to = m.employee_id;


-- JOIN MORE THAN TWO TABLES
-- join the order table ,customer table, order status table to see the customer's placed order status
SELECT o.order_id, o.order_date, c.first_name, c.last_name, os.name AS status
FROM orders o
JOIN customers c
ON o.customer_id=c.customer_id
JOIN order_statuses os
ON o.status = os.order_status_id
ORDER BY os.name , o.order_id ;


-- join the payment table, client table, payment_method table to see each payment of each client and payment method
USE sql_invoicing;
SELECT p.date, p.invoice_id, p.amount, c.name, pm.name AS payment_type
FROM payments p
JOIN clients c
ON p.client_id = c.client_id
JOIN payment_methods pm
ON p.payment_method = pm.payment_method_id;


-- COMPOUND JOIN CONDITIONS(superkey)
-- used when primary key is formed using two columns
USE sql_store;
SELECT *
FROM order_items oi
JOIN order_item_notes oin
ON oi.order_id = oin.order_Id
AND oi.product_id = oin.product_id;


-- IMPLICIT JOIN SYNTAX(AVOID USING)
SELECT *
FROM orders o, customers c
WHERE o.customer_id=c.customer_id;



-- OUTER JOIN

-- why to use outer join(the inner join won't be showing the values where order_id is null)
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id;


-- LEFT JOIN
-- customer table will be left table and order_id might be null
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- RIGHT JOIN
-- customer table will be right table and order_id might be null
SELECT c.customer_id, c.first_name, o.order_id
FROM orders o
RIGHT JOIN customers c
ON c.customer_id = o.customer_id
ORDER BY c.customer_id;


-- product table to order_items table
SELECT p.product_id, p.name, oi.quantity
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id;


-- OUTER JOIN BETWEEN MULITPLE TABLES
SELECT c.customer_id, c.first_name, o.order_id, sh.name AS shipper
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
ON o.shipper_id = sh.shipper_id 
ORDER BY c.customer_id;


-- order table with customer table which in turn with shipper table
SELECT o.order_id, o.order_date, c.first_name AS customer, sh.name AS shipper, os.name AS status
FROM orders o
JOIN customers c
ON o.customer_id=c.customer_id
LEFT JOIN shippers sh
ON sh.shipper_id=o.shipper_id
JOIN order_statuses AS os
ON o.status=os.order_status_id;


-- SELF OUTER JOIN
-- merge employee with their manager
USE sql_hr;
SELECT e.employee_id, e.first_name, m.first_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.reports_to = m.employee_id;


