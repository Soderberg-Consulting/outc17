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

	<xsl:import href="ouvariables.xsl"/>
	<xsl:import href="page.xsl"/>

	
	<!-- Content template that is called from page.xsl: -->
	<xsl:template name="content">
		<h1>
			A-Z List of all journals
		</h1>
		
		<ul>
			<xsl:call-template name="allJournals" />
		</ul>
		
	</xsl:template>
	

	
	<xsl:template name="allJournals">
	
		<xsl:variable name="data" select="concat($ou:root, $ou:site, $ou:dirname, '/data')" />	
		
		<!-- Create Sorted Version First -->
		<xsl:variable name="sortedcopy">
			<xsl:for-each select="doc($data)/list/file">
				<xsl:sort select="." order="ascending"/>
				<xsl:copy-of select="."/>
			</xsl:for-each>
		</xsl:variable>

		<!-- Loop through list and get the file name: -->
		<xsl:for-each select="$sortedcopy/file">
			
			<!-- Get contents of the file -->
			<xsl:variable name="page-content" select="doc(concat($data,'/', node()))" />
			
			<!-- Create variable for the page properties -->
			<xsl:variable name="page-props" select="$page-content/document/ouc:properties[@label='config']" />
			
			<!-- display content -->
			<h2><xsl:value-of select="$page-props/parameter[@name='database-name']" /></h2>
			<p><xsl:value-of select="$page-props/parameter[@name='database-description']" /></p>
			<a href="{$page-props/parameter[@name='database-url']}">Open Journal</a>
			<hr/>
			
		</xsl:for-each>
		
	</xsl:template>

</xsl:stylesheet>
