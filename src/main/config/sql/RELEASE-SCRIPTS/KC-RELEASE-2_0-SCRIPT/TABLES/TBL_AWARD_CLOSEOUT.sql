CREATE TABLE AWARD_CLOSEOUT ( 
    AWARD_CLOSEOUT_ID NUMBER(12,0) NOT NULL, 
    AWARD_ID NUMBER(22,0) NOT NULL, 
    AWARD_NUMBER VARCHAR2(12) NOT NULL, 
    SEQUENCE_NUMBER NUMBER(4,0) NOT NULL,
	CLOSEOUT_REPORT_CODE VARCHAR2(3) NOT NULL,
	CLOSEOUT_REPORT_NAME VARCHAR2(100) NOT NULL,
	DUE_DATE DATE,    
	FINAL_SUBMISSION_DATE DATE,
	MULTIPLE CHAR(1),
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2 (60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) NOT NULL);

ALTER TABLE AWARD_CLOSEOUT 
ADD CONSTRAINT PK_AWARD_CLOSEOUT 
PRIMARY KEY (AWARD_CLOSEOUT_ID);

