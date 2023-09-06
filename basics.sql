

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


-- DATE

SELECT curdate()-2;

SELECT DATE();



-- STRING

-- CONCAT
SELECT first_name , last_name , CONCAT(first_name , " " ,last_name) AS full_name
FROM customers;


-- SUBSTRING
SELECT first_name , last_name , LOWER(CONCAT(LEFT(birth_date,4) ,SUBSTRING(last_name,2,3))) AS id
FROM customers;


-- LENGTH 
SELECT first_name , last_name , CONCAT(LENGTH(first_name),RIGHT(birth_date,2)) as id1
FROM customers;


-- TRIM
SELECT ("   	 wings    ") as with_space , TRIM( ("   	 wings    ")) as space_removed;


-- UNION  /  UNION DISTINCT  /  UNION ALL

SELECT customer_id AS id, first_name AS first_name, city AS city 
FROM customers
WHERE customer_id <4
UNION
SELECT personid AS id, firstname AS fisrt_name, city AS city 
FROM persons
WHERE PersonID <4
LIMIT 50;


-- COMMIT & ROLLBACK


SELECT * FROM persons;

COMMIT;

UPDATE persons 
SET firstname="ROHAN"
WHERE personid=1;


UPDATE persons 
SET firstname="RAKESH"
WHERE personid=2;

ROLLBACK;



-- GROUP BY / HAVING
-- having is used with group by to add constraint to group by

SELECT *
FROM customers
GROUP BY city
HAVING points > 1000;




-- OVER clause
-- used for partition using any group in any column
SELECT c.*, SUM(points) OVER(PARTITION BY state) AS total_points
FROM customers AS c;



-- row number()
-- gives a sequetial number based on any column

SELECT row_number() OVER(ORDER BY city) as row_num,city
FROM customers;



-- Ranking

SELECT points, rank() OVER(ORDER BY points) as RANKS
FROM customers;

SELECT points, rank() OVER(range(2,10)) as RANKS
FROM customers;

-- SUB CATEGORY

SELECT order_id, 
(CASE WHEN status=1 THEN 1 ELSE 0 END) AS PAYMENT_DONE , 
(CASE WHEN status=2 THEN 1 ELSE 0 END) AS PAYMENT_PENDING
FROM orders;
