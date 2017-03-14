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
			<xsl:value-of select="ouc:properties[@label='config']/parameter[@name='page-title']" />
		</h1>

		<xsl:call-template name="GetDataFilesWithTag" />

	</xsl:template>
	

	<!-- Get all the Data files with the first tag associated with this page -->
	<xsl:template name="GetDataFilesWithTag">
		<!-- Get the current file's staging path: site=www&path=data/sample.pcf -->
		<xsl:variable name="current-page" 
					  select="concat('site=', $ou:site, '&amp;path=', $ou:stagingpath)" />

		<!-- Get page's tags: -->
		<xsl:variable name="page-tags" select="concat('ou:/Tag/GetTags?', $current-page)" />

		<!-- Get the first Tag that is associated with this subject listing page -->
		<xsl:variable name="first-tag" select="doc( $page-tags )/tags/tag[1]/name" />

		<!-- Get Data Files With the Tag -->
		<xsl:variable name="tag-select" 
					  select="doc( concat('ou:/Tag/GetFilesWithAnyTags?site=', $ou:site, '&amp;tag=', $first-tag) )" /> 

		<!-- Loop through the pages that contain the keyword: -->
		<xsl:for-each select="$tag-select/pages/page">

			<!-- Sort the pages by the filename -->
			<xsl:sort select="path" />

			<!-- Pass the path to a new function to handle the next step -->
			<xsl:call-template name="GetContentFromSingleDataFile">
				<xsl:with-param name="data-url" select="path" />
			</xsl:call-template>

		</xsl:for-each>		
	</xsl:template>

	<!-- Format each individual journal -->
	<xsl:template name="GetContentFromSingleDataFile">
		<xsl:param name="data-url" />
		<!-- Get the full path to the data file: -->
		<xsl:variable name="full-path" select="concat($ou:root, $ou:site, $data-url)" />

		<!-- Get Data File Content -->
		<xsl:variable name="page-content" select="doc($full-path)/document" />

		<!-- Check to see if it is a data file since the subject page also has this tag associated with it -->
		<xsl:if test="$page-content/page/@type = 'library-database'">

			<!-- Create variable of the props section for better readability -->
			<xsl:variable name="page-props" select="$page-content/ouc:properties[@label='config']" />

			<!-- Check to see if the data file is set to 'active' -->
			<xsl:if test="$page-props/parameter[@name='active']/option[@selected='true'] = 'True'">

				<!-- Display the Database's Information: -->
				<h2><xsl:value-of select="$page-props/parameter[@name='database-name']" /></h2>
				<p><xsl:value-of select="$page-props/parameter[@name='database-description']" /></p>
				<a href="{$page-props/parameter[@name='database-url']}">Open Journal</a>
				<hr/>

			</xsl:if>
		</xsl:if>
	</xsl:template>


</xsl:stylesheet>
