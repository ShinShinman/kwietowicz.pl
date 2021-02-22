<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="page-title.xsl"/>
<xsl:import href="language-menu.xsl"/>
<xsl:include href="main-navigation.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	encoding="UTF-8"
	indent="yes" />

<xsl:variable name="is-logged-in" select="/data/logged-in-author/author"/>

<xsl:template match="/">

<html lang="pl" dir="ltr">
  <head>
    <meta charset="utf-8" />
		<meta name="description" content="Marcin Kwietowicz. Portfolio" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>
			<xsl:call-template name="page-title"/>
		</title>
    <link rel="stylesheet" href="{$workspace}/css/main.min.css" />
	</head>
	<body>
		<xsl:call-template name="main-navigation" />
    <main class="{$current-page}">
			<header>
	      <xsl:call-template name="language-menu" />
			</header>
      <xsl:apply-templates />
    </main>

		<script>
			function menuToggle(trg) {
				trg.classList.toggle('change');
				trg.parentElement.parentElement.classList.toggle('active');
			}
		</script>

		<xsl:apply-templates mode="script" />

	</body>
</html>

</xsl:template>

<xsl:template match="data" mode="script">

</xsl:template>

</xsl:stylesheet>
