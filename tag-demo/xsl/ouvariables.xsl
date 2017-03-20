<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet>
<!-- 
Implementations Skeletor v3 - 5/10/2014

IMPLEMENTATION VARIABLES 
Define global implementation variables here, so that they may be accessed by all page types and in the info/debug tabs.
This also provides a convenient area for complicated logic to exist without clouding up the general xsl/html structure.

Contributors: OU Campus
Last Updated: 
-->
<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ou="http://omniupdate.com/XSL/Variables"
    xmlns:fn="http://omniupdate.com/XSL/Functions"
    xmlns:ouc="http://omniupdate.com/XSL/Variables"
    exclude-result-prefixes="ou xsl xs fn ouc">

	<!--
		
	System Params - don't edit 
	
	-->
	
	<xsl:param name="ou:action"/>
	<xsl:param name="ou:root"/>
	<xsl:param name="ou:site"/>
	<xsl:param name="ou:path"/>
	<xsl:param name="ou:dirname"/>
	<xsl:param name="ou:filename"/>
	<xsl:param name="ou:username"/>
	<xsl:param name="ou:lastname"/>
	<xsl:param name="ou:firstname"/>
	<xsl:param name="ou:email"/>
	<xsl:param name="ou:httproot"/>
	<xsl:param name="ou:ftproot"/>
	<xsl:param name="ou:ftphome"/>
	<xsl:param name="ou:ftpdir"/>
	<xsl:param name="ou:created" as="xs:dateTime"/>
	<xsl:param name="ou:modified" as="xs:dateTime"/>
	<xsl:param name="ou:feed"/>
	<xsl:param name="ou:stagingpath"/>
	
	<!-- 
	
	Implementation Specific Variables 
	
	-->
	<xsl:param name="bodyClass" />
	
	<!-- server information -->
	<xsl:param name="serverType" select="'aspx'"/> 
	<xsl:param name="index-file" select="'index'"/> 
	<xsl:param name="extension" select="'aspx'"/> 	

	<!-- for various concatenation purposes -->
	<xsl:param name="dirname" select="if(string-length($ou:dirname) = 1) then $ou:dirname else concat($ou:dirname,'/')" />
	<xsl:param name="domain" select="substring($ou:httproot,1,string-length($ou:httproot)-1)" /> 				
	<xsl:param name="path" select="substring($ou:root,1,string-length($ou:httproot)-1)"/>
	
	<!-- section property files -->
	<xsl:param name="props-file" select="'_props.pcf'"/> 	
	<xsl:param name="props-path" select="if ($ou:props='') then concat($ou:root, $ou:site, $dirname, $props-file) else concat($ou:root, $ou:site, $ou:props)"/>
	
	<!-- for the following, all are set with start and end slash: /folder/ -->
	<xsl:param name="ou:breadcrumbStart"/> <!-- top level breadcrumb -->
		
	<!-- page information -->
	<xsl:variable name="pageType" select="/document/parameter[@name='pagetype']"/>
	<xsl:variable name="pageTitle" select="/document/ouc:properties[@label='metadata']/title" />
	
	
	<!-- directory variables -->
	<xsl:param name="ou:sidebar-widget-1"/>
	<xsl:param name="ou:props"/>
	<xsl:param name="ou:footer"/>
	<xsl:param name="ou:subnav"/>
	<xsl:param name="ou:sidenav"/>
	<xsl:param name="ou:analytics"/>
	<xsl:param name="ou:css"/>
	
	<!-- blog variables -->
	<xsl:param name="tags"/>
	<xsl:param name="firstdir"/>
	<xsl:param name="add-tags"/>

						
	
</xsl:stylesheet>
