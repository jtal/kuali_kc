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
package org.kuali.kra.iacuc.actions.modifysubmission;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.kuali.kra.common.committee.bo.Committee;
import org.kuali.kra.common.committee.bo.CommitteeSchedule;
import org.kuali.kra.common.committee.meeting.CommitteeScheduleMinute;
import org.kuali.kra.common.committee.service.CommonCommitteeService;
import org.kuali.kra.common.notification.service.KcNotificationService;
import org.kuali.kra.iacuc.IacucProtocol;
import org.kuali.kra.iacuc.actions.IacucProtocolAction;
import org.kuali.kra.iacuc.actions.IacucProtocolActionType;
import org.kuali.kra.iacuc.actions.processBillable.IacucProtocolProcessBillableService;
import org.kuali.kra.iacuc.actions.submit.IacucProtocolReviewType;
import org.kuali.kra.iacuc.actions.submit.IacucProtocolReviewerBean;
import org.kuali.kra.iacuc.actions.submit.IacucProtocolSubmissionStatus;
import org.kuali.kra.iacuc.notification.IacucProtocolAssignReviewerNotificationRenderer;
import org.kuali.kra.iacuc.notification.IacucProtocolNotificationContext;
import org.kuali.kra.iacuc.notification.IacucProtocolNotificationRequestBean;
import org.kuali.kra.iacuc.onlinereview.IacucProtocolOnlineReview;
import org.kuali.kra.iacuc.onlinereview.IacucProtocolOnlineReviewService;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.protocol.Protocol;
import org.kuali.kra.protocol.ProtocolDocument;
import org.kuali.kra.protocol.ProtocolOnlineReviewDocument;
import org.kuali.kra.protocol.actions.ProtocolAction;
import org.kuali.kra.protocol.actions.ProtocolActionType;
import org.kuali.kra.protocol.actions.submit.ProtocolReviewType;
import org.kuali.kra.protocol.actions.submit.ProtocolReviewer;
import org.kuali.kra.protocol.actions.submit.ProtocolReviewerBean;
import org.kuali.kra.protocol.actions.submit.ProtocolSubmission;
import org.kuali.kra.protocol.onlinereview.ProtocolOnlineReview;
import org.kuali.kra.protocol.onlinereview.ProtocolOnlineReviewService;
import org.kuali.kra.protocol.personnel.ProtocolPerson;
import org.kuali.rice.kew.api.exception.WorkflowException;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.kuali.rice.krad.service.DocumentService;
import org.kuali.rice.krad.util.GlobalVariables;


public class IacucProtocolModifySubmissionServiceImpl extends IacucProtocolProcessBillableService implements IacucProtocolModifySubmissionService{

    private DocumentService documentService;
    private BusinessObjectService businessObjectService;
    private IacucProtocolOnlineReviewService protocolOnlineReviewService;
    private KcNotificationService kcNotificationService;
    private CommonCommitteeService committeeService;
    private static final String NEXT_ACTION_ID_KEY = "actionId";


    public void modifySubmission(ProtocolDocument protocolDocument, IacucProtocolModifySubmissionBean bean, List<ProtocolReviewerBean> beans) throws Exception {
        ProtocolSubmission submission = protocolDocument.getProtocol().getProtocolSubmission();
        submission.setSubmissionTypeCode(bean.getSubmissionTypeCode());
        submission.setSubmissionTypeQualifierCode(bean.getSubmissionQualifierTypeCode());
        setSchedule(submission, bean.getCommitteeId(), bean.getScheduleId());
        processBillable(protocolDocument.getProtocol(), bean.isBillable());
        
        String existingReviewType = submission.getProtocolReviewTypeCode();
        String newReviewType = bean.getProtocolReviewTypeCode();
        
       
        if (!existingReviewType.equals(newReviewType)) {
            //if new Review Type is different than old review type, get the proper review type from DB and add to submission, 
            //and update code
            proccessNewReviewType(submission, newReviewType);
        }
        
        assignReviewers(submission, beans);
        addNewAction((IacucProtocol)protocolDocument.getProtocol(), bean);

        documentService.saveDocument(protocolDocument);
    }
    
