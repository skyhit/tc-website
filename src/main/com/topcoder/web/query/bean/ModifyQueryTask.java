package com.topcoder.web.query.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.Authentication;
import com.topcoder.web.query.common.LinkBean;
import com.topcoder.web.query.ejb.QueryServices.*;
import com.topcoder.shared.util.ApplicationServer;


import javax.servlet.http.*;
import java.io.Serializable;

/**
 * @author Greg Paul
 *
 */

public class ModifyQueryTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(ModifyQueryTask.class);

    private String db;
    private long queryId;
    private boolean ranking;
    private int columnIndex;
    private String text;
    private String name;

    /* Creates a new LoginTask */
    public ModifyQueryTask() {
        super();
        setQueryId(0);
        setRanking(false);
        setColumnIndex(0);
        setText("");
        setName("");
    }


	public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException, Exception {
        HttpSession session = request.getSession(true);
        if (!Authentication.isLoggedIn(session)) {
            log.debug("User not authenticated for access to TCES resource.");
            throw new AuthenticationException("User not authenticated for access to TCES resource.");
        }
	}

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String begin = getServletPath()+"?"+Constants.TASK_PARAM+"=";
        String end = "&"+Constants.DB_PARAM+"="+getDb();
        StringBuffer buf = new StringBuffer();
        buf.append(begin);
        buf.append(Constants.DB_SELECTION_TASK);
        super.getNavLinks().add(new LinkBean(buf.toString(), Constants.DB_SELECTION_NAME));
        buf.setLength(0);
        buf.append(begin);
        buf.append(Constants.COMMAND_LIST_TASK);
        buf.append(end);
        super.getNavLinks().add(new LinkBean(buf.toString(), Constants.COMMAND_LIST_NAME));
        buf.setLength(0);
        buf.append(begin);
        buf.append(Constants.MODIFY_COMMAND_TASK);
        buf.append(end);
        super.getNavLinks().add(new LinkBean(buf.toString(), "New Command"));
        buf.setLength(0);
        buf.append(begin);
        buf.append(Constants.MODIFY_QUERY_TASK);
        buf.append(end);
        super.getNavLinks().add(new LinkBean(buf.toString(), "New Query"));
        buf.setLength(0);
        buf.append(begin);
        buf.append(Constants.MODIFY_INPUT_TASK);
        buf.append(end);
        super.getNavLinks().add(new LinkBean(buf.toString(), "New Input"));    }

    public void process(String step) throws Exception {
        QueryHome qHome = (QueryHome) getInitialContext().lookup(ApplicationServer.Q_QUERY);
        Query q = qHome.create();

        q.setDataSource(getDb());

        if (step!=null && step.equals(Constants.SAVE_STEP)) {
            checkColumnIndex(getColumnIndex());
            checkText(getText());
            checkName(getName());
            if (!super.hasErrors()) {
                if (isNewQuery()) {
                    q.createQuery(getText(), getName(), isRanking()?1:0, getColumnIndex());
                } else {
                    q.setColumnIndex(getQueryId(), getColumnIndex());
                    q.setText(getQueryId(), getText());
                    q.setName(getQueryId(), getName());
                    q.setRanking(getQueryId(), isRanking()?1:0);
                }
            }
        } else {
            if (!isNewQuery()) {
                setColumnIndex(q.getColumnIndex(getQueryId()));
                setText(q.getText(getQueryId()));
                setName(q.getName(getQueryId()));
                setRanking(q.getRanking(getQueryId())==1?true:false);
            }

        }

        super.setNextPage(Constants.MODIFY_QUERY_PAGE);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());
        log.debug("setAttributes called...param: " + paramName + " value: " + value);

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM)) {
            setDb(value);
        } else if (paramName.equalsIgnoreCase(Constants.QUERY_ID_PARAM)) {
            try {
                setQueryId(Long.parseLong(value));
            } catch (NumberFormatException e) {
                super.addError(Constants.QUERY_ID_PARAM, e);
            }
        } else if (paramName.equalsIgnoreCase(Constants.QUERY_NAME_PARAM)) {
            setName(value);
        } else if (paramName.equalsIgnoreCase(Constants.RANKING_PARAM)) {
            setRanking(Boolean.getBoolean(value));
        } else if (paramName.equalsIgnoreCase(Constants.COLUMN_INDEX_PARAM)) {
            try {
                setColumnIndex(Integer.parseInt(value));
            } catch (NumberFormatException e) {
                super.addError(Constants.COLUMN_INDEX_PARAM, e);
            }
        } else if (paramName.equalsIgnoreCase(Constants.QUERY_TEXT_PARAM)) {
            setText(value);
        }

    }

    private void checkName(String name) {
        if (super.isEmpty(name)) {
            super.addError(Constants.QUERY_NAME_PARAM, "Invalid Query Name");
        }
    }

    private void checkColumnIndex(int columnIndex) {
        if (columnIndex < 0) {
            super.addError(Constants.COLUMN_INDEX_PARAM, "Invalid Query Name");
        }
    }

    private void checkText(String text) {
        if (super.isEmpty(text)) {
            super.addError(Constants.QUERY_TEXT_PARAM, "No text specified");
        } else if (!text.trim().toLowerCase().startsWith("select")) {
            super.addError(Constants.QUERY_TEXT_PARAM, "Invalild query entered");
        }
    }

    private boolean isNewQuery() {
        return getQueryId()==0;
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public long getQueryId() {
        return queryId;
    }

    public void setQueryId(long queryId) {
        this.queryId = queryId;
    }

    public boolean isRanking() {
        return ranking;
    }

    public void setRanking(boolean ranking) {
        this.ranking = ranking;
    }

    public int getColumnIndex() {
        return columnIndex;
    }

    public void setColumnIndex(int columnIndex) {
        this.columnIndex = columnIndex;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}


