set define off
set sqlblanklines on
spool KR-demo-Demo-ORACLE-Install.log
@ORACLE/KR_DEMO1_KRIM_ENTITY_AFLTN_T.sql
@ORACLE/KR_DEMO1_KRIM_GRP_MBR_T.sql
@ORACLE/KR_DEMO1_KRIM_ROLE_MBR_ATTR_DATA_T.sql
@ORACLE/KR_DEMO2_KRIM_ROLE_MBR_T.sql
commit;
exit
