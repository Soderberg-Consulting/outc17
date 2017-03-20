<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet>
<!--
Implementations Skeletor v3 - 5/10/2014

SECTION PROPERTIES 

Contributors: Jesse Clark <jesse.clark@unco.edu>
Last Updated: March 20th, 2017
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
				<link href="/outc17/tag-demo.css" rel="stylesheet" />
				<title><xsl:value-of select="ouc:properties[@label='config']/parameter[@name='page-title']" /></title>
			</head>

			<body id="properties">
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
				
						<!-- call content which is on a nested template -->
						<xsl:call-template name="content" />
				
					</div>
				</div>
				
				<footer>
					<p><a href="/outc17/azlist.html" class="btn btn-default">A-Z List</a></p>
					<p><a href="/outc17/index.html" class="btn btn-default">Home</a></p>
				</footer>
			</body>
		</html>

	</xsl:template>




</xsl:stylesheet>
