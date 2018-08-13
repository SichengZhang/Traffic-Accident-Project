USE [Traffic accidents]
--Encrpytion CardNumber for Driver
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'p@ssw0rd'

CREATE CERTIFICATE Insurance  
   WITH SUBJECT = 'Driver Credit Card Numbers';  
GO  

CREATE SYMMETRIC KEY CreditCards_Key11  
    WITH ALGORITHM = AES_256  
    ENCRYPTION BY CERTIFICATE Insurance;  
GO  
ALTER TABLE Driver  
    ADD CardNumber_Encrypted varbinary(128); 
OPEN SYMMETRIC KEY CreditCards_Key11  
   DECRYPTION BY CERTIFICATE Insurance; 
    
UPDATE [dbo].[Driver] 
SET CardNumber_Encrypted = EncryptByKey(Key_GUID('CreditCards_Key11')  
    , CardNumber, 1, HashBytes('SHA1', CONVERT( varbinary  
    , DriverID))); 

-- Verify the encryption.  
/*OPEN SYMMETRIC KEY CreditCards_Key11  
   DECRYPTION BY CERTIFICATE Insurance;  
GO  


SELECT CardNumber, CardNumber_Encrypted   
    AS 'Encrypted card number', CONVERT(nvarchar,  
    DecryptByKey(CardNumber_Encrypted, 1 ,   
    HashBytes('SHA1', CONVERT(varbinary, DriverID))))  
    AS 'Decrypted card number' FROM Driver;  
GO  
*/

DROP SYMMETRIC KEY  CreditCards_Key11;
DROP CERTIFICATE Insurance;
DROP MASTER KEY;