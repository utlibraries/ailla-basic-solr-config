<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:foxml="info:fedora/fedora-system:def/foxml#">
  <xsl:template match="foxml:datastream[@ID='LANGUAGE']/foxml:datastreamVersion[last()]" name="index_LANGUAGE">
    <xsl:param name="content"/>  
    <xsl:apply-templates select="$content/aillaLanguage/*" mode="ailla_language_slurp">
      <xsl:with-param name="prefix">aillaLanguage</xsl:with-param>
    </xsl:apply-templates>
  </xsl:template>
  
  <xsl:template match="*" mode="ailla_language_slurp">
    <xsl:param name="prefix"/>
    <!-- _et for edgengrams -->
    <xsl:param name="suffix">_et</xsl:param>
    
    <xsl:apply-templates mode="ailla_language_slurp">
      <xsl:with-param name="prefix" select="concat($prefix, '_', local-name())"/>
      <xsl:with-param name="suffix" select="$suffix"/>
    </xsl:apply-templates>
  </xsl:template>
  
  <xsl:template match="text()" mode="ailla_language_slurp">
    <xsl:param name="prefix"/>
    <!-- _et for edgengrams -->
    <xsl:param name="suffix">_et</xsl:param>
    
    <xsl:variable name="textValue" select="normalize-space(.)"/>
    <xsl:if test="$textValue">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="$textValue"/>
      </field>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
