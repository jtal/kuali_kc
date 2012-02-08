CREATE TABLE IACUC_PROTOCOL_PMC (
  IACUC_PROTOCOL_PMC_ID NUMBER(12,0) NOT NULL,
  PERSON_MASS_CHANGE_ID NUMBER(12,0) NOT NULL,
  INVESTIGATOR          CHAR(1) DEFAULT 'N' NOT NULL,
  KEY_STUDY_PERSON      CHAR(1) DEFAULT 'N' NOT NULL,
  CORRESPONDENTS        CHAR(1) DEFAULT 'N' NOT NULL,
  UPDATE_USER           VARCHAR2(60) NOT NULL, 
  UPDATE_TIMESTAMP      DATE NOT NULL, 
  OBJ_ID                VARCHAR2(36) NOT NULL,
  VER_NBR               NUMBER(8,0) DEFAULT 1 NOT NULL
)
/
ALTER TABLE IACUC_PROTOCOL_PMC ADD CONSTRAINT PK_IACUC_PROTOCOL_PMC
  PRIMARY KEY (IACUC_PROTOCOL_PMC_ID)
/