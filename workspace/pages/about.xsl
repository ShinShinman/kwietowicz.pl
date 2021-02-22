<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<article class="about__about-me">
		<xsl:apply-templates select="about/entry/about" />
	</article>
	<figure>
		<img src="{$workspace}/{about/entry/image/@path}/{about/entry/image/filename}" alt="Marcin Kwiatowicz" />
		<figcaption><xsl:value-of select="about/entry/caption" /></figcaption>
	</figure>
</xsl:template>

<xsl:template match="about/entry/about//*">
	<xsl:element name="{name()}">
		<xsl:apply-templates select="* | @* | text()" />
	</xsl:element>
</xsl:template>

<xsl:template match="about/entry/about/@*">
	<xsl:attribute name="{name(.)}">
		<xsl:value-of select="." />
	</xsl:attribute>
</xsl:template>

</xsl:stylesheet>
