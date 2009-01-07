<%@  page language="java"
    import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,com.topcoder.shared.util.ApplicationServer,
          com.topcoder.web.common.StringUtils"%>

<%@ page import="java.util.Map"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Member Profile</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</head>
<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="m_competitions"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Member Profile"/>
</jsp:include>


<% ResultSetContainer rscCoderData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Data");
  boolean registeredHS = ((Boolean)request.getAttribute("registeredHS")).booleanValue();
  boolean memberContactEnabled = ((Boolean)request.getAttribute("memberContactEnabled")).booleanValue();
  boolean hidePayments = ((Boolean)request.getAttribute("hidePayments")).booleanValue();
%>

<% if(rscCoderData.size() == 0) {%>
This member has not yet been rated in a competition.
<% } else { %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr><td class="tableTitle" colspan="3">&#160;</td></tr>
   <tr>
      <td class="photoCell">
   <%if (rscCoderData.getItem(0,"has_image").toString().equals("1")) { %>
      <IMG SRC='<rsc:item name="image_path" set="<%=rscCoderData%>"/>' class="memberPhoto" />
   <% } else { %>
      <a href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto"><img SRC="/i/m/nophoto_login.gif" class="memberPhoto"/></a>
   <% } %>
      </td>
      <td valign="top">
         <table cellpadding="0" cellspacing="0" border="0" class="statTable">
            <tr><td class="handleCell" colspan="2">
                <tc-webtags:handle coderId='<%=rscCoderData.getStringItem(0, "coder_id")%>'/></td></tr>
            <tr><td class="cat" nowrap="nowrap">Algorithm Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "rating") != null && rscCoderData.getIntItem(0, "rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "rating")%>'>
                <rsc:item name="rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
<% if (registeredHS) { %>
            <tr><td class="cat" nowrap="nowrap">High School Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "hs_rating") != null && rscCoderData.getIntItem(0, "hs_rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "hs_rating")%>'>
                <rsc:item name="hs_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
<% } %>

            <tr><td class="cat" nowrap="nowrap">Design Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "design_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "design_rating")%>'>
                <rsc:item name="design_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Development Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "development_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "development_rating")%>'>
                <rsc:item name="development_rating" set="<%=rscCoderData%>" format="####"/>
                </tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Marathon Matches Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "mm_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "mm_rating")%>'>
                <rsc:item name="mm_rating" set="<%=rscCoderData%>" format="####"/>
                </tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" colspan="2">&#160;</td></tr>
<% if (!registeredHS || (rscCoderData.getStringItem(0, "rating") != null) || (rscCoderData.getStringItem(0, "design_rating") != null) || (rscCoderData.getStringItem(0, "development_rating") != null)) { %>
            <% if(!hidePayments) { %>
            <tr><td class="cat" nowrap="nowrap">Total Earnings:</td><td class="stat" align="right">
                <% if (rscCoderData.getItem(0, "overall_earnings").getResultData() == null || rscCoderData.getDoubleItem(0, "overall_earnings") > 0) { %>
                <A href="/tc?module=PaymentSummary&cr=<%=rscCoderData.getStringItem(0, "coder_id")%>">
                <% } %>
                    <rsc:item name="overall_earnings" set="<%=rscCoderData%>" format="$#,##0.00"/>
                <% if (rscCoderData.getItem(0, "overall_earnings").getResultData() == null || rscCoderData.getDoubleItem(0, "overall_earnings") > 0) { %>
                </A>
                <% } %>
                </td></tr>
            <% } %>
<% } %>
            <tr><td class="cat" nowrap="nowrap">Member Since:</td><td class="stat" align="right">
            <rsc:item name="member_since" set="<%=rscCoderData%>" format="MM.dd.yyyy"/></td></tr>
             <% if (rscCoderData.getItem(0, "country_name").getResultData()!=null) { %>
            <tr><td class="cat">Country:</td><td class="stat" align="right"><div style="width: 100px;">
            <rsc:item name="country_name" set="<%=rscCoderData%>"/></div></td></tr>
             <% } %>
            <% if (rscCoderData.getStringItem(0,"school_name")!=null) { %>
            <tr><td class="cat">School:</td><td class="stat" align="right">
            <rsc:item name="school_name" set="<%=rscCoderData%>"/></td></tr>
            <% }%>
            <tr><td class="cat" colspan="2">
            <% if(memberContactEnabled) { %>
                <A href="/tc?module=MemberContact&th=<%=rscCoderData.getStringItem(0, "handle")%>">[Send a message]</A><br>
            <% } %>
            <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=History&userID=<%=rscCoderData.getStringItem(0, "coder_id")%>">[Forum post history]</A><br>
             <% if (rscCoderData.getIntItem(0, "has_achievements")>0) { %>
             <A href="/tc?module=SimpleStats&c=coder_achievements&d1=statistics&d2=coderAchievements&cr=<%=rscCoderData.getStringItem(0, "coder_id")%>">[Achievements]</A>
             <% } %>
            </td></tr>
         </table>
      </td>
      <td class="quoteCell">
        <% if(!"".equals(StringUtils.checkNull(rscCoderData.getStringItem(0,"quote")))) {%>
        <div class="quoteBox"><span class="quoteTitle">Quote:</span><br><br>
        <div align="center">"<%=StringUtils.htmlEncode(rscCoderData.getStringItem(0, "quote"))%>"</div></div>
        <%}%>
      </td>
   <tr>
</table>

<br>
<!-- Tab barlinks-->
<%
    String tab = (String)request.getAttribute("tab");
    if(tab.equals("")) {
%>
        This member has not been rated in any events.
<%    } else if(tab.equals("alg")) {%>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabAlg.jsp" />
<% } else if(tab.equals("hs")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabHS.jsp" />
<% } else if(tab.equals("des")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabDes.jsp" />
<% } else if(tab.equals("dev")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabDev.jsp" />
<% } else if(tab.equals("long")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabLong.jsp" />
<% }%>
<% }%>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>