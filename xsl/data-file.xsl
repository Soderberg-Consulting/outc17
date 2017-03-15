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
	<xsl:import href="common.xsl"/>
	
	<xsl:template match="/document">
		<html lang="en">
			
			<head>
				<link href="//netdna.bootstrapcdn.com/bootswatch/3.1.0/cerulean/bootstrap.min.css" rel="stylesheet"/>
				<link href="../tag-demo.css" rel="stylesheet" />
			</head>
			
			<body id="properties">
				
				<div class="container">
					<h1>Data File</h1>
					<div class="alert alert-warning">
						<p><strong>Data File:</strong> This file does not need to be published, however the pages that pull data from this file do.</p>
					</div>
					
					<xsl:call-template name="display-journal">
						<xsl:with-param name="page-props" select="ouc:properties[@label='config']" />
					</xsl:call-template>
					
					<hr/>
					
					<h3>Tags:</h3>
					<p>Tags are used for 'subject' and 'resource type' sorting.</p>
					<ul>
						
					<xsl:for-each select="doc( concat('ou:/Tag/GetTags?', 'site=', $ou:site, '&amp;path=', replace($ou:path, '.html', '.pcf') ) )/tags/tag">
						<li><xsl:value-of select="name" /></li>
					</xsl:for-each>
					</ul>
					
				</div>
				
				<div style="display:none;">
					<ouc:div label="fake" group="fake" button="hide"/>
				</div>
				
			</body>
		</html>
		
			
	</xsl:template>
	
	
</xsl:stylesheet>
