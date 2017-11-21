<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
                             version="1.0" 
                             xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                             xmlns:msxml="urn:schemas-microsoft-com:xslt"
                             xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" 
                             exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


<xsl:output method="xml" omit-xml-declaration="yes"/>


<xsl:param name="currentPage"/>

<xsl:template match="/">


<!-- The fun starts here -->
<xsl:for-each select="$currentPage/node [string(data [@alias='umbracoNaviHide']) != '1']">
<xsl:sort select="@createDate" order="descending" />

<span class="date">den <xsl:value-of select="umbraco.library:FormatDateTime(@createDate,'d MMMM yyyy')"/></span>

		
<h3 class="fontXLarge georgia blue">
<a href="{umbraco.library:NiceUrl(@id)}"><span class="blue"><xsl:value-of select="data [@alias = 'postHeadline']"/></span></a></h3>
		
<xsl:value-of select="data [@alias = 'postContent']" disable-output-escaping="yes"/>

</xsl:for-each>


   
 
</xsl:template>

</xsl:stylesheet>
