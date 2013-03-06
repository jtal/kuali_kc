DELIMITER /

INSERT INTO SUBMISSION_STATUS (SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR)
	VALUES (405, 'Rejected In Routing', NOW(), 'admin', UUID(), 1)
/

INSERT INTO IACUC_SUBMISSION_STATUS (SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR)
	VALUES (401, 'Rejected In Routing', NOW(), 'admin', UUID(), 1)
/

DELIMITER ;
