DELIMITER /
INSERT INTO IACUC_PROTO_ATTACHMENT_GROUP (GROUP_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR ) 
VALUES ( 1, 'Protocol Attachments', NOW(), 'admin', UUID(), 1 ) 
/
INSERT INTO IACUC_PROTO_ATTACHMENT_GROUP (GROUP_CD, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR ) 
VALUES ( 2, 'Personnel Attachments', NOW(), 'admin', UUID(), 1 ) 
/
DELIMITER ;
