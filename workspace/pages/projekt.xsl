<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:output method="xml" indent="yes" encoding="utf-8" />

<xsl:template match="data">
	<div class="swiper-container">
		<div class="project__gallery swiper-wrapper">
			<xsl:apply-templates select="project/entry/gallery/*" />
			<div class="swiper-slide project__meta">
				<div class="project__description">
					<xsl:apply-templates select="project/entry/title" />
					<xsl:apply-templates select="project/entry/description/*" />
				</div>
				<aside class="project__details">
					<xsl:apply-templates select="project/entry/details/*" />
				</aside>
			</div>
		</div>
		<button class="swiper-plugin-navigation-prevEl">
      PREV
    </button>
    <button class="swiper-plugin-navigation-nextEl">
      NEXT
    </button>
	</div>
</xsl:template>

<xsl:template match="project/entry/gallery/file">
	<div class="swiper-slide">
		<figure>
			<img src="{$workspace}/{@path}/{filename}" alt="{$website-name}, {../../title}" />
		</figure>
	</div>
</xsl:template>

<xsl:template match="project/entry/title">
	<h1><xsl:value-of select="." /></h1>
</xsl:template>

<xsl:template match="project/entry/description/p">
	<xsl:element name="{name()}">
		<xsl:apply-templates />
	</xsl:element>
</xsl:template>

<xsl:template match="project/entry/details/p">
	<xsl:apply-templates select="strong" />
	<p><xsl:value-of select="text()" /></p>
</xsl:template>

<xsl:template match="project/entry/details/p/strong">
	<h2><xsl:value-of select="." /></h2>
</xsl:template>

<!-- <xsl:template match="project/entry/details//*" priority="1">
	<xsl:element name="{name()}">
		<xsl:apply-templates  select="* | @* | text()" />
	</xsl:element>
</xsl:template> -->

<!-- <xsl:template match="project/entry/details/p/@*">
	<xsl:attribute name="{name(.)}">
		<xsl:value-of select="." />
	</xsl:attribute>
</xsl:template> -->

<xsl:template match="project/entry//*" />

<xsl:template match="data" mode="script">
	<!-- Tiny-Swiper JS -->
	<script src="https://unpkg.com/tiny-swiper@latest/lib/index.min.js"></script>
	<script src="https://unpkg.com/tiny-swiper@latest/lib/modules/keyboardControl.min.js"></script>
	<script src="https://unpkg.com/tiny-swiper@latest/lib/modules/navigation.min.js"></script>
 <!-- Initialize Tiny-Swiper -->
	<script>
		var swiperOptions = {
	    <!-- direction: 'vertical', -->
			speed: 700,
			spaceBetween: 20,
			keyboard: {
				enabled: true
			},
			navigation: {
				nextEl: '.swiper-plugin-navigation-nextEl',
				prevEl: '.swiper-plugin-navigation-prevEl'
			},
			plugins: [SwiperPluginKeyboardControl, SwiperPluginNavigation]
	  };

		if (window.innerWidth <xsl:text disable-output-escaping = "yes">&#x3E;</xsl:text>  770) var swiper = new Swiper(".swiper-container", swiperOptions);
	</script>
</xsl:template>

</xsl:stylesheet>
