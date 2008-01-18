<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />

<style TYPE="text/css">
html{ 
margin:0px;
padding:0px;
font-family: Arial, Verdana, Helvetica, sans-serif;
}

body{ 
font-family: Arial, Verdana, Helvetica, sans-serif;
line-height: normal;
font-size: 12px;
color: #ffffff;
background: #000000;
margin:0px;
padding:0px;
}

img{
border: none;
display: block;
}

h1{
font-style: italic;
font-size: 125%;
}

p{
padding: 0px;
margin: 0px 0px 10px 0px;
}

td, th{ 
line-height: normal;
font-size: 12px;
}

#contentOut{
width: 700px;
margin: 0;
background: transparent url(/i/tournament/tco08/rsvpBGStretch.png) top center repeat-y;
border-top: 1px solid black;
}

#contentIn{
background: transparent url(/i/tournament/tco08/rsvpBG.jpg) top center no-repeat;
border-top: 1px solid black;
padding: 40px 10px;
}

#contentBottom{
 font-size: 1px;
 height: 10px;
 margin-bottom: 20px;
 background: transparent url(/i/tournament/tco08/rsvpBGBottom.png) bottom center no-repeat;
}

a:link, a:visited {
    text-decoration: none;
    color: #ac1414;
}

a:hover, a:active {
    text-decoration: underline;
    color: #FFF;
}
</style>

</head>
<body>


<div align="center" style="background: transparent;">
    <div id="contentOut">
        <div id="contentIn">

            <div align="center" style="margin: 20px;">
                <img src="/i/tournament/tco08/rsvpBanner.png" alt="2008 TopCoder Open" />
            </div>
 
            <p style="margin: 40px 0px 60px 0px;">
            <%-- IF THE RESPONSE WAS YES --%>
                <strong>Thank you for your response. We look forward to seeing you in Las Vegas.</strong>
            <%-- IF THE RESPONSE WAS NO --%>
                <strong>Thank you for your response.  We're sorry we won't see you in Las Vegas in May.  We look forward to seeing you at a future TopCoder event.</strong>
            </p>
    
        </div>

        <div id="contentBottom">&nbsp;</div>

    </div>
</div>


</body>

</html>
