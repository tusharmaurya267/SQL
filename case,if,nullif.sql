-- CASE
-- USE as a switch statement

SELECT p.personid, p.city, 
CASE p.personid
	WHEN 1 THEN 'Cool Stuff' 
	WHEN 2 THEN "Futuristic WHEN 123" 
	WHEN 32 THEN 'Something else' 
	ELSE CONCAT( "PERSON ID: " , p.personid)
END AS info
FROM PERSONS AS p;


-- IF STATEMENT

SELECT firstname , lastname , 
IF(p.personid=1 , "GOOD PERSON", NULL ) AS quality_person 
FROM persons AS p;


-- NULLIF

SELECT firstname , lastname , 
NULLIF(p.personid , 2 ) AS quality_person 
FROM persons AS p;

