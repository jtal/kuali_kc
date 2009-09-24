 CREATE TABLE EPS_PROP_ABSTRACT
   (	"PROPOSAL_NUMBER" NUMBER(12,0) constraint EPS_PROP_ABSTRACTN1 NOT NULL ENABLE,
	"ABSTRACT_TYPE_CODE" VARCHAR2(3) constraint EPS_PROP_ABSTRACTN2 NOT NULL ENABLE,
	"ABSTRACT_DETAILS" CLOB constraint EPS_PROP_ABSTRACTN3 NOT NULL ENABLE,
	"UPDATE_TIMESTAMP" DATE constraint EPS_PROP_ABSTRACTN4 NOT NULL ENABLE,
	"UPDATE_USER" VARCHAR2(60) constraint EPS_PROP_ABSTRACTN5 NOT NULL ENABLE,
	"TIMESTAMP_DISPLAY" DATE,
	"USER_DISPLAY" VARCHAR2(60),
	 "VER_NBR" NUMBER(8,0) DEFAULT 1  constraint  EPS_PROP_ABSTRACTN6  NOT NULL ENABLE,
	"OBJ_ID" VARCHAR2(36) DEFAULT SYS_GUID()  constraint  EPS_PROP_ABSTRACTN7  NOT NULL ENABLE,
	CONSTRAINT "PK_EPS_PROP_ABSTRACT_KRA" PRIMARY KEY ("PROPOSAL_NUMBER", "ABSTRACT_TYPE_CODE") ENABLE
);
 ALTER TABLE EPS_PROP_ABSTRACT ADD (CONSTRAINT "FK_EPS_PROP_ABSTRACT_KRA" FOREIGN KEY ("PROPOSAL_NUMBER")
	  REFERENCES "EPS_PROPOSAL" ("PROPOSAL_NUMBER") );
 ALTER TABLE EPS_PROP_ABSTRACT ADD (CONSTRAINT "FK_EPS_PROP_ABSTRACT_TYPE_KRA" FOREIGN KEY ("ABSTRACT_TYPE_CODE")
	  REFERENCES "ABSTRACT_TYPE" ("ABSTRACT_TYPE_CODE") );