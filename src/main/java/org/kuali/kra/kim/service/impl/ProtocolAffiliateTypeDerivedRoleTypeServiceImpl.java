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
package org.kuali.kra.kim.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.kuali.kra.bo.AffiliationType;
import org.kuali.kra.irb.Protocol;
import org.kuali.kra.irb.actions.submit.ProtocolSubmissionQualifierType;
import org.kuali.kra.irb.personnel.ProtocolPerson;
import org.kuali.kra.kim.bo.KcKimAttributes;
import org.kuali.rice.core.api.exception.RiceIllegalArgumentException;
import org.kuali.rice.core.api.membership.MemberType;
import org.kuali.rice.kim.api.role.RoleMembership;
import org.kuali.rice.kns.kim.role.DerivedRoleTypeServiceBase;


public class ProtocolAffiliateTypeDerivedRoleTypeServiceImpl extends DerivedRoleTypeServiceBase {
    private static final org.apache.log4j.Logger LOG = 
        org.apache.log4j.Logger.getLogger(ProtocolAffiliateTypeDerivedRoleTypeServiceImpl.class);
    
    protected List<String> requiredAttributes = new ArrayList<String>();
    {
        requiredAttributes.add(KcKimAttributes.PROTOCOL);
    }
    
    @Override
    public List<RoleMembership> getRoleMembersFromDerivedRole(String namespaceCode, String roleName,
            Map<String,String> qualification) {
        validateRequiredAttributesAgainstReceived(qualification);

        List<RoleMembership> members = new ArrayList<RoleMembership>();

        String protocolNumber = qualification.get(KcKimAttributes.PROTOCOL);       
        Protocol protocol = getProtocol(protocolNumber);
        
        if (protocol != null && CollectionUtils.isNotEmpty(protocol.getProtocolPersons())) {
            for (ProtocolPerson person : protocol.getProtocolPersons()) {
                if (StringUtils.equals(getAffiliationType(person.getAffiliationType().getAffiliationTypeCode()), roleName) &&
                    StringUtils.isNotBlank(person.getPerson().getPersonId())) {
                    members.add(RoleMembership.Builder.create(null, null, person.getPerson().getPersonId(), MemberType.PRINCIPAL, null).build());
    
                }
            }
        }
        
        return members;
    }
    
    @Override
    public boolean hasDerivedRole(String principalId, List<String> groupIds, String namespaceCode, String roleName,
            Map<String,String> qualification) {
        validateRequiredAttributesAgainstReceived(qualification);
        
        String protocolNumber = qualification.get(KcKimAttributes.PROTOCOL);
        
        Protocol protocol = getProtocol(protocolNumber);

        if (protocol != null && CollectionUtils.isNotEmpty(protocol.getProtocolPersons())) {
            for (ProtocolPerson person : protocol.getProtocolPersons()) {
                //Find protocol person that matches the principal id
                if (StringUtils.equals(principalId, person.getPersonId())) {
                    if (StringUtils.equals(roleName, getAffiliationType(person.getAffiliationType().getAffiliationTypeCode()))) {
                        return true;
                    }
                }
            }
        }
        
        return false;
    }
    
    private Protocol getProtocol(String protocolNumber) {
        Map<String,Object> keymap = new HashMap<String,Object>();
        keymap.put("protocolNumber", protocolNumber);
        return (Protocol) getBusinessObjectService().findByPrimaryKey(Protocol.class, keymap);
    }

    private String getAffiliationType(Integer affiliationTypeCode) {
        String result = null;
        
        if (affiliationTypeCode != null) {
            Map<String, String> fieldValues = new HashMap<String, String>();
            fieldValues.put("affiliationTypeCode", affiliationTypeCode.toString());
            List<AffiliationType> affiliationTypes = 
                (List<AffiliationType>) getBusinessObjectService().findMatching(AffiliationType.class, fieldValues);
            if (CollectionUtils.isNotEmpty(affiliationTypes)) {
                result = affiliationTypes.get(0).getDescription();
            }
        }
        return result;        
    }
    
    /*
     * Should override if derivedRoles should not to be cached.
     */
    @Override
    public boolean dynamicRoleMembership(String namespaceCode, String roleName) {
        if (StringUtils.isBlank(namespaceCode)) {
            throw new RiceIllegalArgumentException("namespaceCode was null or blank");
        }

        if (StringUtils.isBlank(roleName)) {
            throw new RiceIllegalArgumentException("roleName was null or blank");
        }

        return true;
    }
}
