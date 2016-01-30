<?xml version="1.0" encoding="utf-8"?><!-- This file is part of the DITA Open Toolkit project.
     See the accompanying license.txt file for applicable licenses.--><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" version="2.0" exclude-result-prefixes="xs dita-ot">

  <xsl:import href="plugin:org.dita.xhtml:xsl/map2htmtoc/map2htmlImpl.xsl"></xsl:import>

  <xsl:template match="*[contains(@class, &apos; map/map &apos;)]">
    <xsl:apply-templates select="." mode="root_element"></xsl:apply-templates>
  </xsl:template>

  <xsl:template match="*[contains(@class, &apos; map/map &apos;)]" mode="chapterBody">
    <body>
      <xsl:apply-templates select="*[contains(@class, &apos; ditaot-d/ditaval-startprop &apos;)]/@outputclass" mode="add-ditaval-style"></xsl:apply-templates>
      <xsl:if test="@outputclass">
        <xsl:attribute name="class" select="@outputclass"></xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="." mode="addAttributesToBody"></xsl:apply-templates>
      <xsl:call-template name="setidaname"></xsl:call-template>
      <xsl:apply-templates select="*[contains(@class, &apos; ditaot-d/ditaval-startprop &apos;)]" mode="out-of-line"></xsl:apply-templates>
      <xsl:call-template name="generateBreadcrumbs"></xsl:call-template>
      <xsl:call-template name="gen-user-header"></xsl:call-template>
      <xsl:call-template name="processHDR"></xsl:call-template>
      <xsl:if test="$INDEXSHOW = &apos;yes&apos;">
        <xsl:apply-templates select="/*/*[contains(@class, &apos; map/topicmeta &apos;)]/*[contains(@class, &apos; topic/keywords &apos;)]/*[contains(@class, &apos; topic/indexterm &apos;)]"></xsl:apply-templates>
      </xsl:if>
      <xsl:call-template name="gen-user-sidetoc"></xsl:call-template>
      <xsl:choose>
        <xsl:when test="*[contains(@class, &apos; topic/title &apos;)]">
          <xsl:apply-templates select="*[contains(@class, &apos; topic/title &apos;)]"></xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="@title"></xsl:apply-templates>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="." mode="toc"></xsl:apply-templates>
      <xsl:call-template name="gen-endnotes"></xsl:call-template>
      <xsl:call-template name="gen-user-footer"></xsl:call-template>
      <xsl:call-template name="processFTR"></xsl:call-template>
      <xsl:apply-templates select="*[contains(@class, &apos; ditaot-d/ditaval-endprop &apos;)]" mode="out-of-line"></xsl:apply-templates>
    </body>
  </xsl:template>

  <xsl:template match="*[contains(@class, &apos; map/map &apos;)]/*[contains(@class, &apos; topic/title &apos;)]">
    <h1 class="title topictitle1">
      <xsl:call-template name="gen-user-panel-title-pfx"></xsl:call-template>
      <xsl:apply-templates></xsl:apply-templates>
    </h1>
  </xsl:template>

  <xsl:template match="*[contains(@class, &apos; map/map &apos;)]/@title">
    <h1 class="title topictitle1">
      <xsl:call-template name="gen-user-panel-title-pfx"></xsl:call-template>
      <xsl:value-of select="."></xsl:value-of>
    </h1>
  </xsl:template>

  <xsl:template match="*[contains(@class,&apos; bookmap/bookmap &apos;)]/*[contains(@class,&apos; bookmap/booktitle &apos;)]" priority="10">
    <h1 class="title topictitle1">
      <xsl:call-template name="gen-user-panel-title-pfx"></xsl:call-template>
      <xsl:apply-templates select="*[contains(@class, &apos; bookmap/mainbooktitle &apos;)]/node()"></xsl:apply-templates>
    </h1>
  </xsl:template>

  <xsl:template name="generateChapterTitle">
    <title>
      <xsl:choose>
        <xsl:when test="/*[contains(@class,&apos; bookmap/bookmap &apos;)]/*[contains(@class,&apos; bookmap/booktitle &apos;)]/*[contains(@class, &apos; bookmap/mainbooktitle &apos;)]">
          <xsl:call-template name="gen-user-panel-title-pfx"></xsl:call-template>
          <xsl:value-of select="/*[contains(@class,&apos; bookmap/bookmap &apos;)]/*[contains(@class,&apos; bookmap/booktitle &apos;)]/*[contains(@class, &apos; bookmap/mainbooktitle &apos;)]"></xsl:value-of>
        </xsl:when>
        <xsl:when test="/*[contains(@class,&apos; map/map &apos;)]/*[contains(@class,&apos; topic/title &apos;)]">
          <xsl:call-template name="gen-user-panel-title-pfx"></xsl:call-template>
          <xsl:value-of select="/*[contains(@class,&apos; map/map &apos;)]/*[contains(@class,&apos; topic/title &apos;)]"></xsl:value-of>
        </xsl:when>
        <xsl:when test="/*[contains(@class,&apos; map/map &apos;)]/@title">
          <xsl:call-template name="gen-user-panel-title-pfx"></xsl:call-template>
          <xsl:value-of select="/*[contains(@class,&apos; map/map &apos;)]/@title"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
    </title>
  </xsl:template>

  

</xsl:stylesheet>