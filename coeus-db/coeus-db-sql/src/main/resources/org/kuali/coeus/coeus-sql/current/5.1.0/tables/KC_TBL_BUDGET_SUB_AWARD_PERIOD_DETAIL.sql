create table BUDGET_SUB_AWARD_PERIOD_DETAIL (
	SUBAWARD_PERIOD_DETAIL_ID	NUMBER(12,0)	NOT NULL,
	SUBAWARD_NUMBER				NUMBER(12,0)	NOT NULL,
	BUDGET_ID					NUMBER(12,0)	NOT NULL,
	BUDGET_PERIOD				NUMBER(3,0)		NOT NULL,
	DIRECT_COST					NUMBER(12,2),
	INDIRECT_COST				NUMBER(12,2),
	COST_SHARING_AMOUNT			NUMBER(12,2),
	TOTAL_COST					NUMBER(12,2),
	UPDATE_TIMESTAMP 			DATE 			NOT NULL, 
    UPDATE_USER 				VARCHAR2(60) 	NOT NULL, 
    VER_NBR 					NUMBER(8,0) 	DEFAULT 1 NOT NULL, 
    OBJ_ID 						VARCHAR2(36) 	NOT NULL
)
/

alter table BUDGET_SUB_AWARD_PERIOD_DETAIL 
add constraint PK_BUDGET_SUB_AWARD_PER_DETAIL 
primary key (SUBAWARD_PERIOD_DETAIL_ID) 
/
