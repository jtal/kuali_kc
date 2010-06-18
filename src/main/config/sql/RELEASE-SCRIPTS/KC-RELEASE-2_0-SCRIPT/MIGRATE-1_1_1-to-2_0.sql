--Migrate Abstract Type items
UPDATE KCDBA.ABSTRACT_TYPE NAT
SET (DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.ABSTRACT_TYPE OAT
    WHERE OAT.ABSTRACT_TYPE_CODE = NAT.ABSTRACT_TYPE_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.ABSTRACT_TYPE NAT2
    WHERE NAT2.ABSTRACT_TYPE_CODE = NAT.ABSTRACT_TYPE_CODE
  ) ;
  
INSERT INTO KCDBA.ABSTRACT_TYPE (ABSTRACT_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT ABSTRACT_TYPE_CODE,
  DESCRIPTION,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.ABSTRACT_TYPE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.ABSTRACT_TYPE NAT
    WHERE OAT.ABSTRACT_TYPE_CODE = NAT.ABSTRACT_TYPE_CODE
  ) ;

  --Migrate Activity Type items
UPDATE KCDBA.ACTIVITY_TYPE NAT
SET (DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.ACTIVITY_TYPE OAT
    WHERE OAT.ACTIVITY_TYPE_CODE = NAT.ACTIVITY_TYPE_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.ACTIVITY_TYPE NAT2
    WHERE NAT2.ACTIVITY_TYPE_CODE = NAT.ACTIVITY_TYPE_CODE
  ) ;
  
INSERT INTO KCDBA.ACTIVITY_TYPE (ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT ACTIVITY_TYPE_CODE,
  DESCRIPTION,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.ACTIVITY_TYPE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.ACTIVITY_TYPE NAT
    WHERE OAT.ACTIVITY_TYPE_CODE = NAT.ACTIVITY_TYPE_CODE
  ) ;

--Migrate Appointment Type items
UPDATE KCDBA.APPOINTMENT_TYPE NAT
SET (DESCRIPTION, DURATION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      DURATION,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.APPOINTMENT_TYPE OAT
    WHERE OAT.APPOINTMENT_TYPE_CODE = NAT.APPOINTMENT_TYPE_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.APPOINTMENT_TYPE NAT2
    WHERE NAT2.APPOINTMENT_TYPE_CODE = NAT.APPOINTMENT_TYPE_CODE
  ) ;
  
INSERT INTO KCDBA.APPOINTMENT_TYPE (APPOINTMENT_TYPE_CODE, DESCRIPTION, DURATION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT ACTIVITY_TYPE_CODE,
  DESCRIPTION,
  DURATION,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.APPOINTMENT_TYPE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.APPOINTMENT_TYPE NAT
    WHERE OAT.APPOINTMENT_TYPE_CODE = NAT.APPOINTMENT_TYPE_CODE
  ) ;
  
--Migrate Budget Category Type items
UPDATE KCDBA.BUDGET_CATEGORY_TYPE NAT
SET (DESCRIPTION, SORT_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      SORT_ID,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.BUDGET_CATEGORY_TYPE OAT
    WHERE OAT.BUDGET_CATEGORY_TYPE_CODE = NAT.BUDGET_CATEGORY_TYPE_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.BUDGET_CATEGORY_TYPE NAT2
    WHERE NAT2.BUDGET_CATEGORY_TYPE_CODE = NAT.BUDGET_CATEGORY_TYPE_CODE
  ) ;
  
INSERT INTO KCDBA.BUDGET_CATEGORY_TYPE (BUDGET_CATEGORY_TYPE_CODE, DESCRIPTION, SORT_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT BUDGET_CATEGORY_TYPE_CODE,
  DESCRIPTION,
  SORT_ID,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.BUDGET_CATEGORY_TYPE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.BUDGET_CATEGORY_TYPE NAT
    WHERE OAT.BUDGET_CATEGORY_TYPE_CODE = NAT.BUDGET_CATEGORY_TYPE_CODE
  ) ;

--Migrate Budget Category Type items
UPDATE KCDBA.BUDGET_CATEGORY NAT
SET (DESCRIPTION, SORT_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      SORT_ID,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.BUDGET_CATEGORY OAT
    WHERE OAT.BUDGET_CATEGORY_CODE = NAT.BUDGET_CATEGORY_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.BUDGET_CATEGORY NAT2
    WHERE NAT2.BUDGET_CATEGORY_CODE = NAT.BUDGET_CATEGORY_CODE
  ) ;
  
