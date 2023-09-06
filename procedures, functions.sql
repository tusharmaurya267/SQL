
-- IN
DELIMITER &&  
CREATE PROCEDURE procedure1 (IN var1 int)
BEGIN    
    SELECT * FROM customers LIMIT var1;  
END &&  
DELIMITER ;   

CALL procedure1(2);


-- OUT
DELIMITER &&  
CREATE PROCEDURE procedure2 (OUT var1 int)
BEGIN    
    SELECT COUNT(*) INTO var1 FROM customers;
END &&  
DELIMITER ;   

CALL procedure2(@pre);
SELECT @pre;


-- INOUT
DELIMITER &&  
CREATE PROCEDURE procedure3 (INOUT var1 int)
BEGIN    
    SELECT phone INTO var1 FROM customers WHERE customer_id=var1;
END &&  
DELIMITER ;   

SET @pre=6;
CALL procedure3(@pre);
SELECT @pre;


DROP PROCEDURE procedure1;
DROP PROCEDURE procedure2;
DROP PROCEDURE procedure3;



-- FUNCTIONS

CREATE FUNCTION full_name (first_nm CHAR (20), last_nm CHAR(30)) 
RETURNS CHAR(55) DETERMINISTIC 
RETURN CONCAT(first_nm, " " , last_nm);

SELECT City , full_name(FirstName,LastName) AS full_name
FROM  persons;