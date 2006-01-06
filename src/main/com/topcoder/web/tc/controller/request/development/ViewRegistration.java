package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.Answer;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.web.ejb.ComponentRegistrationServices.ComponentRegistrationServices;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.project.ProjectLocal;
import com.topcoder.web.ejb.project.Project;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.util.TCO06ComponentTerms;
import com.topcoder.web.tc.model.SoftwareComponent;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 5, 2006
 */
public class ViewRegistration extends Base {

    private ComponentRegistrationServices regServices = null;

    protected void developmentProcessing() throws TCWebException {
        //check if user can do the project (there's like 10 things to check.
        //if they can't, give them error message
        //if they can, check if they are registered for the tco
        //if they are not registered, add a flag to the request
        //forward to terms/questions page

        try {
            validation();


            if (getRequest().getAttribute(Constants.MESSAGE) == null) {
                getRequest().setAttribute("questionInfo", buildQuestions());
                setNextPage("/dev/regTerms.jsp");
                setNextPage("true");
            } else {
                setNextPage("/dev/message.jsp");
                setIsNextPageInContext(true);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

    protected void validation() throws Exception {
        long projectId = 0;
        if (!StringUtils.isNumber(getRequest().getParameter(Constants.PROJECT_ID))) {
            throw new NavigationException("Invalid project specified");
        } else {
            projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));
        }

        ProjectLocal pl = (ProjectLocal) createLocalEJB(getInitialContext(), Project.class);
        int phase = 111 + pl.getProjectTypeId(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);

        int rating;
        if (phase == SoftwareComponent.DEV_PHASE) {
            rating = ((CoderSessionInfo) getSessionInfo()).getDevRating();
        } else if (phase == SoftwareComponent.DESIGN_PHASE) {
            rating = ((CoderSessionInfo) getSessionInfo()).getDesignRating();
        } else {
            throw new TCWebException("invalid project type in db " + (phase - 111));
        }

        if (isSuspended(getUser().getId())) {
            getRequest().setAttribute(Constants.MESSAGE, "Sorry, you are not eligible to participate because you are suspended.");
        } else if (getRegEJB().isRegClosed(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME)) {
            getRequest().setAttribute(Constants.MESSAGE, "Sorry, registration is not currently open.");
        } else if (getRegEJB().isUserRegistered(projectId, getUser().getId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {
            getRequest().setAttribute(Constants.MESSAGE, "You have already registered for this contest.");
        } else if (getRegEJB().hasUserReviewedProject(projectId, getUser().getId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {
            getRequest().setAttribute(Constants.MESSAGE, "Sorry, you have reviewed this project and are not eligible to compete.");
        } else if (getRegEJB().isUserWinningDesigner(projectId, getUser().getId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {
            getRequest().setAttribute(Constants.MESSAGE, "Sorry, Winners of the design phase of a component are not allowed to participate in the development phase.");
        } else if (!getRegEJB().isUserReliableEnough(phase, getUser().getId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {
            getRequest().setAttribute(Constants.MESSAGE, "Sorry, since your reliablity is less than 70%, you may not register for more than 2 projects at a time.");
        } else if (rating == 0) {
            int max = getRegEJB().getMaxUnratedRegistrants(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);
            if (max == 0) {
                getRequest().setAttribute(Constants.MESSAGE, "Sorry, unrated members are not eligible for this contest.");
            } else if (getRegEJB().getUnratedRegistrantCount(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME) >= max) {
                getRequest().setAttribute(Constants.MESSAGE, "Sorry, the maximum number of unrated members for this contest has been reached(" + max + ").");
            }
        } else if (rating != 0) {
            int max = getRegEJB().getMaxRatedRegistrants(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);
            if (max == 0) {
                getRequest().setAttribute(Constants.MESSAGE, "Sorry, rated members are not eligible for this contest.");
            } else if (getRegEJB().getRatedRegistrantCount(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME) >= max) {
                getRequest().setAttribute(Constants.MESSAGE, "Sorry, the maximum number of rated members for this contest has been reached(" + max + ").");
            }
        }
        //just adding the date check to hold off on the db hit when we don't need it
        if (isTournamentTime()) {
            if (isTournamentProject(projectId) && !isRegisteredForTournament()) {
                getRequest().setAttribute("notRegistered", "true");
/*
                    addError(Constants.TERMS_AGREE, "Please be aware that you are not registered for the tournament.  " +
                            "If you don't register for the tournament prior to registering for this project, it will not " +
                            "count for in the tournament standings even if you sign up at a later date.");
*/
            }
        }
    }

    protected boolean isTournamentTime() {
        TCO06ComponentTerms t = new TCO06ComponentTerms();
        Calendar now = Calendar.getInstance();
        now.setTime(new Date());
        return now.before(t.getEnd()) && now.after(t.getBeginning());
    }
    protected boolean isTournamentProject(long projectId) throws Exception {
        Request r = new Request();
        r.setContentHandle("tournament_project");
        r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));
        return !((ResultSetContainer) getDataAccess().getData(r).get("tournament_project")).isEmpty();
    }

    protected boolean isRegisteredForTournament() throws Exception {
        boolean ret = false;
        UserTermsOfUse userTerms = (UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class);
        ret = userTerms.hasTermsOfUse(getUser().getId(), Constants.TCO06_COMPONENT_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME);
        return ret;
    }

//long userId, long componentId, long projectId, int rating, String comment, boolean agreedToTerms, int phase, int version

    protected ComponentRegistrationServices getRegEJB() throws Exception {
        if (regServices == null) {
            regServices = (ComponentRegistrationServices) createEJB(getInitialContext(),
                    ComponentRegistrationServices.class);
        }
        return regServices;
    }

    private static boolean isSuspended(long userId) throws Exception {
        DataAccessInt dAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("component_suspension");
        r.setProperty("uid", String.valueOf(userId));
        ResultSetContainer rsc = (ResultSetContainer) dAccess.getData(r).get("component_suspension");
        return !rsc.isEmpty();
    }


    protected List buildQuestions() throws Exception {
        ResultSetContainer rsc = getRegEJB().getActiveQuestions();
        List ret = new ArrayList(rsc.size());
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            ret.add(makeQuestion((ResultSetContainer.ResultSetRow) it.next()));
        }
        return ret;
    }

    protected Question makeQuestion(ResultSetContainer.ResultSetRow row) throws Exception {
        Question q = new Question();
        q.setId(row.getLongItem("comp_reg_question_id"));
        q.setStyleId(row.getIntItem("question_style_id"));
        q.setText(row.getStringItem("question_text"));
        q.setRequired(true);
        q.setAnswerInfo(makeAnswerInfo(q.getId()));
        return q;
    }

    protected List makeAnswerInfo(long questionId) throws Exception {
        ResultSetContainer rsc = getRegEJB().getAnswers(questionId);
        List ret = new ArrayList(rsc.size());
        ResultSetContainer.ResultSetRow row = null;
        Answer a = null;
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            a = new Answer();
            a.setId(row.getLongItem("comp_reg_answer_id"));
            a.setQuestionId(row.getLongItem("comp_reg_question_id"));
            a.setSort(row.getIntItem("sort_order"));
            a.setText(row.getStringItem("answer_text"));
            ret.add(a);
        }

        return ret;
    }


}



