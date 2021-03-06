INSERT INTO WATERMARK (WATERMARK_ID, STATUS_CODE, WATERMARK_TEXT, WATERMARK_STATUS, FONT_SIZE, FONT_COLOUR, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID, UPDATE_USER, WATERMARK_TYPE)
VALUES (SEQ_WATERMARK_ID.NEXTVAL, '-1', 'INVALID', 'Y', '50', 'RED', SYSDATE, 0, SYS_GUID(),'admin','TEXT')
/
INSERT INTO WATERMARK (WATERMARK_ID, STATUS_CODE, WATERMARK_TEXT, WATERMARK_STATUS, FONT_SIZE, FONT_COLOUR, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID, UPDATE_USER, WATERMARK_TYPE)
VALUES (SEQ_WATERMARK_ID.NEXTVAL, '100', 'Pending/In Progress', 'Y', '50', 'DARKGRAY', SYSDATE, 0, SYS_GUID(),'admin','TEXT')
/
INSERT INTO WATERMARK (WATERMARK_ID, STATUS_CODE, WATERMARK_TEXT, WATERMARK_STATUS, FONT_SIZE, FONT_COLOUR, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID, UPDATE_USER, WATERMARK_TYPE)
VALUES (SEQ_WATERMARK_ID.NEXTVAL, '101', 'Submitted To IRB', 'Y', '50', 'DARKGRAY', SYSDATE, 0, SYS_GUID(),'admin','TEXT')
/
INSERT INTO WATERMARK (WATERMARK_ID, STATUS_CODE, WATERMARK_TEXT, WATERMARK_STATUS, FONT_SIZE, FONT_COLOUR, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID, UPDATE_USER, WATERMARK_TYPE)
VALUES (SEQ_WATERMARK_ID.NEXTVAL, '102', 'Specific Minor Revisions Required', 'Y', '50', 'DARKGRAY', SYSDATE, 0, SYS_GUID(),'admin','TEXT')
/
INSERT INTO WATERMARK (WATERMARK_ID, STATUS_CODE, WATERMARK_TEXT, WATERMARK_STATUS, FONT_SIZE, FONT_COLOUR, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID, UPDATE_USER, WATERMARK_TYPE)
VALUES (SEQ_WATERMARK_ID.NEXTVAL, '103', 'Defered', 'Y', '50', 'DARKGRAY', SYSDATE, 0, SYS_GUID(),'admin','TEXT')
/
INSERT INTO WATERMARK (WATERMARK_ID, STATUS_CODE, WATERMARK_TEXT, WATERMARK_STATUS, FONT_SIZE, FONT_COLOUR, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID, UPDATE_USER, WATERMARK_TYPE)
VALUES (SEQ_WATERMARK_ID.NEXTVAL, '104', 'Substantive Revisions Required', 'Y', '50', 'DARKGRAY', SYSDATE, 0, SYS_GUID(),'admin','TEXT')
/
INSERT INTO WATERMARK (WATERMARK_ID, STATUS_CODE, WATERMARK_TEXT, WATERMARK_STATUS, FONT_SIZE, FONT_COLOUR, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID, UPDATE_USER, WATERMARK_TYPE)
VALUES (SEQ_WATERMARK_ID.NEXTVAL, '200', 'Approved', 'Y', '50', 'DARKGRAY', SYSDATE, 0, SYS_GUID(),'admin','TEXT')
/
INSERT INTO WATERMARK (WATERMARK_ID, STATUS_CODE, WATERMARK_TEXT, WATERMARK_STATUS, FONT_SIZE, FONT_COLOUR, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID, UPDATE_USER, WATERMARK_TYPE)
VALUES (SEQ_WATERMARK_ID.NEXTVAL, '304', 'Withdrawn', 'Y', '50', 'DARKGRAY', SYSDATE, 0, SYS_GUID(),'admin','TEXT')
/
INSERT INTO WATERMARK (WATERMARK_ID, STATUS_CODE, WATERMARK_TEXT, WATERMARK_STATUS, FONT_SIZE, FONT_COLOUR, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID, UPDATE_USER, WATERMARK_TYPE)
VALUES (SEQ_WATERMARK_ID.NEXTVAL, '305', 'Expired', 'Y', '50', 'DARKGRAY', SYSDATE, 0, SYS_GUID(),'admin','TEXT')
/
INSERT INTO WATERMARK (WATERMARK_ID, STATUS_CODE, WATERMARK_TEXT, WATERMARK_STATUS, FONT_SIZE, FONT_COLOUR, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID, UPDATE_USER, WATERMARK_TYPE)
VALUES (SEQ_WATERMARK_ID.NEXTVAL, '306', 'Withdrawn', 'Y', '50', 'DARKGRAY', SYSDATE, 0, SYS_GUID(),'admin','TEXT')
/
commit
/
