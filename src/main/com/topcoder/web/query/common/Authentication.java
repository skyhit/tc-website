package com.topcoder.web.query.common;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.ejb.QueryServices.QueryAuthenticationHome;
import com.topcoder.web.query.ejb.QueryServices.QueryAuthentication;
import com.topcoder.web.query.common.AuthenticationException;

import javax.naming.InitialContext;
import javax.servlet.http.*;
import java.io.Serializable;

/**
 * A bean performing query tool Authentication and using given HttpSession objects for persistence
 * @author Greg Paul
 * @author bigjake <kitz@mit.edu>
 */

public class Authentication implements Serializable {
    private static Logger log = Logger.getLogger(Authentication.class);

    /* Holds the id of the currently logged in user */
    private long userId;

    private boolean loggedIn;

    private static final String AUTHENTICATION_KEY = "query_auth";

    public Authentication() {
        setUserId(0);
        setLoggedIn(false);
    }

    /** Attempts to authenticate a user and set him/her as logged in
     * @param handle The handle of the user for this authentication request
     * @param password The password of the user for this authentication request
     * @param ctx The InitialContext of the originating request
     * @param session The HttpSession of the originating request
     * @throws com.topcoder.web.query.common.AuthenticationException if the login information is incorrect
     * or there is a problem with the ejb
     */
    public void attemptLogin(String handle, String password, InitialContext ctx,
                                    HttpSession session) throws AuthenticationException, Exception {
        log.debug("handle: " + handle + " pass: " + password);

        String errorMessage = null;
        QueryAuthenticationHome qaHome = (QueryAuthenticationHome) ctx.lookup(ApplicationServer.Q_QUERY_AUTHENTICATION);
        QueryAuthentication qa = qaHome.create();
        ResultSetContainer rsc = qa.getLoginInfo(handle);

        if (rsc.isEmpty()) {
            log.debug("bad handle");
            errorMessage = "Incorrect handle.  Please retry.";
        } else {
            String actualPassword = rsc.getItem(0, "password").toString();
            if (!actualPassword.trim().equals(password.trim())) {
                log.debug("bad password");
                errorMessage = "Incorrect password.  Please retry.";
            } else {
                log.debug("successfull login");
                setUserId(((Long) rsc.getItem(0, "user_id").getResultData()).intValue());
                setLoggedIn(true);
                session.setAttribute(AUTHENTICATION_KEY, this);
            }
        }
        if (errorMessage != null) {
            throw new AuthenticationException(errorMessage);
        }
    }

    public static Authentication getAuthentication(HttpSession session) {
        Authentication auth = (Authentication)session.getAttribute(AUTHENTICATION_KEY);
        if (auth==null) {
            auth = new Authentication();
            session.setAttribute(AUTHENTICATION_KEY, auth);
        }
        return auth;
    }

    private void setUserId(long userId) {
        this.userId=userId;
    }

    private long getUserId() {
        return userId;
    }

    public boolean isLoggedIn() {
        return loggedIn;
    }

    public void setLoggedIn(boolean loggedIn) {
        this.loggedIn = loggedIn;
    }

}
