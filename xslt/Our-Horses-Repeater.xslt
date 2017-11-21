<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
        version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:msxml="urn:schemas-microsoft-com:xslt"
        xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets"
        exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:variable name="mediaID" select="/macro/mediaID"/>
  <xsl:variable name="altText" select="/macro/altText"/>
  <xsl:variable name="constrain">&amp;contrain=true</xsl:variable>
<xsl:variable name="makeThumbnail">
        <xsl:choose>
                <xsl:when test="/macro/makeThumbnail != ''">
                        <xsl:value-of select="/macro/makeThumbnail" />
                </xsl:when>
                <xsl:otherwise>
                        <xsl:value-of select="0" />
                </xsl:otherwise>
        </xsl:choose>
  </xsl:variable>


 

  <xsl:param name="currentPage"/>

  <xsl:template match="/">
    <xsl:if test="$mediaID != '' ">
                <xsl:variable name="navigateUrl">/Umbraco/ImageGen.ashx?image=<xsl:value-of select="umbraco.library:GetMedia($mediaID/node/@id, 'false')/data [@alias = 'umbracoFile']" /></xsl:variable>
        <xsl:choose>

                <xsl:when test="$makeThumbnail = 1">
                        <xsl:element name="a">

                                <xsl:attribute name="href">
                                        <xsl:value-of select="$navigateUrl" />
                                </xsl:attribute>
                                <xsl:call-template name="createImage">
                                        <xsl:with-param name="imageUrl" select="$navigateUrl" />
                                </xsl:call-template>
                        </xsl:element>

                </xsl:when>
                <xsl:otherwise>
                        <xsl:call-template name="createImage">
                                <xsl:with-param name="imageUrl" select="$navigateUrl" />
                        </xsl:call-template>
                </xsl:otherwise>
        </xsl:choose>
        </xsl:if>
        </xsl:template>


<xsl:template name="createImage">
        <xsl:param name="imageUrl" />

        <xsl:element name="img">
                <xsl:attribute name="src">
                        <xsl:value-of select="$imageUrl" />&amp;width=400
                </xsl:attribute>                                        
  
                <xsl:attribute name="alt">
                        <xsl:choose>
                                <xsl:when test="$altText != ''">
                                        <xsl:value-of select="$altText"/>
                                </xsl:when>
                                <xsl:otherwise>
                                        <xsl:value-of select="$currentPage/@nodeName"/>
                                </xsl:otherwise>
                        </xsl:choose>
                </xsl:attribute>
        </xsl:element>
</xsl:template>
</xsl:stylesheet>