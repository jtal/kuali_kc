UPDATE NOTIFICATION_TYPE SET DESCRIPTION='Request To Close Enrollment Event' WHERE MODULE_CODE=7 AND ACTION_CODE='108'
/
UPDATE NOTIFICATION_TYPE SET DESCRIPTION='Request for Data Analysis Only' WHERE MODULE_CODE=7 AND ACTION_CODE='114'
/
UPDATE NOTIFICATION_TYPE SET DESCRIPTION='Request to Re-Open Enrollment Event', SUBJECT='Protocol {PROTOCOL_NUMBER} Request to Re-Open Enrollment' WHERE MODULE_CODE=7 AND ACTION_CODE='115'
/
