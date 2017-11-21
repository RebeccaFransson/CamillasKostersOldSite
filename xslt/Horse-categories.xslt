<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt" 
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:tagsLib="urn:tagsLib" xmlns:BlogLibrary="urn:BlogLibrary" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets tagsLib BlogLibrary ">

<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

<xsl:template match="/">

<!-- The fun starts here -->
<ul id="horseCategories">



<xsl:for-each select="$currentPage/node [string(data [@alias='umbracoNaviHide']) != '1']">
	<li>
		<a href="{umbraco.library:NiceUrl(@id)}">
		
		

 <xsl:if test="string(data [@alias='horseImage1']) != '' ">
     <img>
        <xsl:attribute name="src"> 
            <xsl:text>/umbraco/ImageGen.ashx?image=</xsl:text>
                              
            <xsl:value-of select="umbraco.library:GetMedia(data[@alias='horseImage1'], 'false')/data [@alias = 'umbracoFile']"/>
           
            <xsl:text>&amp;width=150</xsl:text>
            <xsl:text>&amp;constrain=true</xsl:text>
        </xsl:attribute>

                             <xsl:attribute name="alt">
                               <xsl:value-of select="$currentPage/data[@alias = 'alternativeText']"/>
                             </xsl:attribute>

    </img>
 </xsl:if>

<span><xsl:value-of select="@nodeName"/></span>
		
</a>
	</li>
</xsl:for-each>
</ul>

</xsl:template>

</xsl:stylesheet>