INSERT INTO KCDBA.BUDGET_CATEGORY (BUDGET_CATEGORY_CODE, DESCRIPTION, SORT_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT BUDGET_CATEGORY_CODE,
  DESCRIPTION,
  SORT_ID,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.BUDGET_CATEGORY OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.BUDGET_CATEGORY NAT
    WHERE OAT.BUDGET_CATEGORY_CODE = NAT.BUDGET_CATEGORY_CODE
  ) ;

--Migrate Budget Category Mapping items
DELETE FROM KCDBA.BUDGET_CATEGORY_MAPPING;
  
INSERT INTO KCDBA.BUDGET_CATEGORY_MAPPING (MAPPING_NAME, TARGET_CATEGORY_CODE, COEUS_CATEGORY_CODE, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT MAPPING_NAME,
  TARGET_CATEGORY_CODE,
  COEUS_CATEGORY_CODE,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.BUDGET_CATEGORY_MAPPING OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.BUDGET_CATEGORY_MAPPING NAT
    WHERE OAT.MAPPING_NAME = NAT.MAPPING_NAME
      AND OAT.TARGET_CATEGORY_CODE = NAT.TARGET_CATEGORY_CODE
      AND OAT.COEUS_CATEGORY_CODE = NAT.COEUS_CATEGORY_CODE
  ) ;

--Migrate Budget Category Maps items
UPDATE KCDBA.BUDGET_CATEGORY_MAPS NAT
SET (DESCRIPTION, CATEGORY_TYPE, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      CATEGORY_TYPE,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.BUDGET_CATEGORY_MAPS OAT
    WHERE OAT.MAPPING_NAME = NAT.MAPPING_NAME
      AND OAT.TARGET_CATEGORY_CODE = NAT.TARGET_CATEGORY_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.BUDGET_CATEGORY_MAPS NAT2
    WHERE NAT2.MAPPING_NAME = NAT.MAPPING_NAME
      AND NAT2.TARGET_CATEGORY_CODE = NAT.TARGET_CATEGORY_CODE
  ) ;
  
INSERT INTO KCDBA.BUDGET_CATEGORY_MAPS (MAPPING_NAME, TARGET_CATEGORY_CODE, DESCRIPTION, CATEGORY_TYPE, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT MAPPING_NAME,
  TARGET_CATEGORY_CODE,
  DESCRIPTION,
  CATEGORY_TYPE,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.BUDGET_CATEGORY_MAPS OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.BUDGET_CATEGORY_MAPS NAT
    WHERE OAT.MAPPING_NAME = NAT.MAPPING_NAME
      AND OAT.TARGET_CATEGORY_CODE = NAT.TARGET_CATEGORY_CODE
  ) ;

--Migrate Budget Period Type items
UPDATE KCDBA.BUDGET_PERIOD_TYPE NAT
SET (DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.BUDGET_PERIOD_TYPE OAT
    WHERE OAT.BUDGET_PERIOD_TYPE_CODE = NAT.BUDGET_PERIOD_TYPE_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.BUDGET_PERIOD_TYPE NAT2
    WHERE NAT2.BUDGET_PERIOD_TYPE_CODE = NAT.BUDGET_PERIOD_TYPE_CODE
  ) ;
  
INSERT INTO KCDBA.BUDGET_PERIOD_TYPE (BUDGET_PERIOD_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT BUDGET_PERIOD_TYPE_CODE,
  DESCRIPTION,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.BUDGET_PERIOD_TYPE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.BUDGET_PERIOD_TYPE NAT
    WHERE OAT.BUDGET_PERIOD_TYPE_CODE = NAT.BUDGET_PERIOD_TYPE_CODE
  ) ;

--Migrate Budget Status items
UPDATE KCDBA.BUDGET_STATUS NAT
SET (DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.BUDGET_STATUS OAT
    WHERE OAT.BUDGET_STATUS_CODE = NAT.BUDGET_STATUS_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.BUDGET_STATUS NAT2
    WHERE NAT2.BUDGET_STATUS_CODE = NAT.BUDGET_STATUS_CODE
  ) ;
  
INSERT INTO KCDBA.BUDGET_STATUS (BUDGET_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT BUDGET_STATUS_CODE,
  DESCRIPTION,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.BUDGET_STATUS OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.BUDGET_STATUS NAT
    WHERE OAT.BUDGET_STATUS_CODE = NAT.BUDGET_STATUS_CODE
  ) ;

--Migrate Carrier Type items
UPDATE KCDBA.CARRIER_TYPE NAT
SET (DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.CARRIER_TYPE OAT
    WHERE OAT.CARRIER_TYPE_CODE = NAT.CARRIER_TYPE_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.CARRIER_TYPE NAT2
    WHERE NAT2.CARRIER_TYPE_CODE = NAT.CARRIER_TYPE_CODE
  ) ;
  
