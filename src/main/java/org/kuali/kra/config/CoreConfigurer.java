/*
 * Copyright 2005-2010 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.kuali.kra.common.config.AbstractConfigurer;
import org.kuali.rice.core.api.config.module.RunMode;

public class CoreConfigurer extends AbstractConfigurer {
    
    private static final String CORE_SPRING_BEANS_PATH = "classpath:org/kuali/kra/CoreSpringBeans.xml";
    private static final String NEGOTIATION_SPRING_BEANS_PATH = "classpath:/org/kuali/kra/negotiation/NegotiationSpringBeans.xml";
    private static final String PERSON_MASS_CHANGE_SPRING_BEANS_PATH = "classpath:org/kuali/kra/personmasschange/PersonMassChangeSpringBeans.xml";
    private static final String QUESTIONNAIRE_SPRING_BEANS_PATH = "classpath:org/kuali/kra/questionnaire/QuestionnaireSpringBeans.xml";
    private static final String SPECIAL_REVIEW_SPRING_BEANS_PATH = "classpath:org/kuali/kra/common/specialreview/SpecialReviewSpringBeans.xml";

    private static final String BUDGET_SPRING_BEANS_PATH = "classpath:org/kuali/kra/budget/BudgetSpringBeans.xml";
    private static final String INSTITUTIONAL_PROPOSAL_SPRING_BEANS_PATH = "classpath:org/kuali/kra/institutionalproposal/InstitutionalProposalSpringBeans.xml";
    private static final String TIME_AND_MONEY_SPRING_BEANS_PATH = "classpath:org/kuali/kra/awardtimeandmoney/TimeAndMoneySpringBeans.xml";
    private static final String AWARD_SPRING_BEANS_PATH = "classpath:org/kuali/kra/award/AwardSpringBeans.xml"; 
        
    private static final String SUBAWARD_SPRING_BEANS_PATH = "classpath:org/kuali/kra/subaward/SubAwardSpringBeans.xml";
    
    private static final String IRB_SPRING_BEANS_PATH = "classpath:org/kuali/kra/irb/IrbSpringBeans.xml";
    private static final String IACUC_SPRING_BEANS_PATH = "classpath:org/kuali/kra/iacuc/IacucSpringBeans.xml";
    private static final String COMMITTEE_SPRING_BEANS_PATH = "classpath:org/kuali/kra/committee/CommitteeSpringBeans.xml";

    private static final String COI_SPRING_BEANS_PATH = "classpath:org/kuali/kra/coi/CoiSpringBeans.xml";

    public CoreConfigurer() {
        super("kc.core", "KC Core");
        setValidRunModes(Arrays.asList(RunMode.LOCAL));
    }

    @Override
    public List<String> getPrimarySpringFiles() {
        final List<String> springFileLocations = new ArrayList<String>();
        springFileLocations.add(CORE_SPRING_BEANS_PATH);
        springFileLocations.add(NEGOTIATION_SPRING_BEANS_PATH);
        springFileLocations.add(PERSON_MASS_CHANGE_SPRING_BEANS_PATH);
        springFileLocations.add(QUESTIONNAIRE_SPRING_BEANS_PATH);
        springFileLocations.add(SPECIAL_REVIEW_SPRING_BEANS_PATH);
        
        springFileLocations.add(BUDGET_SPRING_BEANS_PATH);
        springFileLocations.add(INSTITUTIONAL_PROPOSAL_SPRING_BEANS_PATH);
        springFileLocations.add(TIME_AND_MONEY_SPRING_BEANS_PATH);
        springFileLocations.add(AWARD_SPRING_BEANS_PATH);
        
        springFileLocations.add(SUBAWARD_SPRING_BEANS_PATH);
        
        springFileLocations.add(IRB_SPRING_BEANS_PATH);
        springFileLocations.add(IACUC_SPRING_BEANS_PATH);
        springFileLocations.add(COMMITTEE_SPRING_BEANS_PATH);
        
        springFileLocations.add(COI_SPRING_BEANS_PATH);
        
        return springFileLocations;
    }

}