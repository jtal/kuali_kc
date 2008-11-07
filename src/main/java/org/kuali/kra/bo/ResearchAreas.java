/*
 * Copyright 2006-2008 The Kuali Foundation
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
package org.kuali.kra.bo;

import java.util.LinkedHashMap;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity 
@Table(name="RESEARCH_AREAS")
public class ResearchAreas extends KraPersistableBusinessObjectBase {

    @Id 
    @Column(name="RESEARCH_AREA_CODE")
    private String researchAreaCode; 
    @Column(name="PARENT_RESEARCH_AREA_CODE")
    private String parentResearchAreaCode; 
    @Type(type="yes_no")
    @Column(name="HAS_CHILDREN_FLAG")
    private boolean hasChildrenFlag; 
    @Column(name="DESCRIPTION")
    private String description; 
    
    
    /*
    @OneToMany(fetch=FetchType.EAGER, cascade={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name="RESEARCH_AREA_CODE", insertable=false, updatable=false)
    private CommResearchAreas commResearchAreas
    
    @OneToMany(fetch=FetchType.EAGER, cascade={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name="RESEARCH_AREA_CODE", insertable=false, updatable=false)
    private CommMemberExpertise commMemberExpertise
    
    @OneToMany(fetch=FetchType.EAGER, cascade={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name="RESEARCH_AREA_CODE", insertable=false, updatable=false)
    private ProtocolResearchAreas protocolResearchAreas
    */

    public ResearchAreas(){
        super();
    }

    public String getResearchAreaCode() {
        return researchAreaCode;
    }

    public void setResearchAreaCode(String researchAreaCode) {
        this.researchAreaCode = researchAreaCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean getHasChildrenFlag() {
        return hasChildrenFlag;
    }

    public void setHasChildrenFlag(boolean hasChildrenFlag) {
        this.hasChildrenFlag = hasChildrenFlag;
    }

    public String getParentResearchAreaCode() {
        return parentResearchAreaCode;
    }

    public void setParentResearchAreaCode(String parentResearchAreaCode) {
        this.parentResearchAreaCode = parentResearchAreaCode;
    }


    @Override 
    protected LinkedHashMap toStringMapper() {
        LinkedHashMap hashMap = new LinkedHashMap();
        hashMap.put("researchAreaCode", getResearchAreaCode());
        hashMap.put("description", getDescription());
        hashMap.put("hasChildrenFlag", getHasChildrenFlag());
        hashMap.put("parentResearchAreaCode", getParentResearchAreaCode());
        return hashMap;
    }
}