INSERT INTO KCDBA.CARRIER_TYPE (CARRIER_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT CARRIER_TYPE_CODE,
  DESCRIPTION,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.CARRIER_TYPE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.CARRIER_TYPE NAT
    WHERE OAT.CARRIER_TYPE_CODE = NAT.CARRIER_TYPE_CODE
  ) ;

--Migrate Cost Element items
UPDATE KCDBA.COST_ELEMENT NAT
SET (DESCRIPTION, BUDGET_CATEGORY_CODE, ON_OFF_CAMPUS_FLAG, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      BUDGET_CATEGORY_CODE,
      ON_OFF_CAMPUS_FLAG,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.COST_ELEMENT OAT
    WHERE OAT.COST_ELEMENT = NAT.COST_ELEMENT
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.COST_ELEMENT NAT2
    WHERE NAT2.COST_ELEMENT = NAT.COST_ELEMENT
  ) ;
  
INSERT INTO KCDBA.COST_ELEMENT (COST_ELEMENT, DESCRIPTION, BUDGET_CATEGORY_CODE, ON_OFF_CAMPUS_FLAG, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT COST_ELEMENT,
  DESCRIPTION,
  BUDGET_CATEGORY_CODE,
  ON_OFF_CAMPUS_FLAG,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.COST_ELEMENT OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.COST_ELEMENT NAT
    WHERE OAT.COST_ELEMENT = NAT.COST_ELEMENT
  ) ;

BEGIN
  UPDATE COST_ELEMENT (BUDGET_CATEGORY_CODE,DESCRIPTION,OBJ_ID,ON_OFF_CAMPUS_FLAG,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR)
  = ('37','Total Direct Cost for Proposal Hierarchy','482D3DCE4D4917A1E0404F8189D81CE1','N',TO_DATE( '20060501000000', 'YYYYMMDDHH24MISS' ),'KRADEV',1)
  WHERE COST_ELEMENT = 'PHTD01';
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    INSERT INTO COST_ELEMENT (BUDGET_CATEGORY_CODE,COST_ELEMENT,DESCRIPTION,OBJ_ID,ON_OFF_CAMPUS_FLAG,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR)
    VALUES ('37','PHTD01','Total Direct Cost for Proposal Hierarchy','482D3DCE4D4917A1E0404F8189D81CE1','N',TO_DATE( '20060501000000', 'YYYYMMDDHH24MISS' ),'KRADEV',1);
END;
/

BEGIN
  UPDATE COST_ELEMENT (BUDGET_CATEGORY_CODE,DESCRIPTION,OBJ_ID,ON_OFF_CAMPUS_FLAG,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR)
  = ('37','Total Indirect Cost for Proposal Hierarchy','482D3DCE4D4A17A1E0404F8189D81CE1','N',TO_DATE( '20060501000000', 'YYYYMMDDHH24MISS' ),'KRADEV',1)
  WHERE COST_ELEMENT = 'PHTID02';
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    INSERT INTO COST_ELEMENT (BUDGET_CATEGORY_CODE,COST_ELEMENT,DESCRIPTION,OBJ_ID,ON_OFF_CAMPUS_FLAG,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR)
    VALUES ('37','PHTID02','Total Indirect Cost for Proposal Hierarchy','482D3DCE4D4A17A1E0404F8189D81CE1','N',TO_DATE( '20060501000000', 'YYYYMMDDHH24MISS' ),'KRADEV',1);
END;
/

--Migrate Country Code items
UPDATE KCDBA.COUNTRY_CODE NAT
SET (COUNTRY_NAME, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT COUNTRY_NAME,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.COUNTRY_CODE OAT
    WHERE OAT.COUNTRY_CODE = NAT.COUNTRY_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.COUNTRY_CODE NAT2
    WHERE NAT2.COUNTRY_CODE = NAT.COUNTRY_CODE
  ) ;
  
INSERT INTO KCDBA.COUNTRY_CODE (COUNTRY_CODE, COUNTRY_NAME, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT COUNTRY_CODE,
  COUNTRY_NAME,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.COUNTRY_CODE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.COUNTRY_CODE NAT
    WHERE OAT.COUNTRY_CODE = NAT.COUNTRY_CODE
  ) ;

--Migrate Custom Attribute Data Type items
UPDATE KCDBA.CUSTOM_ATTRIBUTE_DATA_TYPE NAT
SET (DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.CUSTOM_ATTRIBUTE_DATA_TYPE OAT
    WHERE OAT.DATA_TYPE_CODE = NAT.DATA_TYPE_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.CUSTOM_ATTRIBUTE_DATA_TYPE NAT2
    WHERE NAT2.DATA_TYPE_CODE = NAT.DATA_TYPE_CODE
  ) ;
  
