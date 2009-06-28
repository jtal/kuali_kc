-- Table Script 
CREATE TABLE PROPOSAL_COMMENTS ( 
    PROPOSAL_COMMENTS_ID NUMBER(12,0) NOT NULL, 
    PROPOSAL_ID NUMBER(12,0) NOT NULL, 
    PROPOSAL_NUMBER VARCHAR2(8) NOT NULL, 
    SEQUENCE_NUMBER NUMBER(4,0) NOT NULL, 
    COMMENT_TYPE_CODE VARCHAR2(3) NOT NULL, 
    COMMENTS CLOB, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);


-- Primary Key Constraint 
ALTER TABLE PROPOSAL_COMMENTS 
ADD CONSTRAINT PK_PROPOSAL_COMMENTS 
PRIMARY KEY (PROPOSAL_COMMENTS_ID);

-- *************** UNIQUE CONSTRAINT DEFINED FOR COMPOSITE KEY COLUMNS ************ 
ALTER TABLE PROPOSAL_COMMENTS 
ADD CONSTRAINT UQ_PROPOSAL_COMMENTS 
UNIQUE (PROPOSAL_NUMBER, SEQUENCE_NUMBER, COMMENT_TYPE_CODE);

