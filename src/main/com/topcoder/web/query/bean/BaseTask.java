package com.topcoder.web.query.bean;

import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

/**
 * @author Greg Paul
 * @author bigjake <kitz@mit.edu>
 *
 */

public abstract class BaseTask implements Task {

    private static Logger log = Logger.getLogger(BaseTask.class);

    /* Holds the InitialContext of a request being processed by this task */
    private InitialContext ctx;

    /* Holds the next page to which the controller should forward after task processing */
    private String nextPage;

    /* Holds the path to the servlet that instantiated this task */
    private String servletPath;

    private HashMap errors;

    private List navLinks;

    /* Makes a new BaseTask */
    public BaseTask() {
        setInitialContext(null);
        setNextPage(null);
        setServletPath(null);
        errors = new HashMap();
        navLinks = new ArrayList();
    }

    public abstract void process(String step) throws Exception;

    public void setInitialContext(InitialContext ctx) {
        this.ctx=ctx;
    }

    InitialContext getInitialContext() {
        return ctx;
    }

    void setNextPage(String nextPage) {
        this.nextPage=nextPage;
    }

    public String getNextPage() {
        return nextPage;
    }

    public String getServletPath() {
        return servletPath;
    }

    public void setServletPath(String servletPath) {
        this.servletPath = servletPath;
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
         throws Exception {
    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception {

    }

    public abstract void setAttributes(String paramName, String paramValues[]);

    public void addError(String key, Object error) {
        if (!hasError(key)) {
            errors.put(key, error);
        }
    }

    public String getError(String key) {
        if (errors.containsKey(key) && errors.get(key) != null) {
            return errors.get(key).toString();
        }
        return "";
    }

    public boolean hasError(String key) {
        return errors.containsKey(key);
    }

    public void removeError(String key) {
        if (hasError(key)) {
            errors.remove(key);
        }
    }

    public void clearErrors() {
        errors.clear();
    }

    public boolean hasErrors() {
        return errors.isEmpty();
    }

    public List getNavLinks() {
        return navLinks;
    }

    boolean isEmpty(String s) {
        return s != null && s.trim().length() > 0;
    }

}

