<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>  
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/stats_intro.xsl"/>  
    <xsl:import href="../includes/global_left.xsl"/> 
    <xsl:import href="../includes/dev/public_dev_right.xsl"/>     
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

    <xsl:call-template name="Preload"/>      

<title>Component Documentation and Sample Submissions for TopCoder Software Development</title>

    <xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<BODY>

<!-- Header Begins -->
    <xsl:call-template name="Top"/>
<!-- Header Begins -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">components</xsl:with-param>
                <xsl:with-param name="level3">tcs_sample_docs</xsl:with-param>
            </xsl:call-template>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
            <td width="15" valign="top"><img src="/i/clear.gif" width="15" height="5" alt="" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
            <td class="bodyText" width="100%" valign="top">
                <xsl:call-template name="BodyTop">
                    <xsl:with-param name="image1">white</xsl:with-param>
                    <xsl:with-param name="image">development</xsl:with-param>
                    <xsl:with-param name="title">&#160;Components</xsl:with-param>
                </xsl:call-template>
                
            <img src="/i/clear.gif" alt="" width="240" height="20" border="0"/><br />
                            
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle"><td bgcolor="#999999" class="registerNav" colspan="3"><font size="3">Component Documentation</font></td></tr>
                                
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="49%" height="18">Description</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="5" height="18"><img src="/i/clear.gif" alt="" height="1" width="5" border="0" /></td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="59%" height="18">Modified&#160;&#160;&#160;&#160;&#160; Download File</td>
                </tr>
                                
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td class="bodyText" valign="top"><strong>TopCoder Software Development Environment</strong><br />
                        The TopCoder Software Development Environment is intended to facilitate the component design and 
                        development process.  Anyone interested in working on component design or development 
                        should download this file and configure their environment before getting started.</td>
                    <td></td>
                    <td class="bodyText" valign="top"><br />
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td class="bodyText">05.28.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/topcoder_env.jar" class="bodyText">topcoder_env.jar</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>    

                <tr><td colspan="3"><hr width="100%" size="1px" color="666666" /></td></tr>
                                
                <tr valign="middle">
                    <td class="bodyText" valign="top"><strong>TopCoder Software Component Guidelines</strong><br />
                        The TopCoder Software Component Guidelines provide details required to design and develop TopCoder Software components. This document includes supported versions of software tools and coding standards.</td>
                    <td></td>
                    <td class="bodyText" valign="top"><br />
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td class="bodyText">11.10.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/TopCoder_Software_Component_Guidelines.pdf" class="bodyText">TopCoder Software Component Guidelines.pdf</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>    

                <tr><td colspan="3"><hr width="100%" size="1px" color="666666" /></td></tr>
                                
                <tr valign="middle">
                    <td class="bodyText" valign="top"><strong>TopCoder Software Component Tutorials</strong><br />
