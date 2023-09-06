-- Hashing, Compressing, and Encrypting 
-- COMPRESS( str) 
-- UNCOMPRESS( bin ) 
-- SHA2 (str, len) 224, 256, 384, 512 
-- HASHING 
-- UNHEX( hexstr number ) 
-- AES ENCRYPT( str, key_str ,[initial vector] ) 
-- AES_DECRYPT( crypt_str, key_str)

-- COMPRESSION

SELECT LENGTH(REPEAT ('abc-ABC', 100)) AS full_bytes, 
	LENGTH (COMPRESS( REPEAT('abc-ABC', 100))) AS comp_bytes; 

SET @comped = COMPRESS( REPEAT ('abc-ABC', 100)); 
SELECT LENGTH( UNCOMPRESS (@comped) );

ALTER TABLE persons
ADD COLUMN enc_pass varchar(200),
ADD COLUMN hash_pass varchar(200),
ADD COLUMN compress_pass varchar(200);

ALTER TABLE persons
MODIFY COLUMN enc_pass varbinary(50),
MODIFY COLUMN compress_pass varbinary(50);

-- HASHING and ENCRYPTION

-- Difference between hashing and encrytion is that. 
-- You can get back original string or value in encryption using decrypt function but in hashing you cannot.

SET @mykeystr= "Captain UnderpantsMYSALTVALUE" ; 
SET @shahex = SHA2 (@mykeystr, 512); -- 128 characters 
SET @key = UNHEX(@shahex); 
UPDATE persons
SET 
compress_pass =COMPRESS( REPEAT('abc-ABC', 100) ),
hash_pass = SHA2 ('My password', 512), 
enc_pass=AES_ENCRYPT ("My password", @key) 
WHERE personid=2; 

SELECT hash_pass, compress_pass, enc_pass, AES_DECRYPT(enc_pass, @key) AS dec_pass
FROM persons
WHERE personid = 2;

