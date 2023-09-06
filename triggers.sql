
-- INSERT
CREATE TRIGGER new_trg1
BEFORE INSERT
ON customers
FOR EACH ROW
SET NEW.points=50;


INSERT INTO customers VALUES (15,'oggee','Brushy','1980-07-13','804-978-9234','14187 Commercial Trail','Hampton','KO',9);

DELETE from customers 
WHERE customer_id=15;




DELIMITER $$
CREATE TRIGGER new_trg2
AFTER INSERT
ON customers
FOR EACH ROW
BEGIN
	IF NEW.birth_date IS NULL THEN
        DELETE from customers
        WHERE customer_id=NEW.customer_id;
	END IF;

END$$
DELIMITER ;


INSERT INTO customers VALUES (15,'oggee','Brushy',NULL,'804-978-9234','14187 Commercial Trail','Hampton','KO',9);



-- UPDATE
CREATE TRIGGER new_trg3
BEFORE UPDATE
ON customers
FOR EACH ROW
SET NEW.state=lower(NEW.state);


CREATE TRIGGER new_trg4
AFTER UPDATE
ON customers
FOR EACH ROW
SET NEW.state=lower(NEW.state);




DROP TRIGGER IF EXISTS new_trg1;
DROP TRIGGER IF EXISTS new_trg2;
DROP TRIGGER IF EXISTS new_trg3;
DROP TRIGGER IF EXISTS new_trg4;