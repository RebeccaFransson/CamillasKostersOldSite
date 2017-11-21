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
<div class="six clear topPadding">

<div class="pinkHeader">
Händer på gården </div>

<!-- The fun starts here -->
<xsl:value-of select="data [@alias = 'postImage1']"/>
<xsl:for-each select="umbraco.library:GetXmlNodeById($source)/node [string(data [@alias='umbracoNaviHide']) != '1']">
<xsl:sort select="@createDate" order="descending" />
<xsl:if test="position() &lt;= 1">

<img src="/images/blog-authorpic.jpg" alt="Camilla" class="left topMarginHalf" />	
<div class="postStartPage">
<h3><a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="data [@alias = 'postHeadline']"/></a></h3>
<div class="em11"><xsl:value-of select="data [@alias = 'postContent']" disable-output-escaping="yes"/></div>



<p class="clear em11"><a href="{umbraco.library:NiceUrl(@id)}">Läs mer</a></p>
</div>

 </xsl:if>
</xsl:for-each>

</div>
   
 
</xsl:template>

</xsl:stylesheet>
