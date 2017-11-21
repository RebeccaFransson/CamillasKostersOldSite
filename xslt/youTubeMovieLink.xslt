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

   <xsl:if test="string($currentPage/data [@alias='youTubeMovie1']) != '' ">

   <a target="_blank">
        <xsl:attribute name="href"> 
	<xsl:value-of select="$currentPage/data [@alias = 'youTubeMovie1']"/>
	</xsl:attribute>	
	Länk till film på You Tube
   </a>

</xsl:if>


   <xsl:if test="string($currentPage/data [@alias='youTubeMovie2']) != '' ">
<br />
   <a target="_blank">
        <xsl:attribute name="href"> 
	<xsl:value-of select="$currentPage/data [@alias = 'youTubeMovie2']"/>
	</xsl:attribute>	
	Länk till film2 på You Tube
   </a>

</xsl:if>

</xsl:template>

</xsl:stylesheet>