INSERT INTO KCDBA.CUSTOM_ATTRIBUTE_DATA_TYPE (DATA_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT DATA_TYPE_CODE,
  DESCRIPTION,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.CUSTOM_ATTRIBUTE_DATA_TYPE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.CUSTOM_ATTRIBUTE_DATA_TYPE NAT
    WHERE OAT.DATA_TYPE_CODE = NAT.DATA_TYPE_CODE
  ) ;

--Migrate Custom Attribute items
UPDATE KCDBA.CUSTOM_ATTRIBUTE NAT
SET (NAME, LABEL, DATA_TYPE_CODE, DATA_LENGTH, DEFAULT_VALUE, LOOKUP_CLASS, LOOKUP_RETURN, GROUP_NAME, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT NAME,
      LABEL,
      DATA_TYPE_CODE,
      DATA_LENGTH,
      DEFAULT_VALUE,
      LOOKUP_CLASS,
      LOOKUP_RETURN,
      GROUP_NAME,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.CUSTOM_ATTRIBUTE OAT
    WHERE OAT.ID = NAT.ID
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.CUSTOM_ATTRIBUTE NAT2
    WHERE NAT2.ID = NAT.ID
  ) ;
  
INSERT INTO KCDBA.CUSTOM_ATTRIBUTE (ID, NAME, LABEL, DATA_TYPE_CODE, DATA_LENGTH, DEFAULT_VALUE, LOOKUP_CLASS, LOOKUP_RETURN, GROUP_NAME, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT ID,
  NAME,
  LABEL,
  DATA_TYPE_CODE,
  DATA_LENGTH,
  DEFAULT_VALUE,
  LOOKUP_CLASS,
  LOOKUP_RETURN,
  GROUP_NAME,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.CUSTOM_ATTRIBUTE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.CUSTOM_ATTRIBUTE NAT
    WHERE OAT.ID = NAT.ID
  ) ;

--Migrate Custom Attribut Document items
UPDATE KCDBA.CUSTOM_ATTRIBUTE_DOCUMENT NAT
SET (TYPE_NAME, IS_REQUIRED, ACTIVE_FLAG, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT TYPE_NAME,
      IS_REQUIRED,
      ACTIVE_FLAG,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.CUSTOM_ATTRIBUTE_DOCUMENT OAT
    WHERE OAT.DOCUMENT_TYPE_CODE = NAT.DOCUMENT_TYPE_CODE
      AND OAT.CUSTOM_ATTRIBUTE_ID = NAT.CUSTOM_ATTRIBUTE_ID
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.CUSTOM_ATTRIBUTE_DOCUMENT NAT2
    WHERE NAT2.DOCUMENT_TYPE_CODE = NAT.DOCUMENT_TYPE_CODE
      AND NAT2.CUSTOM_ATTRIBUTE_ID = NAT.CUSTOM_ATTRIBUTE_ID
  ) ;
  
INSERT INTO KCDBA.CUSTOM_ATTRIBUTE_DOCUMENT (DOCUMENT_TYPE_CODE, CUSTOM_ATTRIBUTE_ID, TYPE_NAME, IS_REQUIRED, ACTIVE_FLAG, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT DOCUMENT_TYPE_CODE,
  CUSTOM_ATTRIBUTE_ID,
  TYPE_NAME,
  IS_REQUIRED,
  ACTIVE_FLAG,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.CUSTOM_ATTRIBUTE_DOCUMENT OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.CUSTOM_ATTRIBUTE_DOCUMENT NAT
    WHERE OAT.DOCUMENT_TYPE_CODE = NAT.DOCUMENT_TYPE_CODE
      AND OAT.CUSTOM_ATTRIBUTE_ID = NAT.CUSTOM_ATTRIBUTE_ID
  ) ;

--Migrate Deadline Type items
UPDATE KCDBA.DEADLINE_TYPE NAT
SET (DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.DEADLINE_TYPE OAT
    WHERE OAT.DEADLINE_TYPE_CODE = NAT.DEADLINE_TYPE_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.DEADLINE_TYPE NAT2
    WHERE NAT2.DEADLINE_TYPE_CODE = NAT.DEADLINE_TYPE_CODE
  ) ;
  
INSERT INTO KCDBA.DEADLINE_TYPE (DEADLINE_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT DEADLINE_TYPE_CODE,
  DESCRIPTION,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.DEADLINE_TYPE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.DEADLINE_TYPE NAT
    WHERE OAT.DEADLINE_TYPE_CODE = NAT.DEADLINE_TYPE_CODE
  ) ;

