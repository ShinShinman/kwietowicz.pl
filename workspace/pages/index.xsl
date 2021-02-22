<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data/*" />

<xsl:template match="//index">
	<article class="index__list">
		<xsl:apply-templates select="year" />
		<xsl:apply-templates select="year" />
		<xsl:apply-templates select="year" />
		<xsl:apply-templates select="year" />
	</article>
	<aside>
		<figure class="cover">
			<img src="{$workspace}/images/blank.gif" alt="" />
			<figcaption></figcaption>
		</figure>
	</aside>
</xsl:template>

<xsl:template match="index/year">
	<ul class="brick item">
		<li><xsl:value-of select="@value" /></li>
		<xsl:apply-templates select=".//entry" />
	</ul>
</xsl:template>

<xsl:template match="index/year//entry">
	<li>
		<a href="{$root}/{//current-language/@handle}/projekt/{title/@handle}/" data-cover="{$workspace}{cover-image/@path}/{cover-image/filename}" data-title="{title}">
			<xsl:value-of select="title" />
		</a>
	</li>
</xsl:template>



<!-- <xsl:template match="about//*">
	<xsl:element name="{name()}">
		<xsl:apply-templates select="* | @* | text()" />
	</xsl:element>
</xsl:template>

<xsl:template match="about/@*">
	<xsl:attribute name="{name(.)}">
		<xsl:value-of select="." />
	</xsl:attribute>
</xsl:template> -->

<xsl:template match="data" mode="script">
	<script>
		const list = document.querySelectorAll('.index__list .item a');
		const screen = document.querySelector('aside figure img');
		const caption = document.querySelector('aside figure figcaption');
		list.forEach(function(el) {
			el.onmouseover = function() {
				screen.src = el.dataset.cover;
				caption.innerText = el.dataset.title;
			}
			el.onmouseleave = function() {
			screen.src = '<xsl:value-of select="$workspace" />/images/blank.gif';
			caption.innerText = '';
			}
		})
</script>
</xsl:template>

</xsl:stylesheet>
