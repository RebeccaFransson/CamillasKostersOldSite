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

   <xsl:if test="string(data [@alias='eventImage']) != '' ">
     <img>
        <xsl:attribute name="src"> 
            <xsl:text>/umbraco/ImageGen.ashx?image=</xsl:text>
                              
            <xsl:value-of select="umbraco.library:GetMedia(data[@alias='eventImage'], 'false')/data [@alias = 'umbracoFile']"/>
           
            <xsl:text>&amp;width=160</xsl:text>
            <xsl:text>&amp;compression=80</xsl:text>
            <xsl:text>&amp;constrain=true</xsl:text>
            </xsl:attribute>

            <xsl:attribute name="alt">
 	    <xsl:value-of select="umbraco.library:GetMedia(data[@alias='eventImage'], 'false')/@nodeName" />
	    </xsl:attribute>
		
	    <xsl:attribute name="class">
	    right marginLeft imgBorder
	    </xsl:attribute>	
    </img>

 </xsl:if>

	
<h3 class="fontXLarge georgia"><a href="{umbraco.library:NiceUrl(@id)}"><span class="blue"><xsl:value-of select="data [@alias = 'eventHeadline']"/></span></a></h3>

<p class="ingress georgia blue"><xsl:value-of select="data [@alias = 'eventIngress']"/></p>

<p class="startDate left">
<b>Aktiviteten börjar:</b>
<br/>
den <xsl:value-of select="umbraco.library:FormatDateTime(data[@alias='eventStartDate'], 'd MMMM yyyy')"/>
<br/>
klockan <xsl:value-of select="umbraco.library:FormatDateTime(data[@alias='eventStartDate'], 'HH:mm')"/>
</p>
<p class="endDate left">
<b>Aktiviteten slutar:</b><br/>
den <xsl:value-of select="umbraco.library:FormatDateTime(data[@alias='eventEndDate'], 'd MMMM yyyy')"/>
<br/>
klockan <xsl:value-of select="umbraco.library:FormatDateTime(data[@alias='eventEndDate'], 'HH:mm')"/>
</p>
<p class="clear"><a href="{umbraco.library:NiceUrl(@id)}">Läs mer om <xsl:value-of select="data [@alias = 'eventHeadline']"/> </a></p>

<div class="hr">&nbsp;</div>


</xsl:for-each>


   
 
</xsl:template>

</xsl:stylesheet>
