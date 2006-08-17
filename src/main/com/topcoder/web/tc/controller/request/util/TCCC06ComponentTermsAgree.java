package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.ejb.user.UserEvent;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.tccc06.SubmitAlgoRegistration;

import java.util.Calendar;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 25, 2006
 */
public class TCCC06ComponentTermsAgree extends TermsAgreeBase {
    //dammit, my kingdom for some multiple inheritance!!!
    private TCCC06ComponentTerms helper = new TCCC06ComponentTerms();

    //overload this event, will throw exception if unsuccessful
    protected void businessProcessing() throws TCWebException {
        try {
            super.businessProcessing();


            String aolSurvey = getRequest().getParameter(Constants.TERMS_AGREE);
            //set this just in case there is an error
            setDefault(SubmitAlgoRegistration.AOL_SURVEY, String.valueOf("on".equals(aolSurvey)));
            getRequest().setAttribute(SubmitAlgoRegistration.AOL_SURVEY, Boolean.valueOf("on".equals(aolSurvey)));

            //if we're here, this is successful
            //todo this should really get wrapped in a transaction with the parent class
            UserEvent userEvent = (UserEvent) createEJB(getInitialContext(), UserEvent.class);
            userEvent.createUserEvent(getUser().getId(), Constants.TCCC06_EVENT_ID, DBMS.TCS_OLTP_DATASOURCE_NAME);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * We need this method so that we can set the request on our
     * little helper processor.  We can't have multiple inheritance
     * so we need this processor so that we can access some
     * of the convenience methods in <cdoe>TermsBase</code>
     * but we want to use the business logic
     * contained in <code>TermsAgreeBase</code>
     *
     * @param request
     */
    public void setRequest(TCRequest request) {
        super.setRequest(request);
        helper.setRequest(request);
    }

    /**
     * We need this method so that we can set the response on our
     * little helper processor.  We can't have multiple inheritance
     * so we need this processor so that we can access some
     * of the convenience methods in <cdoe>TermsBase</code>
     * but we want to use the business logic
     * contained in <code>TermsAgreeBase</code>
     *
     * @param response
     */
    public void setResponse(TCResponse response) {
        super.setResponse(response);
        helper.setResponse(response);
    }

    /**
     * We need this method so that we can set the authentication on our
     * little helper processor.  We can't have multiple inheritance
     * so we need this processor so that we can access some
     * of the convenience methods in <cdoe>TermsBase</code>
     * but we want to use the business logic
     * contained in <code>TermsAgreeBase</code>
     *
     * @param auth
     */
    public void setAuthentication(WebAuthentication auth) {
        super.setAuthentication(auth);
        helper.setAuthentication(auth);
    }


    public Calendar getEnd() {
        return helper.getEnd();
    }

    public Calendar getBeginning() {
        return helper.getBeginning();
    }

    public String getEventName() {
        return helper.getEventName();
    }

    public int getTermsId() {
        return helper.getTermsId();
    }

    protected void setSuccessPage() {
        setNextPage("/tournaments/tccc06/regsuccess.jsp");
        setIsNextPageInContext(true);
    }

    public boolean isEligible() throws Exception {
        return helper.isEligible();
    }

    protected String getCacheKey() {
        Request r = new Request();
        r.setContentHandle("tccc06_comp_registrants");
        return r.getCacheKey();
    }


}