--Migrate Degree Type items
UPDATE KCDBA.DEGREE_TYPE NAT
SET (DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.DEGREE_TYPE OAT
    WHERE OAT.DEGREE_CODE = NAT.DEGREE_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.DEGREE_TYPE NAT2
    WHERE NAT2.DEGREE_CODE = NAT.DEGREE_CODE
  ) ;
  
INSERT INTO KCDBA.DEGREE_TYPE (DEGREE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT DEGREE_CODE,
  DESCRIPTION,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.DEGREE_TYPE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.DEGREE_TYPE NAT
    WHERE OAT.DEGREE_CODE = NAT.DEGREE_CODE
  ) ;

--Migrate EPS Proposal Status items
UPDATE KCDBA.EPS_PROPOSAL_STATUS NAT
SET (DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER) =
  (
    SELECT DESCRIPTION,
      UPDATE_TIMESTAMP,
      UPDATE_USER
    FROM KCMIG.EPS_PROPOSAL_STATUS OAT
    WHERE OAT.STATUS_CODE = NAT.STATUS_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.EPS_PROPOSAL_STATUS NAT2
    WHERE NAT2.STATUS_CODE = NAT.STATUS_CODE
  ) ;
  
INSERT INTO KCDBA.EPS_PROPOSAL_STATUS (STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER)
SELECT STATUS_CODE,
  DESCRIPTION,
  UPDATE_TIMESTAMP,
  UPDATE_USER
FROM KCMIG.EPS_PROPOSAL_STATUS OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.EPS_PROPOSAL_STATUS NAT
    WHERE OAT.STATUS_CODE = NAT.STATUS_CODE
  ) ;

--Migrate EPS Proposal Columns to Alter items
UPDATE KCDBA.EPS_PROP_COLUMNS_TO_ALTER NAT
SET (LOOKUP_RETURN, COLUMN_LABEL, DATA_TYPE, DATA_LENGTH, HAS_LOOKUP, LOOKUP_ARGUMENT, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT LOOKUP_RETURN,
      COLUMN_LABEL,
      DATA_TYPE,
      DATA_LENGTH,
      HAS_LOOKUP,
      LOOKUP_ARGUMENT,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.EPS_PROP_COLUMNS_TO_ALTER OAT
    WHERE OAT.COLUMN_NAME = NAT.COLUMN_NAME
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.EPS_PROP_COLUMNS_TO_ALTER NAT2
    WHERE NAT2.COLUMN_NAME = NAT.COLUMN_NAME
  ) ;
  
INSERT INTO KCDBA.EPS_PROP_COLUMNS_TO_ALTER (COLUMN_NAME, LOOKUP_RETURN, COLUMN_LABEL, DATA_TYPE, DATA_LENGTH, HAS_LOOKUP, LOOKUP_ARGUMENT, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT COLUMN_NAME,
  LOOKUP_RETURN,
  COLUMN_LABEL,
  DATA_TYPE,
  DATA_LENGTH,
  HAS_LOOKUP,
  LOOKUP_ARGUMENT,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.EPS_PROP_COLUMNS_TO_ALTER OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.EPS_PROP_COLUMNS_TO_ALTER NAT
    WHERE OAT.COLUMN_NAME = NAT.COLUMN_NAME
  ) ;

--Migrate EPS Proposal Person Document Type items
UPDATE KCDBA.EPS_PROP_PER_DOC_TYPE NAT
SET (DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.EPS_PROP_PER_DOC_TYPE OAT
    WHERE OAT.DOCUMENT_TYPE_CODE = NAT.DOCUMENT_TYPE_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.EPS_PROP_PER_DOC_TYPE NAT2
    WHERE NAT2.DOCUMENT_TYPE_CODE = NAT.DOCUMENT_TYPE_CODE
  ) ;
  
INSERT INTO KCDBA.EPS_PROP_PER_DOC_TYPE (DOCUMENT_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT DOCUMENT_TYPE_CODE,
  DESCRIPTION,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.EPS_PROP_PER_DOC_TYPE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.EPS_PROP_PER_DOC_TYPE NAT
    WHERE OAT.DOCUMENT_TYPE_CODE = NAT.DOCUMENT_TYPE_CODE
  ) ;

--Migrate Exemption Type items
UPDATE KCDBA.EXEMPTION_TYPE NAT
SET (DESCRIPTION, DETAILED_DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT DESCRIPTION,
      DETAILED_DESCRIPTION,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.EXEMPTION_TYPE OAT
    WHERE OAT.EXEMPTION_TYPE_CODE = NAT.EXEMPTION_TYPE_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.EXEMPTION_TYPE NAT2
    WHERE NAT2.EXEMPTION_TYPE_CODE = NAT.EXEMPTION_TYPE_CODE
  ) ;
  
