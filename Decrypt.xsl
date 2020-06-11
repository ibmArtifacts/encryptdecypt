<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dp="http://www.datapower.com/extensions"
	xmlns:dpconfig="http://www.datapower.com/param/config"
	xmlns:apim="http://www.ibm.com/apimanagement"
	xmlns:webapi="http://www.ibm.com/apimanagement"
	xmlns:func="http://exslt.org/functions"
	xmlns:wxsl="http://www.w3.org/1999/XSL/TransformAlias"
	xmlns:exsl="http://exslt.org/common"
	extension-element-prefixes="dp dpconfig exsl apim"
	exclude-result-prefixes="wxsl func dp">

	<xsl:template match="/">
		<xsl:variable name="vAlgorithm" select="'http://www.w3.org/2001/04/xmlenc#aes256-cbc'"/>
		<xsl:variable name="vKey" select="'name:EncryptDecryptKey'"/>
		<xsl:variable name="vEncryptedText" select="//*[local-name()='encryptedtext']"/>

		<xsl:message>****Encrypted Text: <xsl:value-of select="$vEncryptedText"/>
		</xsl:message>
		<xsl:message>****Algorithm: <xsl:value-of select="$vAlgorithm"/>
		</xsl:message>
		<xsl:message>****Key: <xsl:value-of select="$vKey"/>
		</xsl:message>

		<xsl:variable name="vDecrypt">
			<xsl:value-of select="dp:decrypt-data($vAlgorithm,$vKey,$vEncryptedText)"/>
		</xsl:variable>

		<decryptedResponse>
			<decryptedText>
				<xsl:value-of select="$vDecrypt"/>
			</decryptedText>
		</decryptedResponse>
	</xsl:template>



</xsl:stylesheet>
