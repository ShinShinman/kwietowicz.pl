<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="main-navigation">
  	<nav class="main">
  		<header>
  			<h1><a href="{$root}">Marcin Kwietowicz</a></h1>
        <div class="menu-trigger" onclick="menuToggle(this)">
          <div class="bar1"></div>
          <div class="bar2"></div>
          <div class="bar3"></div>
        </div>
  		</header>
  		<section class="projects">
  			<ul>
  				<!-- <xsl:apply-templates select="data/categories/entry[not(@projects = '0')]" /> -->
  				<xsl:apply-templates select="data/categories/entry" />
  			</ul>
  		</section>
  		<section class="meta">
  			<ul>
          <xsl:apply-templates select="data/navigation/page" />
  			</ul>
  		</section>
      <xsl:call-template name="language-menu" />
  	</nav>
  </xsl:template>

  <xsl:template match="categories/entry">
  	<li>
      <a href="{$root}/{//current-language/@handle}/{category/@handle}/">
        <xsl:if test="category/@handle = //project/entry/category/item/@handle or category/@handle = //params/category">
          <xsl:attribute name="class">active</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="category" />
      </a>
      <xsl:if test="category/@handle = //project/entry/category/item/@handle">
        <xsl:apply-templates select="//project/entry" mode="main-navigation" />
      </xsl:if>
    </li>
  </xsl:template>

  <xsl:template match="data/project/entry" mode="main-navigation">
    <ul class="current-project">
      <li><xsl:value-of select="title" /></li>
    </ul>
  </xsl:template>

  <xsl:template match="navigation/page">
    <li>
      <a href="{$root}/{//current-language/@handle}/{item[@lang = //current-language/@handle]/@handle}">
        <xsl:if test="@handle = $current-page">
          <xsl:attribute name="class">active</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="item[@lang = //current-language/@handle]" /></a>
    </li>
  </xsl:template>

</xsl:stylesheet>
