CREATE OR REPLACE VIEW OSP$AWARD_HEADER("MIT_AWARD_NUMBER","SEQUENCE_NUMBER","PROPOSAL_NUMBER","TITLE","AWARD_TYPE_CODE","SPECIAL_EB_RATE_OFF_CAMPUS","SPECIAL_EB_RATE_ON_CAMPUS","PRE_AWARD_AUTHORIZED_AMOUNT","PRE_AWARD_EFFECTIVE_DATE","CFDA_NUMBER","DFAFS_NUMBER","SUB_PLAN_FLAG","PROCUREMENT_PRIORITY_CODE","PRIME_SPONSOR_CODE","NON_COMPETING_CONT_PRPSL_DUE","COMPETING_RENEWAL_PRPSL_DUE","BASIS_OF_PAYMENT_CODE","METHOD_OF_PAYMENT_CODE","PAYMENT_INVOICE_FREQ_CODE","INVOICE_NUMBER_OF_COPIES","FINAL_INVOICE_DUE","ACTIVITY_TYPE_CODE","ACCOUNT_TYPE_CODE","UPDATE_TIMESTAMP","UPDATE_USER") AS 
SELECT AWARD_NUMBER,
       SEQUENCE_NUMBER,
       PROPOSAL_NUMBER,
       TITLE,
       AWARD_TYPE_CODE,
       SPECIAL_EB_RATE_OFF_CAMPUS,
       SPECIAL_EB_RATE_ON_CAMPUS,
       PRE_AWARD_AUTHORIZED_AMOUNT,
       PRE_AWARD_EFFECTIVE_DATE,
       CFDA_NUMBER,
       DFAFS_NUMBER,
       SUB_PLAN_FLAG,
       PROCUREMENT_PRIORITY_CODE,
       PRIME_SPONSOR_CODE,
       NON_COMPETING_CONT_PRPSL_DUE,
       COMPETING_RENEWAL_PRPSL_DUE,
       BASIS_OF_PAYMENT_CODE,
       METHOD_OF_PAYMENT_CODE,
       PAYMENT_INVOICE_FREQ_CODE,
       INVOICE_NUMBER_OF_COPIES,
       FINAL_INVOICE_DUE,
       ACTIVITY_TYPE_CODE,
       ACCOUNT_TYPE_CODE,
       UPDATE_TIMESTAMP,
       UPDATE_USER
FROM   AWARD;

CREATE OR REPLACE VIEW OSP$AWARD("MIT_AWARD_NUMBER","SEQUENCE_NUMBER","MODIFICATION_NUMBER","SPONSOR_AWARD_NUMBER","STATUS_CODE","TEMPLATE_CODE","AWARD_EXECUTION_DATE","AWARD_EFFECTIVE_DATE","BEGIN_DATE","SPONSOR_CODE","ACCOUNT_NUMBER","APPRVD_EQUIPMENT_INDICATOR","APPRVD_FOREIGN_TRIP_INDICATOR","APPRVD_SUBCONTRACT_INDICATOR","PAYMENT_SCHEDULE_INDICATOR","IDC_INDICATOR","TRANSFER_SPONSOR_INDICATOR","COST_SHARING_INDICATOR","UPDATE_TIMESTAMP","UPDATE_USER","SPECIAL_REVIEW_INDICATOR","SCIENCE_CODE_INDICATOR","NSF_CODE") AS 
SELECT AWARD_NUMBER,
       SEQUENCE_NUMBER,
       MODIFICATION_NUMBER,
       SPONSOR_AWARD_NUMBER,
       STATUS_CODE,
       TEMPLATE_CODE,
       AWARD_EXECUTION_DATE,
       AWARD_EFFECTIVE_DATE,
       BEGIN_DATE,
       SPONSOR_CODE,
       ACCOUNT_NUMBER,
       APPRVD_EQUIPMENT_INDICATOR,
       APPRVD_FOREIGN_TRIP_INDICATOR,
       APPRVD_SUBCONTRACT_INDICATOR,
       PAYMENT_SCHEDULE_INDICATOR,
       IDC_INDICATOR,
       TRANSFER_SPONSOR_INDICATOR,
       COST_SHARING_INDICATOR,
       UPDATE_TIMESTAMP,
       UPDATE_USER,
       SPECIAL_REVIEW_INDICATOR,
       SCIENCE_CODE_INDICATOR,
       NSF_CODE
FROM   AWARD;