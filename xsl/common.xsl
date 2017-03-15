<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet>
<!--
Implementations Skeletor v3 - 5/10/2014

SECTION PROPERTIES 

Contributors: Your Name Here
Last Updated: Enter Date Here
-->
<xsl:stylesheet version="3.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:ou="http://omniupdate.com/XSL/Variables"
	xmlns:fn="http://omniupdate.com/XSL/Functions"
	xmlns:ouc="http://omniupdate.com/XSL/Variables"
	exclude-result-prefixes="ou xsl xs fn ouc">
	
	
	<!-- A template to pull in the name, description and url that is reused -->
	<xsl:template name="displayJournal">
		<xsl:param name="page-props" />
			
		<h2><xsl:value-of select="$page-props/parameter[@name='journal-name']" /></h2>
		<p><xsl:value-of select="$page-props/parameter[@name='journal-description']" /></p>
		<p><a href="{$page-props/parameter[@name='journal-url']}">Open Journal</a></p>
			
	</xsl:template>
	
	
</xsl:stylesheet>
