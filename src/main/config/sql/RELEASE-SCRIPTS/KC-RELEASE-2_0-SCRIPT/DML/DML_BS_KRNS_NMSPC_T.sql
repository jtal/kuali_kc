INSERT INTO KRNS_NMSPC_T (NMSPC_CD, NM, ACTV_IND)
VALUES('KC-IP', 'Institutional Proposal', 'Y') ;

INSERT INTO KRNS_NMSPC_T (NMSPC_CD, VER_NBR, NM, ACTV_IND)
VALUES ('KC-PROTOCOL', 1, 'KC IRB Protocol', 'Y') ; 

INSERT INTO KRNS_NMSPC_T (NMSPC_CD, NM, ACTV_IND)
VALUES('KC-AB', 'Award Budget', 'Y') ;

INSERT INTO KRNS_NMSPC_T (NMSPC_CD, VER_NBR, NM, ACTV_IND)
VALUES ('KC-AWARD', 1, 'Award', 'Y') ; 

INSERT INTO KRNS_NMSPC_T (NMSPC_CD, VER_NBR, NM, ACTV_IND)
VALUES('KC-QUESTIONNAIRE', 1, 'KC Questionnaire', 'Y') ;

INSERT INTO KRNS_NMSPC_T (NMSPC_CD, NM, ACTV_IND)
VALUES('KC-T', 'Time And Money', 'Y') ;

INSERT INTO KRNS_NMSPC_T (NMSPC_CD, NM, ACTV_IND)
VALUES('KC-GEN', 'General Kuali Coeus', 'Y') ;

UPDATE KRNS_NMSPC_T 
SET NMSPC_CD='KC-PD' 
WHERE NMSPC_CD = 'KRA-PD';

UPDATE KRNS_NMSPC_T 
SET NMSPC_CD='KC-B' 
WHERE NMSPC_CD = 'KRA-B';

UPDATE KRNS_NMSPC_T 
SET NMSPC_CD='KC-M' 
WHERE NMSPC_CD = 'KRA-M';

COMMIT;