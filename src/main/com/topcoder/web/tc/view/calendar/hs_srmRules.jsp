<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<%
    ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    int round_id = rsr.getIntItem("round_id");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<HEAD>
    <TITLE>TopCoder :: Schedule</TITLE>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="/script.jsp"/>
</HEAD>

<body>
<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<!-- Body Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="../includes/global_left.jsp">
        <jsp:param name="node" value="m_algo_competitions"/>
    </jsp:include>
</td>
<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="schedule"/>
    <jsp:param name="title" value="SRM Official Rules & Qualification"/>
</jsp:include>




   <span class="bigRed">
       <b>
           <rsc:item name="contest_name" row="<%=rsr%>"/>
           <br>
           Official Rules and Regulations
       </b>
   </span>
<br>
No purchase necessary to enter or win. Void where prohibited.
<br/><br/>

<b>Rooms</b>

<p>Each competition room will have a maximum of 25 coders. Room assignments will be random, however,
    they will be weighted in such a way that members of the same team are more likely to each end up in different
    rooms.</p>


<b>About the Single Round Match</b><br/>
<ul>
    <li><b>When to start the Single Round Match (SRM)</b><br/>
        TopCoder High School (TCHS) members must register for the SRM. Registration is from <rsc:item name="reg_begin"
                                                                                                      row="<%=rsr%>"/>
        to <rsc:item name="reg_end" row="<%=rsr%>"/>. To register, login
        to the TopCoder High School Arena application, click on the 'Active Contests' menu, choose the SRM to
        register for, and select the 'Register' option. TCHS members from all over the world may be participating in
        this SRM, but all start times will be communicated as Eastern Time, so contestants in different time zones must
        adjust accordingly. All competitors who have registered for the competition will be assigned to a specific
        competition room. TopCoder will perform the room assignments prior to the start of the competition.
    </li>
    <li>
        <b>Upon Entering the SRM</b><br/>
        Each SRM consists of three phases: Coding Phase, Challenge Phase, and Testing Phase.
        <p><b>The Coding Phase</b> is a timed event where all contestants are presented with the same three questions
            representing three levels of complexity and, accordingly, three levels of point earnings potential. Points
            for a problem are awarded upon submission of any solution that successfully compiles.</p>

        <p><b>The Challenge Phase</b> is a timed event wherein each competitor has a chance to challenge the
            functionality
            of other competitors' code. A successful challenge will award 50 points to the challenger, and any points
            gained by the submitter for the problem will be lost. Unsuccessful challenges will cost the challenger 25
            points as a penalty, applied to their total score in that round of competition.</p>

        <p><b>The Testing Phase</b> is applied to all submitted code that has not already been successfully challenged.
            If TopCoder finds code that is flawed, the author of that code submission will lose all of the points they
            earned for that code submission. The automated tester will apply a set of inputs, expecting the output from
            the code submission to be correct. If the output from a coder's submission does not match the expected
            output,
            the submission is considered flawed. The same set of input/output test cases will be applied to all code
            submissions for a given problem. Any correct challenges from the Challenge Phase will be used in the Testing
            Phase.</p>
    </li>
    <li>
        <b>Scoring during SRMs</b><br/>

        <p>All team members and individuals who opened any problem during the SRM will have their ratings adjusted up or
            down to reflect their performance, based on TopCoder's rating formula. Contestant ratings play no role in
            a Coder's final standing in the competition room.</p>
    </li>
</ul>

<b>Conditions of Participation</b><br/>
By participating in the SRM, you agree to be bound by these rules and to all decisions of TopCoder, which are final,
binding and conclusive in all matters.

<p class="bigReg">Contestants must not cheat. All ideas for code and/or challenge submitted must be the contestant's
    alone. TopCoder
    uses the word "cheat" to mean collaboration of any sort – including, but not limited to, working with another
    competitor, submitting code that was not fully authored by you, and using resources, software, etc. that
    are not allowed in TopCoder competitions. TopCoder reserves the right, in its sole discretion, to remove any
    competitor from the tournament who it suspects has cheated.</p>

<p>All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining
    to
    the SRM shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all
    respects.</p>

<p>By participating in this SRM, contestants release and agree to hold harmless TopCoder, its affiliates, subsidiaries,
    sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers,
    employees, representatives and agents, from and against any and all liability for any loss, property damage or
    damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly,
    from or arising out of participation in this SRM, or participation in any SRM-related activity, or the receipt,
    use or misuse of a prize.</p>

<p>TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the entry process,
    the operation of the Web site, the contest process, or is otherwise in violation of the rules. TopCoder reserves
    the right to cancel, terminate or modify the SRM if it is not capable of completion as planned for any reason,
    including
    infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</p>


<b>Participants</b><br/>
The SRM is open to all TCHS members who are between the ages of 13 and 20, inclusive, pursuing a secondary school
education and not matriculated full time at a college or university.

<p>All competitors must be registered members of TopCoder High School and must have agreed to the rules on this page by
    the <rsc:item name="reg_date" row="<%=rsr%>"/>&#160;<rsc:item name="reg_end" row="<%=rsr%>"/> registration
    deadline.</p>

<p>Employees of TopCoder and those involved in the development, production (including prize suppliers and sponsors),
    implementation and distribution of this SRM and their advertising or promotion agencies, parent companies,
    service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly
    associated
    with the SRM and members of the immediate families and/or persons living in the same household as such persons,
    are ineligible to enter the SRM.
</p>

<b>Other</b><br/>

<p>The SRM is void in whole or in part where prohibited by law.</p>

<p>A list of competitor handles for all SRMs will be available on the web site at
    http://www.topcoder.com displayed for at least 3 months after the end of the SRM.</p>

<p>This SRM is brought to you by TopCoder, Inc., 703 Hebron Ave, Glastonbury, CT 06033.</p>


</TD>
<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br>
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</TD>
</TR>
</TABLE>
<!-- Gutter Begins -->
<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
<!-- Gutter Ends -->
</TR>
</TABLE>

<jsp:include page="/foot.jsp"/>

</BODY>

</HTML>