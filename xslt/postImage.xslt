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


   <xsl:if test="string($currentPage/data [@alias='postImage1']) != '' ">
     <br /><img>
        <xsl:attribute name="src"> 
            <xsl:text>/umbraco/ImageGen.ashx?image=</xsl:text>
                              
            <xsl:value-of select="umbraco.library:GetMedia($currentPage/data[@alias='postImage1'], 'false')/data [@alias = 'umbracoFile']"/>
           
            <xsl:text>&amp;width=520</xsl:text>
            <xsl:text>&amp;compression=80</xsl:text>
            <xsl:text>&amp;constrain=true</xsl:text>
            </xsl:attribute>

            <xsl:attribute name="alt">
 	    <xsl:value-of select="umbraco.library:GetMedia($currentPage/data[@alias='postImage1'], 'false')/@nodeName" />
	    </xsl:attribute>

    </img><br /><br />

 </xsl:if>


   <xsl:if test="string($currentPage/data [@alias='postImage2']) != '' ">
     <br /><img>
        <xsl:attribute name="src"> 
            <xsl:text>/umbraco/ImageGen.ashx?image=</xsl:text>
                              
            <xsl:value-of select="umbraco.library:GetMedia($currentPage/data[@alias='postImage2'], 'false')/data [@alias = 'umbracoFile']"/>
           
            <xsl:text>&amp;width=520</xsl:text>
            <xsl:text>&amp;compression=80</xsl:text>
            <xsl:text>&amp;constrain=true</xsl:text>
            </xsl:attribute>

            <xsl:attribute name="alt">
 	    <xsl:value-of select="umbraco.library:GetMedia($currentPage/data[@alias='postImage2'], 'false')/@nodeName" />
	    </xsl:attribute>

    </img><br /><br />

 </xsl:if>
   
 
</xsl:template>

</xsl:stylesheet>
