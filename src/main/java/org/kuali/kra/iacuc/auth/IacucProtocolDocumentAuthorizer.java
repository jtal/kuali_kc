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
package org.kuali.kra.iacuc.auth;

import java.util.HashSet;
import java.util.Set;

import org.kuali.kra.authorization.ApplicationTask;
import org.kuali.kra.authorization.KcTransactionalDocumentAuthorizerBase;
import org.kuali.kra.iacuc.IacucProtocolDocument;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.infrastructure.TaskName;
import org.kuali.kra.service.TaskAuthorizationService;
import org.kuali.rice.kim.api.identity.Person;
import org.kuali.rice.kns.authorization.AuthorizationConstants;
import org.kuali.rice.krad.document.Document;

public class IacucProtocolDocumentAuthorizer extends KcTransactionalDocumentAuthorizerBase {
    // TODO : detail need to be implemented after role and tasks are set up.
    
    /**
     * Comment for <code>serialVersionUID</code>
     */
    private static final long serialVersionUID = -5078229085592345997L;

    /**
     * @see org.kuali.rice.kns.document.authorization.TransactionalDocumentAuthorizer#getEditModes(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person, java.util.Set)
     */
    public Set<String> getEditModes(Document document, Person user, Set<String> currentEditModes) {
        Set<String> editModes = new HashSet<String>();
        
        IacucProtocolDocument iacucProtocolDocument = (IacucProtocolDocument) document;
        String userId = user.getPrincipalId();
        
        if (iacucProtocolDocument.getProtocol().getProtocolId() == null) {
            if (canCreateIacucProtocol(user)) {
                editModes.add(AuthorizationConstants.EditMode.FULL_ENTRY);
            } 
            else {
                editModes.add(AuthorizationConstants.EditMode.UNVIEWABLE);
            }
        } 
        else {
            if (canExecuteIacucProtocolTask(userId, iacucProtocolDocument, TaskName.MODIFY_IACUC_PROTOCOL)) {  
                editModes.add(AuthorizationConstants.EditMode.FULL_ENTRY);
            }
            else if (canExecuteIacucProtocolTask(userId, iacucProtocolDocument, TaskName.VIEW_IACUC_PROTOCOL)) {
                editModes.add(AuthorizationConstants.EditMode.VIEW_ONLY);
            }
            else {
                editModes.add(AuthorizationConstants.EditMode.UNVIEWABLE);
            }
            
        }
        
        return editModes;
    }
    
    /**
     * @see org.kuali.rice.kns.document.authorization.DocumentAuthorizer#canInitiate(java.lang.String, org.kuali.rice.kim.api.identity.Person)
     */
    public boolean canInitiate(String documentTypeName, Person user) {
        return canCreateIacucProtocol(user);
    }

    /**
     * @see org.kuali.rice.kns.document.authorization.DocumentAuthorizer#canOpen(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person)
     */
    public boolean canOpen(Document document, Person user) {
        // TODO : this is temporarily return 'true' because the required fields are not done.  unit number is not saved.
        // so, the permission check can't be done properly.
        IacucProtocolDocument protocolDocument = (IacucProtocolDocument) document;
        if (protocolDocument.getProtocol().getProtocolId() == null) {
            return canCreateIacucProtocol(user);
        }
        return canExecuteIacucProtocolTask(user.getPrincipalId(), (IacucProtocolDocument) document, TaskName.VIEW_IACUC_PROTOCOL);

//          return true;
        }
    
    /**
     * Does the user have permission to create a Iacuc Protocol?
     * @param user the user
     * @return true if the user can create a Iacuc Protocol; otherwise false
     */
    private boolean canCreateIacucProtocol(Person user) {
        ApplicationTask task = new ApplicationTask(TaskName.CREATE_IACUC_PROTOCOL);       
        TaskAuthorizationService taskAuthenticationService = KraServiceLocator.getService(TaskAuthorizationService.class);
        return taskAuthenticationService.isAuthorized(user.getPrincipalId(), task);
    }
    
    /**
     * Does the user have permission to execute the given task for a Iacuc Protocol?
     * @param username the user's username
     * @param doc the Iacuc Protocol document
     * @param taskName the name of the task
     * @return true if has permission; otherwise false
     */
    private boolean canExecuteIacucProtocolTask(String userId, IacucProtocolDocument doc, String taskName) {
        // TODO : to be implemented later
        IacucProtocolTask task = new IacucProtocolTask(taskName, doc.getIacucProtocol());       
        TaskAuthorizationService taskAuthenticationService = KraServiceLocator.getService(TaskAuthorizationService.class);
        return taskAuthenticationService.isAuthorized(userId, task);
    }
    
    /**
     * @see org.kuali.kra.authorization.KcTransactionalDocumentAuthorizerBase#canEdit(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person)
     */
    @Override
    public boolean canEdit(Document document, Person user) {
        return canExecuteIacucProtocolTask(user.getPrincipalId(), (IacucProtocolDocument) document, TaskName.MODIFY_IACUC_PROTOCOL);
    }
    
    /**
     * @see org.kuali.kra.authorization.KcTransactionalDocumentAuthorizerBase#canSave(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person)
     */
    @Override
    public boolean canSave(Document document, Person user) {
        return canEdit(document, user);
    }
    
    @Override
    public boolean canClose(Document document, Person user) {
        return canEdit(document, user);
    }
    
    /**
     * @see org.kuali.kra.authorization.KcTransactionalDocumentAuthorizerBase#canCopy(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person)
     */
    @Override
    public boolean canCopy(Document document, Person user) {
        return false;
    }
    
    /**
     * @see org.kuali.kra.authorization.KcTransactionalDocumentAuthorizerBase#canCancel(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person)
     */
    @Override
    public boolean canCancel(Document document, Person user) {
        return false;
    }
    
    /**
     * @see org.kuali.kra.authorization.KcTransactionalDocumentAuthorizerBase#canRoute(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person)
     */
    @Override
    public boolean canRoute(Document document, Person user) {
        return false;
    }
    
    /**
     * Can the user blanket approve the given document?
     * @param document the document
     * @param user the user
     * @return always false for IacucProtocolDocument
     */
    @Override
    public boolean canBlanketApprove(Document document, Person user) {
        return false;
    }

    @Override
    public boolean canSendNoteFyi(Document document, Person user) {
        return false;
    }
    
    @Override
    public boolean canFyi(Document document, Person user) {
        return false;
    }
    

}
