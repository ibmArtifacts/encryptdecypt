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
		<xsl:variable name="vPlainText" select="//*[local-name()='ClearText']"/>
		<xsl:variable name="vKey" select="'name:EncryptDecryptKey'"/>

		<!-- The console log for the text and key are commented out to ensure the logs will not capture the plain text or key, but you may uncomment for debugging. -->
		<!-- <xsl:message>****PlainText: <xsl:value-of select="$vPlainText"/>
		</xsl:message>
		<xsl:message>****Key: <xsl:value-of select="$vKey"/>
		</xsl:message> -->
		<xsl:message>****Algorithm: <xsl:value-of select="$vAlgorithm"/>
		</xsl:message>

		<xsl:variable name="vCipherString">
			<xsl:value-of select="dp:encrypt-string($vAlgorithm,$vKey,$vPlainText)"/>
		</xsl:variable>

		<encryptResponse>
			<encryptedText>
				<xsl:value-of select="$vCipherString"/>
			</encryptedText>
		</encryptResponse>

	</xsl:template>

</xsl:stylesheet>
