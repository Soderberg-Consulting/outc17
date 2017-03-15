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

	
	<xsl:template name="content">
		<h1>Journal Home:</h1>
		<h2>All Categories:</h2>
		
		<div class="list-group">
			<xsl:call-template name="getAllTags" />
		</div>
		
		
	</xsl:template>

	
	<!-- Get all the tags, sort them by name and then test to see if it starts with journal- -->
	<xsl:template name="getAllTags">
		<xsl:variable name="prefix" select="'journal-'" />
		
		<!-- Get all tags from OU Campus -->
		<xsl:variable name="allTags" select="doc('ou:/Tag/GetAllTags')/tags" />
		
		<!-- Loop through all tags -->
		<xsl:for-each select="$allTags/tag">
			
			<!-- Sort the list of tags based on the node name -->
			<xsl:sort select="name" order="ascending"/>
			
			<!-- If the tag stars with the prefix of journal- display it -->
			<xsl:if test="starts-with(name, $prefix)">
				<a href="subjects/{replace(name, $prefix, '')}.html" class="list-group-item">
					<xsl:value-of select="replace(name, $prefix, '')" />
				</a>
			</xsl:if>
				
		</xsl:for-each>
		
	</xsl:template>
	

	<!-- Get all tags within a collection -->
	<xsl:template name="getTagsInCollection">
		<xsl:variable name="prefix" select="'journal-'" />
		
		<!-- Get all tags in the collection: from OU Campus -->
		<xsl:variable name="allTags" select="doc('ou:/Tag/GetChildren?tag=journal')/tags" />
		
		<!-- Loop through all tags -->
		<xsl:for-each select="$allTags/tag">
			
			<!-- Sort the list of tags based on the node name -->
			<xsl:sort select="name" order="ascending"/>
			
			<a href="subjects/{replace(name, $prefix, '')}.html" class="list-group-item">
				<xsl:value-of select="replace(name, $prefix, '')" /><br/>
			</a>
				
		</xsl:for-each>
		
	</xsl:template>
	
</xsl:stylesheet>
