DECLARE temp NUMBER;
BEGIN
    SELECT COUNT(*) INTO temp FROM JOB_CODE WHERE JOB_CODE = 'AA000';
    IF temp = 0 THEN 
    INSERT INTO JOB_CODE (JOB_CODE,JOB_TITLE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
        VALUES ('AA000','DEFAULT','admin',SYSDATE,SYS_GUID(),1);
    END IF;
END;
/

UPDATE TBN SET JOB_CODE = 'AA000' WHERE TBN_ID = '1'
/
UPDATE TBN SET JOB_CODE = 'AA000' WHERE TBN_ID = '2'
/
UPDATE TBN SET JOB_CODE = 'AA000' WHERE TBN_ID = '3'
/
UPDATE TBN SET JOB_CODE = 'AA000' WHERE TBN_ID = '4'
/
UPDATE TBN SET JOB_CODE = 'AA000' WHERE TBN_ID = '5'
/
UPDATE TBN SET JOB_CODE = 'AA000' WHERE TBN_ID = '6'
/
