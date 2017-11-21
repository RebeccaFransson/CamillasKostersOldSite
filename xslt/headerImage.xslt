<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
    version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:msxml="urn:schemas-microsoft-com:xslt"
    xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:autofolders.library="urn:autofolders.library" xmlns:tagsLib="urn:tagsLib" xmlns:BlogLibrary="urn:BlogLibrary" xmlns:fmautolink="urn:fmautolink" 
    exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets autofolders.library tagsLib BlogLibrary fmautolink ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

<xsl:template match="/">

<!-- start writing XSLT -->

<xsl:variable name="mediaId" select="number($currentPage/ancestor-or-self::node [string(data[@alias='headerImage'])!=''] [1] /data[@alias='headerImage'])"/>
	<xsl:if test="$mediaId &gt; 0">
		
		<xsl:variable name="mediaNode" select="umbraco.library:GetMedia($mediaId, 0)" />
		<xsl:if test="count($mediaNode/data) &gt; 0 and string($mediaNode/data[@alias='umbracoFile']) != ''">

<img>
<xsl:attribute name="src">
<xsl:text>/umbraco/ImageGen.ashx?image=</xsl:text>
<xsl:value-of select="$mediaNode/data[@alias='umbracoFile']"/>
            <xsl:text>&amp;height=347</xsl:text>
            <xsl:text>&amp;compression=80</xsl:text>
 
            <xsl:text>&amp;constrain=true</xsl:text>
</xsl:attribute>
        <xsl:attribute name="alt">
 
	    </xsl:attribute>


</img>


</xsl:if>
</xsl:if>




</xsl:template>

</xsl:stylesheet>
