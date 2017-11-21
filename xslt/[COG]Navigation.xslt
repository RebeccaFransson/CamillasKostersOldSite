<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library"
	exclude-result-prefixes="msxml umbraco.library">

<xsl:output method="html" omit-xml-declaration="yes"/>

<xsl:param name="currentPage" />

<!--This sets the level that the nav starts at and tells us if we should recurse through child elements-->
<xsl:variable name="startDepth" select="/macro/startingLevel" />
<xsl:variable name="recurse" select="/macro/recurse" />
<xsl:variable name="selectBranches" select="/macro/selectBranches"></xsl:variable>
<xsl:variable name="maxMenuDepth" select="/macro/maxMenuDepth"></xsl:variable>
<xsl:variable name="forceNode" select="/macro/forceNode"></xsl:variable>
<xsl:variable name="walkChildren" select="/macro/expandChildren"></xsl:variable>
<xsl:variable name="forceHome" select="/macro/forceHome"></xsl:variable>
<!--Alternate page title variable in here-->
  
<!--Styles for the navigation-->
<xsl:variable name="ulBaseClass" select="/macro/ulBaseClass"></xsl:variable>
<xsl:variable name="branchClass" select="/macro/branchClass"></xsl:variable>
<xsl:variable name="selectedClass" select="/macro/selectedClass"></xsl:variable>

<xsl:variable name="startLevel">
  <xsl:choose>
    <xsl:when test="$startDepth >= 0">
      <xsl:value-of select="$startDepth"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$currentPage/@level"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

  <!--This calls first iteration of the navigation, sending the first node at the correct depth found in the ancestors of the current page-->