INSERT INTO KCDBA.EXEMPTION_TYPE (EXEMPTION_TYPE_CODE, DESCRIPTION, DETAILED_DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT EXEMPTION_TYPE_CODE,
  DESCRIPTION,
  DETAILED_DESCRIPTION,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.EXEMPTION_TYPE OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.EXEMPTION_TYPE NAT
    WHERE OAT.EXEMPTION_TYPE_CODE = NAT.EXEMPTION_TYPE_CODE
  ) ;

--Migrate Unit items
UPDATE KCDBA.UNIT NAT
SET (UNIT_NAME, PARENT_UNIT_NUMBER, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT UNIT_NAME,
      PARENT_UNIT_NUMBER,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.UNIT OAT
    WHERE OAT.UNIT_NUMBER = NAT.UNIT_NUMBER
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.UNIT NAT2
    WHERE NAT2.UNIT_NUMBER = NAT.UNIT_NUMBER
  ) ;
  
INSERT INTO KCDBA.UNIT (UNIT_NUMBER, UNIT_NAME, ORGANIZATION_ID, PARENT_UNIT_NUMBER, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT UNIT_NUMBER,
  UNIT_NAME,
  ORGANIZATION_ID,
  PARENT_UNIT_NUMBER,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.UNIT OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.INSTITUTE_LA_RATES NAT
    WHERE OAT.UNIT_NUMBER = NAT.UNIT_NUMBER
  ) ;

--Migrate Rolodex items
UPDATE KCDBA.ROLODEX NAT
SET (LAST_NAME, FIRST_NAME, MIDDLE_NAME, SUFFIX, PREFIX, TITLE, ORGANIZATION,
      ADDRESS_LINE_1, ADDRESS_LINE_2, ADDRESS_LINE_3, FAX_NUMBER, EMAIL_ADDRESS, CITY,
      COUNTY, STATE, POSTAL_CODE, COMMENTS, PHONE_NUMBER, COUNTRY_CODE, SPONSOR_CODE,
      OWNED_BY_UNIT, SPONSOR_ADDRESS_FLAG, DELETE_FLAG, CREATE_USER, UPDATE_TIMESTAMP,
      UPDATE_USER, VER_NBR, OBJ_ID) =
      (
    SELECT LAST_NAME,
  FIRST_NAME,
  MIDDLE_NAME,
  SUFFIX,
  PREFIX,
  TITLE,
  ORGANIZATION,
  ADDRESS_LINE_1,
  ADDRESS_LINE_2,
  ADDRESS_LINE_3,
  FAX_NUMBER,
  EMAIL_ADDRESS,
  CITY,
  COUNTY,
  STATE,
  POSTAL_CODE,
  COMMENTS,
  PHONE_NUMBER,
  COUNTRY_CODE,
  SPONSOR_CODE,
  OWNED_BY_UNIT,
  SPONSOR_ADDRESS_FLAG,
  DELETE_FLAG,
  CREATE_USER,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
    FROM KCMIG.ROLODEX OAT
    WHERE OAT.ROLODEX_ID = NAT.ROLODEX_ID
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.ROLODEX NAT2
    WHERE NAT2.ROLODEX_ID = NAT.ROLODEX_ID
  ) ;
  
INSERT INTO KCDBA.ROLODEX  (ROLODEX_ID, LAST_NAME, FIRST_NAME, MIDDLE_NAME, SUFFIX, PREFIX, TITLE, ORGANIZATION,
  ADDRESS_LINE_1, ADDRESS_LINE_2, ADDRESS_LINE_3, FAX_NUMBER, EMAIL_ADDRESS, CITY,
  COUNTY, STATE, POSTAL_CODE, COMMENTS, PHONE_NUMBER, COUNTRY_CODE, SPONSOR_CODE,
  OWNED_BY_UNIT, SPONSOR_ADDRESS_FLAG, DELETE_FLAG, CREATE_USER, UPDATE_TIMESTAMP,
  UPDATE_USER, VER_NBR, OBJ_ID)
SELECT ROLODEX_ID,
  LAST_NAME,
  FIRST_NAME,
  MIDDLE_NAME,
  SUFFIX,
  PREFIX,
  TITLE,
  ORGANIZATION,
  ADDRESS_LINE_1,
  ADDRESS_LINE_2,
  ADDRESS_LINE_3,
  FAX_NUMBER,
  EMAIL_ADDRESS,
  CITY,
  COUNTY,
  STATE,
  POSTAL_CODE,
  COMMENTS,
  PHONE_NUMBER,
  COUNTRY_CODE,
  SPONSOR_CODE,
  OWNED_BY_UNIT,
  SPONSOR_ADDRESS_FLAG,
  DELETE_FLAG,
  CREATE_USER,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.ROLODEX OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.ROLODEX NAT
    WHERE OAT.ROLODEX_ID = NAT.ROLODEX_ID
  ) ;

