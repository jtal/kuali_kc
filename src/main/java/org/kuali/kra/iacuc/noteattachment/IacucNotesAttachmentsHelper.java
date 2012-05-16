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
package org.kuali.kra.iacuc.noteattachment;

import org.kuali.kra.iacuc.IacucProtocolDocument;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.infrastructure.RoleConstants;
import org.kuali.kra.infrastructure.TaskName;
import org.kuali.kra.protocol.Protocol;
import org.kuali.kra.protocol.ProtocolDocument;
import org.kuali.kra.protocol.ProtocolForm;
import org.kuali.kra.protocol.auth.ProtocolTask;
import org.kuali.kra.protocol.noteattachment.NotesAttachmentsHelper;
import org.kuali.kra.protocol.noteattachment.ProtocolAttachmentFilter;
import org.kuali.kra.protocol.noteattachment.ProtocolAttachmentPersonnel;
import org.kuali.kra.protocol.noteattachment.ProtocolAttachmentProtocol;
import org.kuali.kra.protocol.noteattachment.ProtocolAttachmentService;
import org.kuali.kra.protocol.noteattachment.ProtocolAttachmentVersioningUtility;
import org.kuali.kra.protocol.noteattachment.ProtocolNotepad;
import org.kuali.kra.protocol.noteattachment.ProtocolNotepadService;
import org.kuali.kra.service.KraAuthorizationService;
import org.kuali.kra.service.TaskAuthorizationService;
import org.kuali.rice.core.api.datetime.DateTimeService;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.rice.krad.util.GlobalVariables;



/**
 * This is the "Helper" class for IACUC Protocol Notes And Attachments.
 */
public class IacucNotesAttachmentsHelper extends NotesAttachmentsHelper {

    public IacucNotesAttachmentsHelper(ProtocolForm form) {
        super(form, (ProtocolAttachmentService)KraServiceLocator.getService("iacucProtocolAttachmentService"), 
                KraServiceLocator.getService(TaskAuthorizationService.class),
                KraServiceLocator.getService(KraAuthorizationService.class),
                KraServiceLocator.getService(DateTimeService.class),
                (ProtocolNotepadService)KraServiceLocator.getService("iacucProtocolNotepadService"),
                KraServiceLocator.getService(ParameterService.class),
                new IacucProtocolAttachmentVersioningUtility(form));
    }

    @Override
    public boolean canEditProtocolAttachments() {
//      final ProtocolTask task = new ProtocolTask(TaskName.MODIFY_IACUC_PROTOCOL_ATTACHMENTS, this.getProtocol());
//      return this.authService.isAuthorized(this.getUserIdentifier(), task);
        return true;
    }

    @Override
    protected ProtocolAttachmentProtocol createNewProtocolAttachmentProtocolInstanceHook(Protocol protocol) {
        return new IacucProtocolAttachmentProtocol();
    }

    @Override
    protected ProtocolAttachmentPersonnel createNewProtocolAttachmentPersonnelInstanceHook(Protocol protocol) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected ProtocolAttachmentFilter createNewProtocolAttachmentFilterInstanceHook() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected String getAttachmentDefaultSortKeyHook() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean canAddProtocolNotepads() {
//      final ProtocolTask task = new ProtocolTask(TaskName.IACUC_ADD_PROTOCOL_NOTES, this.getProtocol());
//      return this.authService.isAuthorized(this.getUserIdentifier(), task);
        return true;
    }

    @Override
    public boolean canViewRestrictedProtocolNotepads() {
//      final ProtocolTask task = new ProtocolTask(TaskName.VIEW_RESTRICTED_NOTES, this.getProtocol());
//      return this.authService.isAuthorized(this.getUserIdentifier(), task);
        return true;
    }

    @Override
    public boolean isProtocolAdmin() {
      return this.kraAuthorizationService.hasRole(GlobalVariables.getUserSession().getPrincipalId(), NAMESPACE, RoleConstants.IACUC_ADMINISTRATOR);
    }

    @Override
    public Class<? extends ProtocolAttachmentProtocol> getProtocolAttachmentProtocolClassHook() {
        // TODO Auto-generated method stub
        return IacucProtocolAttachmentProtocol.class;
    }

    @Override
    public Class<? extends ProtocolAttachmentPersonnel> getProtocolAttachmentPersonnelClassHook() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Class<? extends ProtocolNotepad> getProtocolNotepadClassHook() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Class<? extends ProtocolDocument> getProtocolDocumentClassHook() {
        return IacucProtocolDocument.class;
    }

    @Override
    protected ProtocolNotepad createNewProtocolNotepadInstanceHook(Protocol protocol) {
        // TODO Auto-generated method stub
        return null;
    }

}