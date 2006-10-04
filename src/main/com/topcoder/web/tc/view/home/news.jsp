<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<table border="0" cellspacing="0" cellpadding="0" width="525">
<tr>
    <td class="newsTitle" align="right" colspan="2"><i>TopCoder News</i></td>
</tr>
<%----------------------------
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0"/><br>10.04.06<br>5:00 PM</td>
     <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=SurveyResults&sid=220">andrey_atlas is the TCHS07 Logo Contest Winner!</A></span><br><br>
        Congratulations to andrey_atlas!
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=SurveyResults&sid=220">results</A> | 
        <tc-webtag:forumLink forumID="506125" message="discuss this"/> |
        <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>
----------------------------%>
<%--------------------------------------------------------%>
   <tr>
       <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/headphones.gif" alt="Podcasts" border="0"/><br>10.04.06<br>12:00 Noon</td>
       <td class="newsTextCell"><span class="newsTitle"><A href="/audio/open_source_060928_48kb.mp3" target="_blank">TopCoder featured on public radio's "Open Source"</A> [PODCAST]</span><br><br>
       <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/opensource_logo.gif" width="68" height="23" alt="Open Source" border="0" /></div>
       Jack Hughes joined <i>Mavericks at Work</i> author William Taylor and host Christopher Lydon to discuss TopCoder's "maverick" approach. Stream the mp3:
      </td>
   </tr>
   <tr><td class="newsLinksCell">
       <A href="/audio/open_source_060928_24kb.mp3" target="_blank">lo 6.8mb</A> &#160;|&#160;
       <A href="/audio/open_source_060928_48kb.mp3" target="_blank">hi 13.8mb</A> &#160;|&#160;
       <A href="/images/downloads/mavericks_at_work.pdf" target="_blank">Mavericks at Work excerpt</A> [PDF] &#160;|&#160;
       <tc-webtag:forumLink forumID="506134" message="discuss this" />&#160;|&#160;
       <A href="/tc?module=Static&d1=pressroom&d2=art_archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/comp.gif" alt="Component Competition News" border="0" /><br>10.04.06<br>11:00 AM</td>
      <td class="newsTextCell"><span class="newsTitle">
        <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2040">UML Tool Icons contest over at the Studio</A>
        </span><br><br>
      At TopCoder Studio, we're running a contest to design a set of application icons for our UML tool that's currently in development.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2040">details</A> | 
         <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums?module=ThreadList&forumID=17">discuss this</A> | 
         <A href="/tc?module=Static&d1=home&d2=news_archive_comp">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/alg.gif" alt="Algorithm Competition News" border="0" /><br>10.03.06<br>6:00 PM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=Static&d1=statistics&d2=recordbook_home">2 new fields in the Algorithm Record Book</A></span><br><br>
      We recently added <A href="/stat?c=rated_events">Most Rated Events</A> and <A href="/stat?c=successful_challenges">Challenge Success for a Single Match</A> to the Algorithm Record Book.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=statistics&d2=recordbook_home">Record Book</A> | 
        <tc-webtag:forumLink forumID="506133" message="discuss this"/> |
        <A href="/tc?module=Static&d1=home&d2=news_archive_alg">archive</A>
   </td>
</tr>

<%--------------------------------------------------------%>
<tr>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/analysis.gif" alt="Problem Set & Analysis" border="0"/>
        <br>10.03.06<br>3:30 PM</td>
    <td class="newsTextCell">
        <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
            <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=match_editorials&d2=srm321">SRM 321 -
                Problem Set & Analysis</A></span><br><br>
This SRM gave coders still in the running for the TCCC one more chance to practice for the second
online round.
            </td>
            <td class="newsPhoto"><img src="/i/m/krijgertje_big.jpg" alt="" width="55" height="61"/><br>by
                <tc-webtag:handle coderId="9906197" context="algorithm"/></td></tr></table>
    </td>
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=Static&d1=match_editorials&d2=srm321">full story</A> |
    <tc-webtag:forumLink forumID="505995" message="discuss this"/> |
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
</td></tr>