--Migrate Organization items
UPDATE KCDBA.ORGANIZATION NAT
SET (ORGANIZATION_NAME, CONTACT_ADDRESS_ID, ADDRESS, CABLE_ADDRESS, 
  TELEX_NUMBER, COUNTY, CONGRESSIONAL_DISTRICT, INCORPORATED_IN, INCORPORATED_DATE, 
  NUMBER_OF_EMPLOYEES, IRS_TAX_EXCEMPTION, FEDRAL_EMPLOYER_ID, MASS_TAX_EXCEMPT_NUM,
  AGENCY_SYMBOL, VENDOR_CODE, COM_GOV_ENTITY_CODE, MASS_EMPLOYEE_CLAIM, DUNS_NUMBER,
  DUNS_PLUS_FOUR_NUMBER, DODAC_NUMBER, CAGE_NUMBER, HUMAN_SUB_ASSURANCE, ANIMAL_WELFARE_ASSURANCE,
  SCIENCE_MISCONDUCT_COMPL_DATE, PHS_ACOUNT, NSF_INSTITUTIONAL_CODE, INDIRECT_COST_RATE_AGREEMENT,
  COGNIZANT_AUDITOR, ONR_RESIDENT_REP, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT ORGANIZATION_NAME,
      CONTACT_ADDRESS_ID,
      ADDRESS,
      CABLE_ADDRESS,
      TELEX_NUMBER,
      COUNTY,
      CONGRESSIONAL_DISTRICT,
      INCORPORATED_IN,
      INCORPORATED_DATE,
      NUMBER_OF_EMPLOYEES,
      IRS_TAX_EXCEMPTION,
      FEDRAL_EMPLOYER_ID,
      MASS_TAX_EXCEMPT_NUM,
      AGENCY_SYMBOL,
      VENDOR_CODE,
      COM_GOV_ENTITY_CODE,
      MASS_EMPLOYEE_CLAIM,
      DUNS_NUMBER,
      DUNS_PLUS_FOUR_NUMBER,
      DODAC_NUMBER,
      CAGE_NUMBER,
      HUMAN_SUB_ASSURANCE,
      ANIMAL_WELFARE_ASSURANCE,
      SCIENCE_MISCONDUCT_COMPL_DATE,
      PHS_ACOUNT,
      NSF_INSTITUTIONAL_CODE,
      INDIRECT_COST_RATE_AGREEMENT,
      COGNIZANT_AUDITOR,
      ONR_RESIDENT_REP,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.ORGANIZATION OAT
    WHERE OAT.ORGANIZATION_ID = NAT.ORGANIZATION_ID
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.ORGANIZATION NAT2
    WHERE NAT2.ORGANIZATION_ID = NAT.ORGANIZATION_ID
  ) ;
  
INSERT INTO KCDBA.ORGANIZATION  (ORGANIZATION_ID, ORGANIZATION_NAME, CONTACT_ADDRESS_ID, ADDRESS, CABLE_ADDRESS, 
  TELEX_NUMBER, COUNTY, CONGRESSIONAL_DISTRICT, INCORPORATED_IN, INCORPORATED_DATE, 
  NUMBER_OF_EMPLOYEES, IRS_TAX_EXCEMPTION, FEDRAL_EMPLOYER_ID, MASS_TAX_EXCEMPT_NUM,
  AGENCY_SYMBOL, VENDOR_CODE, COM_GOV_ENTITY_CODE, MASS_EMPLOYEE_CLAIM, DUNS_NUMBER,
  DUNS_PLUS_FOUR_NUMBER, DODAC_NUMBER, CAGE_NUMBER, HUMAN_SUB_ASSURANCE, ANIMAL_WELFARE_ASSURANCE,
  SCIENCE_MISCONDUCT_COMPL_DATE, PHS_ACOUNT, NSF_INSTITUTIONAL_CODE, INDIRECT_COST_RATE_AGREEMENT,
  COGNIZANT_AUDITOR, ONR_RESIDENT_REP, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT ORGANIZATION_ID,
  ORGANIZATION_NAME,
  CONTACT_ADDRESS_ID,
  ADDRESS,
  CABLE_ADDRESS,
  TELEX_NUMBER,
  COUNTY,
  CONGRESSIONAL_DISTRICT,
  INCORPORATED_IN,
  INCORPORATED_DATE,
  NUMBER_OF_EMPLOYEES,
  IRS_TAX_EXCEMPTION,
  FEDRAL_EMPLOYER_ID,
  MASS_TAX_EXCEMPT_NUM,
  AGENCY_SYMBOL,
  VENDOR_CODE,
  COM_GOV_ENTITY_CODE,
  MASS_EMPLOYEE_CLAIM,
  DUNS_NUMBER,
  DUNS_PLUS_FOUR_NUMBER,
  DODAC_NUMBER,
  CAGE_NUMBER,
  HUMAN_SUB_ASSURANCE,
  ANIMAL_WELFARE_ASSURANCE,
  SCIENCE_MISCONDUCT_COMPL_DATE,
  PHS_ACOUNT,
  NSF_INSTITUTIONAL_CODE,
  INDIRECT_COST_RATE_AGREEMENT,
  COGNIZANT_AUDITOR,
  ONR_RESIDENT_REP,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.ORGANIZATION OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.ORGANIZATION NAT
    WHERE OAT.ORGANIZATION_ID = NAT.ORGANIZATION_ID
  ) ;
  
