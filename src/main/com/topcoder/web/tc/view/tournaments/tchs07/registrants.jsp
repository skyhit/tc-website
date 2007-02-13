<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
<head> 
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/coders.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tchs07.css"/>
    <title>TopCoder High School 2007</title> 
</head>
<body>

<% ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("list")); %>

<div align="center" style="background: transparent;">
    <div class="content">
        <img src="/i/tournament/tchs07/contentN.png" alt="contentN" style="display: block;" />

        <jsp:include page="links.jsp" >
        <jsp:param name="tabLev1" value="registrants"/>
        <jsp:param name="tabLev2" value=""/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <div class="contentSpacer">
          <h2>Registrants</h2>
          
<div align="center">
    
                    <table class="formFrame" border="0" cellpadding="6" cellspacing="0" width="300">
                    <tbody><tr>
                        <td class="advTitle" colspan="3" width="100%">Registrants (<%=rsc.size()%>)</td>
                    </tr>
                        <tr class="advHeader">
                            <td align="left">
                                <a href="/tc?module=TCCC06AlgRegistrants<tc-webtag:sort column="<%=rsc.getColumnIndex("rank")%>"/>">Rank</a>
                            </td>
                            <td align="left" width="100%">
                                <a href="/tc?module=TCCC06AlgRegistrants<tc-webtag:sort column="<%=rsc.getColumnIndex("handle_lower")%>"/>">Handle</a>
                            </td>
                            <td align="right">
                                <a href="/tc?module=TCCC06AlgRegistrants<tc-webtag:sort column="<%=rsc.getColumnIndex("rating")%>"/>">Rating</a>
                            </td>
                        </tr>
                        <%boolean even = false;%>
<rsc:iterator list='<%=rsc%>' id="resultRow"><tr><td class="<%=(even ? "advanceDk" : "advanceLt")%>">
<rsc:item name="rank" row='<%=resultRow%>'/></td>
<td class="<%=(even ? "advanceDk" : "advanceLt")%>">
<tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="algorithm" darkBG="true"/></td>
<td class="<%=(even ? "advanceDk" : "advanceLt")%>" align="right">
<rsc:item format="###0" ifNull="Unrated" name="rating" row='<%=resultRow%>'/></td>
</tr><%even = !even;%></rsc:iterator>
                </table>



<table cellpadding="0" cellspacing="0" class="stat" style="width:400px; margin-bottom: 100px;">
<thead>
    <tr><td class="title" colspan="3">Registrants: <%=rsc.size()%></td></tr>
    <tr>
        <td class="headerC">
            <A href="sortbyrank">Rank</A>
        </td>
        <td class="header" width="100%">
            <a href="/tc?module=TCHS07Registrants<tc-webtag:sort column="<%=rsc.getColumnIndex("handle_lower")%>"/>">Handle</a>
        </td>
        <td class="headerR">
            <a href="/tc?module=TCHS07Registrants<tc-webtag:sort column="<%=rsc.getColumnIndex("rating")%>"/>">Rating</a>
        </td>
    </tr>
</thead>
<tbody>
        <%boolean even = false;%>
        <rsc:iterator list='<%=rsc%>' id="resultRow">
            <tr class="<%=(even ? "dark" : "light")%>">
                <td class="value">
                    <tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="algorithm" darkBG="true"/>
                </td>
                <td class="valueR">
                    <rsc:item format="###0" ifNull="Unrated" name="rating" row='<%=resultRow%>'/>
                </td>
            </tr>
        <%even = !even;%></rsc:iterator>
</tbody>
</table>
</div>


        </div>
        <div class="footer">
            Copyright &#169; 2000-2006, TopCoder, Inc. All rights reserved.
        </div>
        <img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
    </div>
</div>

</body> 
</html>