    private void addNewAction(IacucProtocol protocol, IacucProtocolModifySubmissionBean actionBean) {
        ProtocolAction lastAction = protocol.getLastProtocolAction();
        ProtocolAction newAction = new IacucProtocolAction();
        // deep copy will replaced the last action with the new one after save
       // ProtocolAction newAction = (ProtocolAction)ObjectUtils.deepCopy(protocol.getLastProtocolAction());
        newAction.setActionId(protocol.getNextValue(NEXT_ACTION_ID_KEY));
        newAction.setActualActionDate(new Timestamp(System.currentTimeMillis()));
        newAction.setActionDate(new Timestamp(System.currentTimeMillis()));
        newAction.setProtocolActionTypeCode(IacucProtocolActionType.NOTIFIED_COMMITTEE);
        newAction.setSubmissionIdFk(lastAction.getSubmissionIdFk());
        newAction.setSubmissionNumber(lastAction.getSubmissionNumber());
        newAction.setProtocolNumber(protocol.getProtocolNumber());
        newAction.setProtocolId(protocol.getProtocolId());
        newAction.setSequenceNumber(protocol.getSequenceNumber());
        protocol.getProtocolActions().add(newAction);

    }
    
    public void setCommitteeService(CommonCommitteeService committeeService) {
        this.committeeService = committeeService;
    }
    
    public void setSchedule(ProtocolSubmission submission, String committeeId, String scheduleId) {
        if (!setCommittee(submission, committeeId)) {
            submission.setScheduleId(null);
            submission.setScheduleIdFk(null);
            submission.setCommitteeSchedule(null);
        }
        else {
            CommitteeSchedule schedule = committeeService.getCommitteeSchedule(submission.getCommittee(), scheduleId);
            if (schedule == null) {
                submission.setScheduleId(null);
                submission.setScheduleIdFk(null);
                submission.setCommitteeSchedule(null);
                updateDefaultSchedule(submission);
            }
            else {
                submission.setScheduleId(schedule.getScheduleId());
                submission.setScheduleIdFk(schedule.getId());
                submission.setCommitteeSchedule(schedule);
                updateDefaultSchedule(submission);
            }
        }
    }
    
    protected void updateDefaultSchedule(ProtocolSubmission submission) {
        Map<String, String> fieldValues = new HashMap<String, String>();
        fieldValues.put("protocolIdFk", submission.getProtocolId().toString());
//        fieldValues.put("scheduleIdFk", CommitteeSchedule.DEFAULT_SCHEDULE_ID.toString());
        List<CommitteeScheduleMinute> minutes = (List<CommitteeScheduleMinute>) businessObjectService.findMatching(CommitteeScheduleMinute.class, fieldValues);
        if (!minutes.isEmpty()) {
            for (CommitteeScheduleMinute minute : minutes) {
                if (submission.getScheduleIdFk() == null) {
                    minute.setScheduleIdFk(CommitteeSchedule.DEFAULT_SCHEDULE_ID);
                } else {
                    minute.setScheduleIdFk(submission.getScheduleIdFk());
                }
            }
            businessObjectService.save(minutes);
        }
    }
    
    public boolean setCommittee(ProtocolSubmission submission, String committeeId) {
        Committee committee = committeeService.getCommitteeById(committeeId);
        if (committee == null) {
            submission.setCommitteeId(null);
            submission.setCommitteeIdFk(null);
            submission.setCommittee(null);
            return false;
        }
        else {
            submission.setCommitteeId(committee.getCommitteeId());
            submission.setCommitteeIdFk(committee.getId());
            submission.setCommittee(committee);
            return true;
        }
    }
    public String getAssignedScheduleId(Protocol protocol) {
        ProtocolSubmission submission = findSubmission(protocol);
        if (submission != null && StringUtils.equals(submission.getSubmissionStatusCode(), IacucProtocolSubmissionStatus.SUBMITTED_TO_COMMITTEE)) {
            return submission.getScheduleId();
        }
        return null;
    }
    