--Migrate Unit Organization items
UPDATE KCDBA.UNIT NAT
SET (ORGANIZATION_ID) =
  (
    SELECT ORGANIZATION_ID
    FROM KCMIG.UNIT OAT
    WHERE OAT.UNIT_NUMBER = NAT.UNIT_NUMBER
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.UNIT NAT2
    WHERE NAT2.UNIT_NUMBER = NAT.UNIT_NUMBER
  ) ;

--Migrate Institute LA Rates items
UPDATE KCDBA.INSTITUTE_LA_RATES NAT
SET (RATE, ACTIVE_FLAG, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID) =
  (
    SELECT RATE,
      ACTIVE_FLAG,
      UPDATE_TIMESTAMP,
      UPDATE_USER,
      VER_NBR,
      OBJ_ID
    FROM KCMIG.INSTITUTE_LA_RATES OAT
    WHERE OAT.UNIT_NUMBER = NAT.UNIT_NUMBER
      AND OAT.RATE_TYPE_CODE = NAT.RATE_TYPE_CODE
      AND OAT.FISCAL_YEAR = NAT.FISCAL_YEAR
      AND OAT.START_DATE = NAT.START_DATE
      AND OAT.ON_OFF_CAMPUS_FLAG = NAT.ON_OFF_CAMPUS_FLAG
      AND OAT.RATE_CLASS_CODE = NAT.RATE_CLASS_CODE
  )
WHERE EXISTS
  (
    SELECT 'a'
    FROM KCDBA.INSTITUTE_LA_RATES NAT2
    WHERE NAT2.UNIT_NUMBER = NAT.UNIT_NUMBER
      AND NAT2.RATE_TYPE_CODE = NAT.RATE_TYPE_CODE
      AND NAT2.FISCAL_YEAR = NAT.FISCAL_YEAR
      AND NAT2.START_DATE = NAT.START_DATE
      AND NAT2.ON_OFF_CAMPUS_FLAG = NAT.ON_OFF_CAMPUS_FLAG
      AND NAT2.RATE_CLASS_CODE = NAT.RATE_CLASS_CODE
  ) ;
  
INSERT INTO KCDBA.INSTITUTE_LA_RATES (UNIT_NUMBER, RATE_TYPE_CODE, FISCAL_YEAR, START_DATE, ON_OFF_CAMPUS_FLAG, RATE_CLASS_CODE, RATE, ACTIVE_FLAG, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
SELECT UNIT_NUMBER,
  RATE_TYPE_CODE,
  FISCAL_YEAR,
  START_DATE,
  ON_OFF_CAMPUS_FLAG,
  RATE_CLASS_CODE,
  RATE,
  ACTIVE_FLAG,
  UPDATE_TIMESTAMP,
  UPDATE_USER,
  VER_NBR,
  OBJ_ID
FROM KCMIG.INSTITUTE_LA_RATES OAT
WHERE NOT EXISTS
  (
    SELECT 'a'
    FROM KCDBA.INSTITUTE_LA_RATES NAT
    WHERE OAT.UNIT_NUMBER = NAT.UNIT_NUMBER
      AND OAT.RATE_TYPE_CODE = NAT.RATE_TYPE_CODE
      AND OAT.FISCAL_YEAR = NAT.FISCAL_YEAR
      AND OAT.START_DATE = NAT.START_DATE
      AND OAT.ON_OFF_CAMPUS_FLAG = NAT.ON_OFF_CAMPUS_FLAG
      AND OAT.RATE_CLASS_CODE = NAT.RATE_CLASS_CODE
  ) ;
