<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<xsl:apply-templates select="all-projects/entry" />
	<xsl:apply-templates select="all-projects/entry" />
</xsl:template>

<xsl:template match="all-projects/entry">
	<article class="brick">
		<a href="{$root}/{//current-language/@handle}/projekt/{title/@handle}">
			<figure>
				<img src="{$workspace}/{cover-image/@path}/{cover-image/filename}" alt="" />
			</figure>
			<p><xsl:value-of select="title" /></p>
		</a>
	</article>
</xsl:template>

</xsl:stylesheet>