    protected ProtocolSubmission findSubmission(Protocol protocol) {
        // need to loop thru to find the last submission.
        // it may have submit/Wd/notify irb/submit, and this will cause problem if don't loop thru.
        ProtocolSubmission protocolSubmission = null;
        for (ProtocolSubmission submission : protocol.getProtocolSubmissions()) {
            if (StringUtils.equals(submission.getSubmissionStatusCode(), IacucProtocolSubmissionStatus.PENDING) ||
                StringUtils.equals(submission.getSubmissionStatusCode(), IacucProtocolSubmissionStatus.SUBMITTED_TO_COMMITTEE)) {
                protocolSubmission = submission;
            }
        }
        return protocolSubmission;

    }
    
    protected void removeReviewer(ProtocolSubmission protocolSubmission, ProtocolReviewerBean protocolReviewBean,String annotation) {
        //We need to send the notification prior to the online review being removed in order to satisfy the kim role recipients requirements
        ProtocolOnlineReviewDocument onlineReviewDocument = 
            protocolOnlineReviewService.getProtocolOnlineReviewDocument(protocolReviewBean.getPersonId(), protocolReviewBean.getNonEmployeeFlag(), protocolSubmission);
        if (onlineReviewDocument != null) {   
            Protocol protocol = protocolSubmission.getProtocol();
            ProtocolOnlineReview protocolOnlineReview = onlineReviewDocument.getProtocolOnlineReview();
            protocolReviewBean.setNotificationRequestBean(new IacucProtocolNotificationRequestBean((IacucProtocol)protocol, (IacucProtocolOnlineReview) protocolOnlineReview, IacucProtocolActionType.ASSIGN_REVIEWER, "Assign Reviewer", null, null));
            protocolReviewBean.setActionFlag(ProtocolReviewerBean.REMOVE);
            IacucProtocolAssignReviewerNotificationRenderer renderer = new IacucProtocolAssignReviewerNotificationRenderer((IacucProtocol) protocol, "removed");
            IacucProtocolNotificationContext context = new IacucProtocolNotificationContext((IacucProtocol)protocol, (IacucProtocolOnlineReview)protocolOnlineReview, IacucProtocolActionType.ASSIGN_REVIEWER, "Assign Reviewer", renderer);
           // if (!getPromptUserForNotificationEditor(context)) {
            kcNotificationService.sendNotification(context);
       // }
        }
        
        protocolOnlineReviewService.removeOnlineReviewDocument(protocolReviewBean.getPersonId(), protocolReviewBean.getNonEmployeeFlag(), protocolSubmission, annotation);
    }
    
    public void assignReviewers(ProtocolSubmission protocolSubmission, List<ProtocolReviewerBean> protocolReviewerBeans) throws Exception  {
        if (protocolSubmission != null) {
            for (ProtocolReviewerBean bean : protocolReviewerBeans) {
                if (StringUtils.isNotBlank(bean.getReviewerTypeCode())) {
                    if (!protocolOnlineReviewService.isProtocolReviewer(bean.getPersonId(), bean.getNonEmployeeFlag(), protocolSubmission)) {
                        
                        createReviewer(protocolSubmission, bean);
                    } else {
                        updateReviewer(protocolSubmission, bean);
                        bean.setActionFlag(ProtocolReviewerBean.UPDATE);
                    }
                } else {
                    //need to check if this person is currently a reviewer...
                    if (protocolOnlineReviewService.isProtocolReviewer(bean.getPersonId(), bean.getNonEmployeeFlag(), protocolSubmission)) {
                        removeReviewer(protocolSubmission,bean,"REVIEW REMOVED FROM ASSIGN REVIEWERS ACTION.");
                    }
                }
            }
           
            businessObjectService.save(protocolSubmission); 
        }
    }
    
    protected void updateReviewer(ProtocolSubmission protocolSubmission, ProtocolReviewerBean protocolReviewerBean) {
        ProtocolReviewer reviewer = protocolOnlineReviewService.getProtocolReviewer(protocolReviewerBean.getPersonId(), protocolReviewerBean.getNonEmployeeFlag(), protocolSubmission);
        reviewer.setReviewerTypeCode(protocolReviewerBean.getReviewerTypeCode());
        businessObjectService.save(reviewer);
    }
    
