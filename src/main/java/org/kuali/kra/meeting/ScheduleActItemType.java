/*
 * Copyright 2006-2009 The Kuali Foundation
 *
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.osedu.org/licenses/ECL-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.meeting;

import java.util.LinkedHashMap;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.kuali.kra.bo.KraPersistableBusinessObjectBase;

@Entity 
@Table(name="OSP$SCHEDULE_ACT_ITEM_TYPE")
public class ScheduleActItemType extends KraPersistableBusinessObjectBase { 
    
    private static final long serialVersionUID = -2501084035126192701L;
    @Id 
    @Column(name="SCHEDULE_ACT_ITEM_TYPE_CODE")
    private String scheduleActItemTypeCode; 
    @Column(name="DESCRIPTION")
    private String description; 
    
    
    @OneToMany(fetch=FetchType.EAGER, cascade={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name="SCHEDULE_ACT_ITEM_TYPE_CODE", insertable=false, updatable=false)
    private CommScheduleActItem commScheduleActItems;
    
    
    public ScheduleActItemType() { 

    } 
    
    public String getScheduleActItemTypeCode() {
        return scheduleActItemTypeCode;
    }

    public void setScheduleActItemTypeCode(String scheduleActItemTypeCode) {
        this.scheduleActItemTypeCode = scheduleActItemTypeCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public CommScheduleActItem getCommScheduleActItems() {
        return commScheduleActItems;
    }

    public void setCommScheduleActItems(CommScheduleActItem commScheduleActItems) {
        this.commScheduleActItems = commScheduleActItems;
    }

    /** {@inheritDoc} */
    @Override 
    protected LinkedHashMap<String, Object> toStringMapper() {
        LinkedHashMap<String, Object> hashMap = new LinkedHashMap<String, Object>();
        hashMap.put("scheduleActItemTypeCode", this.getScheduleActItemTypeCode());
        hashMap.put("description", this.getDescription());
        return hashMap;
    }
    
}