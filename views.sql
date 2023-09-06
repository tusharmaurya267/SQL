USE sql_store;


CREATE VIEW name_view
AS
SELECT *
FROM customers
WHERE first_name LIKE "%b%";

CREATE VIEW my_views
AS
SELECT c.customer_id, o.order_id, first_name, last_name
FROM customers c
JOIN orders o
ON o.customer_id=c.customer_id;
