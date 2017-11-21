<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
                             version="1.0" 
                             xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                             xmlns:msxml="urn:schemas-microsoft-com:xslt"
                             xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" 
                             exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:variable name="source" select="/macro/source"/>

<xsl:param name="currentPage"/>

<xsl:template match="/">


<!-- The fun starts here -->

<xsl:for-each select="umbraco.library:GetXmlNodeById($source)/node [string(data [@alias='umbracoNaviHide']) != '1']">
<xsl:sort select="data [@alias = 'eventStartDate']" order="descending" />
<xsl:if test="position() &lt;= 1">

   <xsl:if test="string(data [@alias='eventImage']) != '' ">
     <img>
        <xsl:attribute name="src"> 
            <xsl:text>/umbraco/ImageGen.ashx?image=</xsl:text>
                              
            <xsl:value-of select="umbraco.library:GetMedia(data[@alias='eventImage'], 'false')/data [@alias = 'umbracoFile']"/>
           
            <xsl:text>&amp;width=200</xsl:text>
            <xsl:text>&amp;compression=80</xsl:text>
            <xsl:text>&amp;constrain=true</xsl:text>
            </xsl:attribute>

            <xsl:attribute name="alt">
 	    <xsl:value-of select="umbraco.library:GetMedia(data[@alias='eventImage'], 'false')/@nodeName" />
	    </xsl:attribute>
		
	    <xsl:attribute name="class">
	    left topMarginHalf marginright imgBorder
	    </xsl:attribute>	
    </img>

 </xsl:if>
<div class="left four">
	
<h3 class="fontXLarge georgia"><a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="data [@alias = 'eventHeadline']"/></a></h3>

<p class="ingress georgia"><xsl:value-of select="data [@alias = 'eventIngress']"/></p>

<p class="em13 topMarginHalf  clear"><a href="{umbraco.library:NiceUrl(@id)}"><span class="blue">Läs mer om <xsl:value-of select="data [@alias = 'eventHeadline']"/></span> </a></p>
</div>

</xsl:if>
</xsl:for-each>


   
 
</xsl:template>

</xsl:stylesheet>
