<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.common.model.SoftwareComponent" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>
<% String type = (String) request.getAttribute(Constants.TYPE_KEY);
    String phaseId = (String) request.getAttribute(Constants.PHASE_ID);
    String coderId = (String) request.getAttribute(Constants.CODER_ID);%>

<head>
    <title>Contest Status</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>


<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="<%= String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(phaseId) ? "m_des_competitions" : "m_dev_competitions"%>"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyText">

    <jsp:include page="/page_title.jsp">
        <jsp:param name="image" value="<%= String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(phaseId) ? "comp_design" : "comp_development"%>"/>
        <jsp:param name="title" value="Reliability Detail"/>
    </jsp:include>

    <span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=coderId%>' context='<%=type%>'/></span>
    <br>
    <% if (phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))) { %>
    <span class="bodySubtitle">Development Statistics&#160;>&#160;</span><br>
    <% } else { %>
    <span class="bodySubtitle">Design Statistics&#160;>&#160;</span><br>
    <% } %>
                <span class="bc">
                <A HREF="/tc?module=MemberProfile&cr=<%=coderId%>" class="bcLink">Member Profile</A>
             | <A HREF="/tc?module=CompetitionHistory&ph=<%=phaseId%>&cr=<%=coderId%>" class="bcLink">Competition
                    History</A>
             | <A HREF="/tc?module=OutstandingProjects&cr=<%=coderId%>&ph=<%=phaseId%>" class="bcLink">Current
                    Contests</A>
                    | Reliability Detail
            </span>


    <table class="stat" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td class="title" colspan="3">Reliability Detail</td>
        </tr>
        <tr>
            <td class="headerC">
                Catalog
            </td>
            <td class="header">
                Contest
            </td>
            <td class="headerC" nowrap="nowrap">
                Reliable
            </td>
            <td class="header" nowrap="nowrap">
                Registration Date
            </td>

        </tr>

        <% boolean even = false; %>
        <rsc:iterator list="<%=contests%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%>">
                <td class="valueC">
                    <% if (resultRow.getItem("aol_brand").getResultData() != null) { %>
                    <img src="/i/development/smAOL.gif"/>
                    <% } else if ("Java".equals(resultRow.getStringItem("catalog_name"))) { %>
                    <img src="/i/development/smJava.gif"/>
                    <% } else if ("Java Custom".equals(resultRow.getStringItem("catalog_name"))) { %>
                    <img src="/i/development/smJavaCustom.gif"/>
                    <% } else if (".NET".equals(resultRow.getStringItem("catalog_name"))) { %>
                    <img src="/i/development/netSm.gif"/>
                    <% } else if (".NET Custom".equals(resultRow.getStringItem("catalog_name"))) { %>
                    <img src="/i/development/smNetCustom.gif"/>
                    <% } else if ("Flash".equals(resultRow.getStringItem("catalog_name"))) { %>
                    <img src="/i/development/flashSm.gif"/>
                    <% } else { %>
                    <rsc:item name="catalog_name" row="<%=resultRow%>"/>
                    <% } %>
                </td>
                <td class="value">
                    <rsc:item name="component_name" row="<%=resultRow%>"/>
                    <rsc:item name="version_text" row="<%=resultRow%>"/>
                </td>
                <td class="valueC">
                    <rsc:item name="reliable" row="<%=resultRow%>"/>
                </td>
                <td class="value">
                    <rsc:item name="create_time" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/>
                </td>
            </tr>
            <% even = !even;%>
        </rsc:iterator>
    </table>

    <p><br/></p>


</td>
<!-- Center Column Ends -->

<!-- Gutter -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<td width="180">
    <jsp:include page="right.jsp"/>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>

