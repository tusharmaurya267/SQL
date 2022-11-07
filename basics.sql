

-- Syntax of SQL QUERIES
USE sql_store;
SELECT *
FROM customers
WHERE customer_id=1
ORDER BY first_name ;


-- how to add a column  
SELECT first_name, last_name, points, points*(10+100) AS 'new point'
FROM customers;


-- how to name it
SELECT first_name, last_name, points, points*(10+100) AS 'new point'
FROM customers;


-- distinct keyword
SELECT distinct state
FROM customers;


--  RELATIONAL operator(< , > , <= , >= , = , !=)
SELECT *
FROM customers
WHERE state != 'va';


-- To get elemnts born after 1990-01-01 
SELECT *
FROM customers
WHERE birth_date > '1990-01-01';


-- To get orders placed in 2019 year
SELECT *
FROM orders
WHERE order_date >= '2019-01-01';


-- LOGICAL operator( AND(&&) , OR(||) , NOT(!) )
SELECT *
FROM customers
WHERE NOT(birth_date > '1990-01-01' OR (points > 1000 AND state ='VA'));


-- IN operator (return customers who are in state 'va' , 'fl' , 'ga')
SELECT *
FROM CUSTOMERS
WHERE state IN('va' , 'fl' , 'ga');


-- NOT IN (return customers who are not in state 'va' , 'fl' , 'ga')
 SELECT *
FROM CUSTOMERS
WHERE state NOT IN('va' , 'fl' , 'ga');


-- BETWEEN AND ( customers born between 1/1/1990 and 1/1/2000 )
SELECT * 
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';


-- LIKE operator 
-- (_) single character  
-- (%) to represent any number of character 
SELECT *
FROM customers
WHERE last_name LIKE '%a_';


-- customer whose address contain 'TRAIL' or 'AVENUE' and phone number not end with '9'
SELECT *
FROM customers
WHERE address LIKE ('%TRAIL%' OR '%AVENUE%') AND phone NOT LIKE '&9';



-- REGEX 'e' (complex way of using Like operator) 
-- (^) start
-- ($) end
-- (|) logical OR
-- [abcd] containg
-- [a-h] range
-- customer whose name end with 'field' or end with 'gey' and contain 'rose' and start with 'do'
SELECT *
FROM customers
WHERE last_name REGEXP 'field$|mac|rose|^do';


-- returns last_name containing with 'ge' , 'ie' , 'me'
SELECT *
FROM customers
WHERE last_name REGEXP '[g|i|m]e' ;


-- return last_name containing 'e' but before that anything range from 'a-j'
SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e' ;


-- NOT NULL operator
SELECT *
FROM customers
WHERE phone IS NOT NULL;


-- NULL operator
SELECT *
FROM orders
WHERE shipped_id IS NULL;


-- ORDER BY
SELECT *
FROM customers
ORDER BY state DESC, first_name DESC;


-- ALIAS
SELECT *, quantity*unit_price AS total_price
FROM order_items
ORDER BY total_price DESC;


-- LIMIT
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;






-- Count keyword 
SELECT COUNT(customer_id) AS 'ANSWER'
FROM customers
WHERE birth_date > '1990-01-01';


-- 