<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import= "com.topcoder.web.query.common.*,
           com.topcoder.web.query.bean.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="ModifyQueryTask" scope="request" class="com.topcoder.web.query.bean.ModifyQueryTask" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder Employment Services</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
  </HEAD>
  <BODY BGCOLOR="#43515E" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0"">
  <jsp:include page="top.jsp" />

  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
      <TD WIDTH="170" bgcolor="#001935" VALIGN="top">
        <TABLE WIDTH="170" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <query:linkIterator id="link" list="<%=ModifyQueryTask.getNavLinks()%>">
            <TR>
              <TD CLASS="statText">
                  <A HREF="<jsp:getProperty name="link" property="href"/>" class="statText"><jsp:getProperty name="link" property="name"/></A>
              </TD>
            </TR>
          </query:linkIterator>
        </TABLE>
      </TD>
      <TD WIDTH="4" BGCOLOR="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD CLASS="statText" WIDTH="100%" BGCOLOR="#001935" VALIGN="top">
        <TABLE WIDTH="60%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <FORM ACTION="<jsp:getProperty name="ModifyQueryTask" property="ServletPath"/>" method="post" name="ModQueryForm" >
            <INPUT TYPE="hidden" NAME="<%=Constants.TASK_PARAM%>" VALUE="<%=Constants.MODIFY_QUERY_TASK%>">
            <INPUT TYPE="hidden" NAME="<%=Constants.QUERY_ID_PARAM%>" VALUE="<jsp:getProperty name="ModifyQueryTask" property="QueryId"/>">
            <INPUT TYPE="hidden" NAME="<%=Constants.STEP_PARAM%>" VALUE="<%=Constants.SAVE_STEP%>">
            <TR><TD CLASS="statTextBig" COLSPAN="2"><%=Constants.MODIFY_QUERY_NAME%></TD></TR>
            <TR>
              <TD CLASS="statText" ALIGN="right" WIDTH="50%">Name: </TD>
              <TD CLASS="statText" ALIGN="left" WIDTH="50%">
                <input type="text" name="<%=Constants.QUERY_NAME_PARAM%>" value ="<jsp:getProperty name="ModifyQueryTask" property="Name" />" size="30" maxlength="100">
              </TD>
            </TR>
            <TR>
              <TD CLASS="statText" ALIGN="right">Ranking: </TD>
              <TD CLASS="statText" ALIGN="left">
                <input type="checkbox" name="<%=Constants.RANKING_PARAM%>" class="bodyText" <%=ModifyQueryTask.isRanking()?"checked":""%>/>
              </TD>
            </TR>
            <TR>
              <TD CLASS="statText" ALIGN="right" WIDTH="50%">Column Index: </TD>
              <TD CLASS="statText" ALIGN="left" WIDTH="50%">
                <input type="text" name="<%=Constants.COLUMN_INDEX_PARAM%>" value ="<jsp:getProperty name="ModifyQueryTask" property="ColumnIndex" />" size="3" maxlength="3">
              </TD>
            </TR>
           <TR>
              <TD CLASS="statText" ALIGN="right">DB: </TD>
              <TD CLASS="statText" ALIGN="left">
                <query:dbSelect name="<%=Constants.DB_PARAM%>" class="dropdown" list="<%=Constants.DB_LIST%>" selectedValue="<%=ModifyQueryTask.getDb()%>"/>
              </TD>
            </TR>
           <TR>
              <TD CLASS="statText" ALIGN="right">Query Text: </TD>
              <TD CLASS="statText" ALIGN="left">
                <textarea cols="80" rows="30" name="<%=Constants.QUERY_TEXT_PARAM%>"><jsp:getProperty name="ModifyQueryTask" property="Text"/></textarea>
              </TD>
            </TR>
            <TR>
              <TD CLASS="statText" ALIGN="center" COLSPAN="2">
                <A HREF="javascript:void document.ModQueryForm.submit()" CLASS="statText">
                  [save]
                </A>
              </TD>
            </TR>
          <FORM>
        </TABLE>
      </TD>
      <TD WIDTH="4" BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
      <TD WIDTH="10" BGCOLOR="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
      </TD>
      <TD WIDTH="25" BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
    </TR>
  </TABLE>
  </BODY>
</HTML>
