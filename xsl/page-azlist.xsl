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

	<xsl:import href="page.xsl"/>

	
	<!-- Content template that is called from page.xsl: -->
	<xsl:template name="content">
		<h1>All Journals</h1>
		
		<ul>
			<xsl:call-template name="allJournals" />
		</ul>
		
	</xsl:template>
	

	<!-- Template that pulls in all files/journals within a single folder -->
	<xsl:template name="allJournals">
		<!-- Create variable for the /data folder path -->
		<xsl:variable name="data-folder" select="concat($ou:root, $ou:site, $ou:dirname, '/data')" />	
		
		<!-- Loop through list and get the file name: -->
		<xsl:for-each select="doc($data-folder)/list/file">
			
			<!-- sort based on filename -->
			<xsl:sort select="." order="ascending"/>
			
			<!-- Get contents of the file -->
			<xsl:variable name="page-content" select="doc(concat($data-folder,'/', node()))" />
			
			<!-- Create variable for the page properties -->
			<xsl:variable name="page-props" select="$page-content/document/ouc:properties[@label='config']" />
			
			<!-- Check to see if the data file is set to 'active' -->
			<xsl:if test="$page-props/parameter[@name='active']/option[@selected='true'] = 'True'">
				
				<!-- Display the Database's Information with a template in common.xsl: -->
				<xsl:call-template name="displayJournal">
					<xsl:with-param name="page-props" select="$page-props" />
				</xsl:call-template>
				
				<!-- Pull in the tags: -->
				<ul class="list-inline">
					<xsl:call-template name="getTagsForJournal">
						<xsl:with-param name="path" select="concat($ou:dirname, '/data/', node())" />
					</xsl:call-template>
				</ul>
				<hr/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	
	<xsl:template name="getTagsForJournal">
		<xsl:param name="path" />

		<!-- create the path to the list of tags: -->
		<xsl:variable name="api-call"
					  select="concat('ou:/Tag/GetTags?', 'site=', $ou:site, '&amp;path=', $path )" />

		<!-- loop though the tags on the page:-->
		<xsl:for-each select="doc( $api-call )/tags/tag">
			<li>
				<a href="subjects/{replace(name, 'journal-', '')}.html" class="label label-default">
					<xsl:value-of select="replace(name, 'journal-', '')" />
				</a>
			</li>
		</xsl:for-each>

	</xsl:template>
	
</xsl:stylesheet>