The TopCoder Component Tutorials provide detailed handbooks from two of TopCoder Software's review board members on writing TopCoder Software components.</td> 
                    <td></td>
                    <td class="bodyText" valign="top"><br />
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td class="bodyText">11.6.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/TopCoder_Software_Component_Design_Tutorial_1.pdf" class="bodyText">Component Design Tutorial.pdf</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="bodyText">11.6.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/TopCoder_Software_Component_Development_Tutorial.pdf" class="bodyText">Component Development Tutorial.pdf</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>    


                <tr><td colspan="3"><hr width="100%" size="1px" color="666666" /></td></tr>

                <tr valign="middle">
                    <td class="bodyText" valign="top"><strong>Design Deliverables</strong><br />
                        Java and .NET Design Deliverables provide an overview of the design process including the required deliverables for submission and the responsibilities of the winning designer. The Architecture Review Board will not review submissions that do not meet the screening requirements.</td>
                    <td></td>
                    <td class="bodyText" valign="top"><br />
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td class="bodyText">11.10.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/Java_Designer_Component_Deliverables.pdf" class="bodyText">Java Design Deliverables.pdf</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="bodyText">11.10.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/DOTNET_Designer_Component_Deliverables.pdf" class="bodyText">.NET Design Deliverables.pdf</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                                
                <tr><td colspan="3"><hr width="100%" size="1px" color="666666" /></td></tr>
                                
                <tr valign="middle">
                    <td class="bodyText" valign="top"><strong>Development Deliverables</strong><br />
                        Development Deliverables provide an overview of the development process including the required deliverables for submission. The Development Review Board will not review submissions that do not meet the screening requirements.</td>
                    <td></td>
                    <td class="bodyText" valign="top"><br />
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td class="bodyText">11.10.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/Java_Developer_Component_Deliverables.pdf" class="bodyText">Java Development Deliverables.pdf</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="bodyText">11.10.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/DOTNET_Developer_Component_Deliverables.pdf" class="bodyText">.NET Development Deliverables.pdf</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                                
                <tr><td colspan="3"><hr width="100%" size="1px" color="666666" /></td></tr>
                                
                <tr valign="middle">
                    <td class="bodyText" valign="top"><strong>Component Specification</strong><br />
                        The purpose of the Component Specification is to provide additional details about the design, including implementation details that may not be covered in the UML diagrams. This template should be filled out and submitted with each design submission.<br/><br />
                    </td>
                    <td></td>
                    <td class="bodyText" valign="top"><br />
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td class="bodyText">08.28.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/Component_Specification.rtf" class="bodyText">Component Specification.rtf</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr><td colspan="3"><hr width="100%" size="1px" color="666666" /></td></tr>
                                
                <tr valign="middle">
                    <td class="bodyText" height="15" valign="top"><strong>Screening and Review Scorecards</strong><br />
                        The screening and review scorecards are used by the Architecture and Development Review Boards to score component 
                        submissions. All members who submit a design or development solution will be able to log in to TopCoder Software Project
                        Submit &amp; Review and view their corresponding project's screening and review scorecards.  These are sample screen shots 
                        from the Submit &amp; Review application.
                    </td>
                    <td></td>
                    <td class="bodyText" valign="top"><br />
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td class="bodyText">11.10.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/Sample_Design_Screening_Scorecard.pdf" class="bodyText">Sample Design Screening Scorecard.pdf</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="bodyText">11.10.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/Sample_Design_Review_Scorecard.pdf" class="bodyText">Sample Design Review Scorecard.pdf</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="bodyText">11.10.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/Sample_Development_Screening_Scorecard.pdf" class="bodyText">Sample Development Screening Scorecard.pdf</a></td>
                            </tr>
                            <tr valign="top">
                                <td class="bodyText">11.10.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/Sample_Development_Review_Scorecard.pdf" class="bodyText">Sample Development Review Scorecard.pdf</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
 
                <tr><td colspan="3"><hr width="100%" size="1px" color="666666" /></td></tr>
                                
                <tr valign="middle">
                    <td class="bodyText" height="15" valign="top"><strong>TopCoder Software Jalopy Configuration File</strong><br />
                        The TopCoder Software Jalopy Configuration File contains the formatting rules required to adhere to the TopCoder Software Java Coding Standards.  Please use this configuration file with Jalopy to format your source code before submitting it for review.
                    </td>
                    <td></td>
                    <td class="bodyText" valign="top"><br />
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td class="bodyText">05.28.2003</td>
                                <td class="bodyText"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
                                <td class="bodyText"><a target="tcsdocs" href="/i/development/downloads/topcoder_code_convention.xml" class="bodyText">Jalopy Configuration File</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                                
                <tr><td colspan="3"><hr width="100%" size="1px" color="666666" /></td></tr>
            </table>

            <p>For more information about Application deliverables see the <a href="/?&amp;t=development&amp;c=comp_meth" class="bodyText">TopCoder Component Methodology.</a></p><br />
            
            <br/>
            
            <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#EEEEEE">
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <p><strong>Sample Design Submission</strong><br />
                        This is the <a href="/i/development/downloads/submission-sample.jar" class="bodyText">winning design submission</a> from 
                        <a href="/stat?c=member_profile&amp;cr=119676">Pops</a> for the <a href="http://software.topcoder.com/catalog/c_component.jsp?comp=6402357&amp;cat=1" class="bodyText">Class Discovery</a> 
                        component. It should only be used as a guide for creating a design submission. Contents of this submission include:</p>
                        <ul>
                            <li>Component Specification</li>
                            <li>Test Cases</li>
                            <li>UML project created with Poseidon UML Community Edition version 1.5 from <a href="http://www.gentleware.com" target="_new">Gentleware</a></li>
                        </ul>
                    </td>
                </tr>
            </table>
            
            <br/>

            <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#EEEEEE">
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <p><strong>Sample Development Submission</strong><br />
                        This is the <a href="/i/development/downloads/devsubmission-sample.jar" class="bodyText">winning development submission</a> 
                        from <a href="/stat?c=member_profile&amp;cr=281876">garyk</a> for the Object Formatter component. It should only be used as 
                        a guide for creating a development submission. Contents of this submission include:</p>
                        <ul>
                            <li>Compilable Source Code</li>
                            <li>Unit Test Cases: Developer's should submit unit test cases called from the UnitTests.java and placed in the base package test directory.</li>
                            <li>Deployment Guide</li>
                        </ul>
                    </td>
                </tr>
            </table>
            
            <br/>

            <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#EEEEEE">
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <p><strong>Sample Completed Components</strong><br/>
                        Visit our 
                        <a>
                           <xsl:attribute name="href"> 
                           	<xsl:value-of select="concat('http://',/TC/SoftwareHost, '/components/free_components.jsp')"/>
                           </xsl:attribute>Free Components
                        </a> 
                        page for samples of completed components. You are encouraged to download and install these components 
                        for personal, non-commercial use and to incorporate them into future TopCoder Software components.</p>
                    </td>
                </tr>
            </table>
            
            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->

    </tr>
</table>

<!-- Footer begins -->
    <xsl:call-template name="Foot" />
<!-- Footer ends -->

</BODY>
</html>
    </xsl:template>
</xsl:stylesheet>