    protected void createReviewer(ProtocolSubmission protocolSubmission, ProtocolReviewerBean protocolReviewerBean) throws WorkflowException {
        String principalId = protocolReviewerBean.getPersonId();
        boolean nonEmployeeFlag = protocolReviewerBean.getNonEmployeeFlag();
        String reviewerTypeCode = protocolReviewerBean.getReviewerTypeCode();
        ProtocolReviewer reviewer = protocolOnlineReviewService.createProtocolReviewer(principalId, nonEmployeeFlag, reviewerTypeCode, protocolSubmission);
        ProtocolPerson protocolPerson = protocolSubmission.getProtocol().getPrincipalInvestigator();
        String protocolNumber = protocolSubmission.getProtocol().getProtocolNumber();
        String description = protocolOnlineReviewService.getProtocolOnlineReviewDocumentDescription(protocolNumber, protocolPerson.getLastName());
        String explanation = Constants.EMPTY_STRING;
        String organizationDocumentNumber = Constants.EMPTY_STRING;
        String routeAnnotation = "Online Review Requested by PI during protocol submission.";
        boolean initialApproval = false;
        Date dateRequested = null;
        Date dateDue = null;
        String sessionPrincipalId = GlobalVariables.getUserSession().getPrincipalId();
//        ProtocolOnlineReviewDocument document = protocolOnlineReviewService.createAndRouteProtocolOnlineReviewDocument(protocolSubmission, reviewer, 
//                description, explanation, organizationDocumentNumber, routeAnnotation, initialApproval, dateRequested, dateDue, sessionPrincipalId);

        ProtocolOnlineReviewDocument document =  protocolOnlineReviewService.createProtocolOnlineReviewDocument(protocolSubmission, reviewer, 
              description, explanation, organizationDocumentNumber, dateRequested, dateDue, sessionPrincipalId);

        
        protocolSubmission.getProtocolOnlineReviews().add(document.getProtocolOnlineReview());
        
        //send notification now that the online review has been created.
        IacucProtocol protocol = (IacucProtocol) protocolSubmission.getProtocol();
        ProtocolOnlineReview protocolOnlineReview = document.getProtocolOnlineReview();
        protocolReviewerBean.setNotificationRequestBean(new IacucProtocolNotificationRequestBean(protocol, (IacucProtocolOnlineReview) protocolOnlineReview, IacucProtocolActionType.ASSIGN_REVIEWER, "Assign Reviewer", null, null));
        protocolReviewerBean.setActionFlag(ProtocolReviewerBean.CREATE);
        IacucProtocolAssignReviewerNotificationRenderer renderer = new IacucProtocolAssignReviewerNotificationRenderer(protocol, "added");
        IacucProtocolNotificationContext context = new IacucProtocolNotificationContext(protocol, (IacucProtocolOnlineReview) protocolOnlineReview, IacucProtocolActionType.ASSIGN_REVIEWER, "Assign Reviewer", renderer);
        //if (!getPromptUserForNotificationEditor(context)) {
            kcNotificationService.sendNotification(context);
        //}
    }
    
    protected void proccessNewReviewType(ProtocolSubmission submission, String newReviewType) {
        Map fieldValues = new HashMap();
        fieldValues.put("PROTOCOL_REVIEW_TYPE_CODE", newReviewType);
        ProtocolReviewType newType = (ProtocolReviewType) this.businessObjectService.findByPrimaryKey(IacucProtocolReviewType.class, fieldValues);
        submission.setProtocolReviewType(newType);
        submission.setProtocolReviewTypeCode(newType.getReviewTypeCode());
    }
    
    public void setDocumentService(DocumentService documentService) {
        this.documentService = documentService;
    }
    
    public void setBusinessObjectService(BusinessObjectService businessObjectService) {
        this.businessObjectService = businessObjectService;
    }
   
    
    public void setKcNotificationService(KcNotificationService kcNotificationService) {
        this.kcNotificationService = kcNotificationService;
    }
   
    /**
     * Set the Protocol Online Review Service.
     * @param protocolOnlineReviewService protocolOnlineReviewService.
     */
    public void setProtocolOnlineReviewService(ProtocolOnlineReviewService protocolOnlineReviewService) {
        this.protocolOnlineReviewService = (IacucProtocolOnlineReviewService) protocolOnlineReviewService;
    }

}