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
<ul id="horses">
<xsl:for-each select="umbraco.library:GetXmlNodeById($source)/node [string(data [@alias='umbracoNaviHide']) != '1']">
	<li><span>
	
<xsl:value-of select="data [@alias = 'horseName']"/>
   <xsl:if test="string(data [@alias='horseImage1']) != '' ">
     <img>
        <xsl:attribute name="src"> 
            <xsl:text>/umbraco/ImageGen.ashx?image=</xsl:text>
                              
            <xsl:value-of select="umbraco.library:GetMedia(data[@alias='horseImage1'], 'false')/data [@alias = 'umbracoFile']"/>
           
            <xsl:text>&amp;width=400</xsl:text>
            <xsl:text>&amp;constrain=true</xsl:text>
        </xsl:attribute>

                             <xsl:attribute name="alt">
                               <xsl:value-of select="$currentPage/data[@alias = 'alternativeText']"/>
                             </xsl:attribute>

    </img>
 </xsl:if>

	</span></li>
</xsl:for-each>
</ul>

   
 
</xsl:template>

</xsl:stylesheet>
