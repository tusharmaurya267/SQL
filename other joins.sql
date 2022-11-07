

-- USING keyword(use to join the two tables when column name is exactly same)
use sql_store;
SELECT o.order_id, c.first_name, sh.name AS shipper
FROM orders o
JOIN customers c
USING(customer_id)
LEFT JOIN shippers sh
USING(shipper_id);

-- it is useful when primary key is formed using two columns
USE sql_store;
SELECT *
FROM order_items oi
LEFT JOIN order_item_notes oin
-- ON oi.order_id = oin.order_Id
-- AND oi.product_id = oin.product_id;
USING(order_id , product_id);


-- return the date, client name, amount, payment method
USE sql_invoicing;
SELECT p.date, c.name AS client, p.amount, pm.name AS payment_method
FROM payments p
JOIN clients c USING(client_id)
JOIN payment_methods pm
ON p.payment_method=pm.payment_method_id;


-- NATURAL JOIN(use to join the table on the basis of same column name)
USE sql_store;
SELECT o.order_id, c.customer_id
FROM orders o
NATURAL JOIN customers c;


-- CROSS JOIN(exmaple to use is when you have 3 size and 5 colours so you will get the 15 tuples with all cross possible)
SELECT c.first_name AS name, p.name AS product
FROM customers c
CROSS JOIN products p
ORDER BY c.first_name;


-- UNION(to combine)
-- remember that the number of column to display(SELECT) should be same and same data type and column name on the basis of name in first SELECT
SELECT order_id, order_date, 'Active' AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT order_id, order_date, 'Passive' AS status
FROM orders
WHERE order_date < '2019-01-01';