<%--------------------------------------------------------%>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/education.gif" alt="Educational Content" border="0"/>
        <br>10.03.06<br>9:50 AM</td>
    <td class="newsTextCell">
        <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
            <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&amp;d1=features&amp;d2=100206">Design Patterns in C++</A></span><br><br>
               This article will examine several design patterns affected by modern C++ practices and present some of their manifestations in generic 
               C++ code, along with a few examples of how parts of some TopCoder components may look like in C++.</td>
            <td class="newsPhoto">by <tc-webtag:handle coderId="21195715"/></td></tr>
        </table>
    </td>
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=Static&amp;d1=features&amp;d2=100206">article</A> |
    <tc-webtag:forumLink forumID="506131" message="discuss this"/> |
    <A href="/tc?module=Static&d1=features&d2=archive">archive</A>
</td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/comp.gif" alt="Component Competition News" border="0" /><br>10.03.06<br>10:00 AM</td>
      <td class="newsTextCell"><span class="newsTitle">Appeals statistics on member profiles and <A href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home">Record Book</A></span><br><br>
      We've added "Appeals" and "Appeals Success Rate" to the member profiles for component design and development, as well as new <A href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home">Record Book</A> listings for "Highest Appeal Success Percentage".
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home">Record Book</A> | 
         <tc-webtag:forumLink forumID="506132" message="discuss this" /> | 
         <A href="/tc?module=Static&d1=home&d2=news_archive_comp">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0"/><br>10.02.06<br>5:00 PM</td>
     <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa">NSA SRM 321 chat session</A></span><br><br>
      NSA will be in the arena tonight at 8:00 PM, just prior to SRM 321, to discuss working there.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
    <tc-webtag:forumLink forumID="504999" message="discuss this"/> |
     <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tc.gif" alt="General Competition News" border="0" /><br>10.02.06<br>2:00 PM</td>
      <td class="newsTextCell"><span class="newsTitle">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=513341">TopCoder is turning 100!</A>
      </span><br><br>
      We're compiling a special feature to celebrate TopCoder's 100,000th member (coming soon), and we need your help. Answer this question: What is the one theory, term, or tactic that you most rely on, and that is most responsible for making you a better coder?
   </tr>
   <tr><td class="newsLinksCell">
         <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=513341">discuss this</A> | 
         <A href="/tc?module=Static&d1=home&d2=news_archive_tc">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/marathon.gif" alt="Marathon Match News" border="0" /><br>10.02.06<br>1:30 PM</td>
      <td class="newsTextCell"><span class="newsTitle">
      <A href="/longcontest/?module=ViewOverview&rd=10105">Intel&#174; Multi-Threading Competition 9 Results</A>
      </span><br><br>
      Congratulations to <tc-webtag:handle coderId="15600321" /> for winning the Intel&#174; Multi-Threading Competition 9.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/longcontest/?module=ViewOverview&rd=10105">results</A> | 
         <tc-webtag:forumLink forumID="506106" message="discuss this" /> | 
         <A href="/tc?module=Static&d1=home&d2=news_archive_long">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
<tr>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/analysis.gif" alt="Problem Set & Analysis" border="0"/>
        <br>10.02.06<br>11:00 AM</td>
    <td class="newsTextCell">
        <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
            <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=match_editorials&d2=srm320">SRM 320 -
                Problem Set & Analysis</A></span><br><br>
With TCCC and GCJ matches filling up the whole month, this was
only the second -- and also the last SRM -- of September.
            </td>
            <td class="newsPhoto"><img src="/i/m/lyc1977_big3.jpg" alt="" width="55" height="61"/><br>by
                <tc-webtag:handle coderId="7488783" context="algorithm"/></td></tr></table>
    </td>
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=Static&d1=match_editorials&d2=srm320">full story</A> |
    <tc-webtag:forumLink forumID="505995" message="discuss this"/> |
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
</td></tr>

<%--------------------------------------------------------%>
<tr>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/analysis.gif" alt="Problem Set & Analysis" border="0"/>
        <br>09.29.06<br>1:30 PM</td>
    <td class="newsTextCell">
        <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
            <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=match_editorials&d2=tccc06_online_rd_1c">TCCC06 Online Round 1-C -
                Problem Set & Analysis</A></span><br><br>
The score distribution in this round seems similar to the ones in rounds 1-A and 1-B. The problems were balanced, with the exception of the hard problem, which was solved only by two people.
            </td>
            <td class="newsPhoto"><img src="/i/m/Cosmin.ro_big.jpg" alt="" width="55" height="61"/><br>by
                <tc-webtag:handle coderId="303185" context="algorithm"/></td></tr></table>
    </td>
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=Static&d1=match_editorials&d2=tccc06_online_rd_1c">full story</A> |
    <tc-webtag:forumLink forumID="506109" message="discuss this"/> |
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
</td></tr>