<xsl:template match="/">
  
  <xsl:choose>
    <xsl:when test="$forceNode">
      <xsl:variable name="currentNode" select="umbraco.library:GetXmlNodeById($forceNode)"></xsl:variable>
      <xsl:call-template name="nodeIterator">
        <xsl:with-param name="parentNode" select="$currentNode/ancestor-or-self::node[@level=$startLevel] [string(data [@alias='umbracoNaviHide']) != '1']" />
        <xsl:with-param name="pseudoCurrentPage" select="$currentNode" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="currentNode" select="$currentPage"></xsl:variable>
      <xsl:call-template name="nodeIterator">
        <xsl:with-param name="parentNode" select="$currentNode/ancestor-or-self::node[@level=$startLevel] [string(data [@alias='umbracoNaviHide']) != '1']" />
        <xsl:with-param name="pseudoCurrentPage" select="$currentNode" />
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="nodeIterator">
    <xsl:param name="parentNode" />
    <xsl:param name="pseudoCurrentPage" />
    <!-- do not show info doc node types-->

  <xsl:variable name="calculatedMenuDepth" select="($parentNode/@level - $startLevel)+1" />

  <ul>

        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="$calculatedMenuDepth = 1">
              <xsl:value-of select="concat($ulBaseClass, ' lv', $calculatedMenuDepth)" />
            </xsl:when>
            <xsl:when test="$calculatedMenuDepth > 1">
              <xsl:value-of select="concat('lv', $calculatedMenuDepth)" />
            </xsl:when>
          </xsl:choose>
        </xsl:attribute>

        <xsl:if test="$forceHome = 1 and $calculatedMenuDepth = 1">
          <!-- Create the class for the li element-->
          <li>
            <xsl:attribute name="class">
              <xsl:if test="$currentPage/ancestor-or-self::node[@level=2]/@id = $currentPage/@id">
                <xsl:value-of select="concat($selectedClass,' ')"/>
              </xsl:if>
              <xsl:value-of select="'hasChildren '"/>
            </xsl:attribute>

            <a href="{umbraco.library:NiceUrl($currentPage/ancestor-or-self::node[@level=2]/@id)}">

              <xsl:attribute name="class">
                <xsl:if test="$currentPage/ancestor-or-self::node[@level=2]/@id = $currentPage/@id">
                  <xsl:value-of select="concat($selectedClass,' ')"/>
                </xsl:if>
              </xsl:attribute>

              <!--set the innerText for the a element-->
              <xsl:value-of select="$currentPage/ancestor-or-self::node[@level=2]/text()"/>

              <xsl:if test="string($currentPage/ancestor-or-self::node[@level=2]/text()) = ''">
                <xsl:value-of select="$currentPage/ancestor-or-self::node[@level=2]/@nodeName"/>
              </xsl:if>
            </a>
          </li>
        </xsl:if>
        <!--End force home-->
        
        
        <!--for each node in the parent node that is not hidden by Umbraco-->
        <xsl:for-each select="$parentNode/node [string(data [@alias='umbracoNaviHide']) != '1']">

          <!--Set the current node id i.e. the node we have looped to not the current page-->
          <xsl:variable name="currentNodeID" select="./@id" />

          <!--Is the node a branch? i.e. are there children and is it in the colletion of ancestor nodes -->
          <xsl:variable name="isBranch">
            <xsl:choose>
              <xsl:when test="$pseudoCurrentPage/ancestor-or-self::node[@id = $currentNodeID]/child::node">1</xsl:when>
            </xsl:choose>
          </xsl:variable>

          <!--Is the node selected? i.e. is it the same as the currentPage node-->
          <xsl:variable name="isSelected">
            <xsl:choose>
              <xsl:when test="$pseudoCurrentPage/@id = $currentNodeID">1</xsl:when>
            </xsl:choose>
          </xsl:variable>

          <xsl:variable name="isSelectedBranch">
            <xsl:choose>
              <xsl:when test="$isBranch = 1 and $selectBranches = 1">1</xsl:when>
            </xsl:choose>
          </xsl:variable>

          <xsl:variable name="hasChildren">
            <xsl:choose>
              <xsl:when test="./node">1</xsl:when>
            </xsl:choose>
          </xsl:variable>

          <li>
 
            <!-- Create the class for the li element-->
            <xsl:attribute name="class">
              <xsl:if test="$isSelected = 1"> <xsl:value-of select="concat($selectedClass,' ')"/> </xsl:if>
              <xsl:if test="$isSelectedBranch = 1"> <xsl:value-of select="concat($branchClass,' ')"/> </xsl:if>
              <xsl:if test="$hasChildren = 1"><xsl:value-of select="'hasChildren '"/></xsl:if>
            </xsl:attribute>

            <a href="{umbraco.library:NiceUrl(@id)}">
              
              <xsl:attribute name="class">
                <xsl:if test="$isSelected = 1"> <xsl:value-of select="concat($selectedClass,' ')"/> </xsl:if>
                <xsl:if test="$isSelectedBranch = 1"> <xsl:value-of select="concat($branchClass,' ')"/> </xsl:if>
              </xsl:attribute>

              <!--set the innerText for the a element-->
              <xsl:value-of select="./data[@alias='contentPageTitle']/text()"/>

	            <xsl:if test="string(./data[@alias='contentPageTitle']/text()) = ''">	
                  <xsl:value-of select="@nodeName"/>
              </xsl:if>
            </a>

            <!-- if it's a branch recurse through it's children-->
            <xsl:if test="((($isBranch = 1 and $recurse = 1) or ($walkChildren = 1 and $currentPage/descendant-or-self::node[@id = $currentNodeID]/child::node)) and $maxMenuDepth &gt;= $calculatedMenuDepth)">
              <xsl:call-template name="nodeIterator">
                <xsl:with-param name="parentNode" select="." />
                <xsl:with-param name="pseudoCurrentPage" select="$pseudoCurrentPage" />
              </xsl:call-template>
            </xsl:if>

          </li>

        </xsl:for-each>

      </ul>
  </xsl:template>

</xsl:stylesheet>