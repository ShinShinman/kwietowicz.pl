<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="language-menu">
    <nav class="language">
      <ul>
        <xsl:apply-templates select="data/fl-languages/supported-languages/item[@handle = 'pl']" />
        <li>|</li>
        <xsl:apply-templates select="data/fl-languages/supported-languages/item[@handle = 'en']" />
      </ul>
    </nav>
</xsl:template>

<xsl:template match="fl-languages/supported-languages/item">
	<li>
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="concat($root, '/', @handle, '/')" />
			</xsl:attribute>
			<xsl:if test="@handle = //current-language/@handle">
				<xsl:attribute name="class">active</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="substring(@handle, 1, 1)" />
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>
