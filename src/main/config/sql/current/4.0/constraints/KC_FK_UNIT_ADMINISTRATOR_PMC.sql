ALTER TABLE UNIT_ADMINISTRATOR_PMC
  ADD CONSTRAINT FK_UNIT_ADMINISTRATOR_PMC_ID
  FOREIGN KEY (PERSON_MASS_CHANGE_ID) REFERENCES PERSON_MASS_CHANGE (PERSON_MASS_CHANGE_ID)
/