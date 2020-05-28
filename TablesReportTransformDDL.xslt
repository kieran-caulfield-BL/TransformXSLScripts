<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xalan="http://xml.apache.org/xslt" xmlns:progress="urn:progress:data"> 
	
<!-- K Caulfield - Aug 2019 -->
<!-- XSL to transform standard xml output from Solcase tables dumpfile -->
<xsl:output method="text" indent="yes" xalan:indent-amount="1" />
<xsl:strip-space elements="*"/>

<!-- Progress FieldType Code Lookup Key -->
<xsl:key name="type-lookup" match="progress:code" use="progress:desc"/>

<!-- Progress DB Field Type lookup -->
<progress:codes>
	<progress:code><progress:desc>char</progress:desc><progress:value>VARCHAR(10)</progress:value></progress:code>
	<progress:code><progress:desc>char[3]</progress:desc><progress:value>VARCHAR(3)</progress:value></progress:code>
	<progress:code><progress:desc>char[5]</progress:desc><progress:value>VARCHAR(5)</progress:value></progress:code>
	<progress:code><progress:desc>char[6]</progress:desc><progress:value>VARCHAR(6)</progress:value></progress:code>
	<progress:code><progress:desc>char[9]</progress:desc><progress:value>VARCHAR(9)</progress:value></progress:code>
	<progress:code><progress:desc>char[10]</progress:desc><progress:value>VARCHAR(10)</progress:value></progress:code>
	<progress:code><progress:desc>char[14]</progress:desc><progress:value>VARCHAR(14)</progress:value></progress:code>
	<progress:code><progress:desc>char[15]</progress:desc><progress:value>VARCHAR(15)</progress:value></progress:code>
	<progress:code><progress:desc>char[20]</progress:desc><progress:value>VARCHAR(15)</progress:value></progress:code>
	<progress:code><progress:desc>char[24]</progress:desc><progress:value>VARCHAR(24)</progress:value></progress:code>
	<progress:code><progress:desc>char[30]</progress:desc><progress:value>VARCHAR(30)</progress:value></progress:code>
	<progress:code><progress:desc>char[32]</progress:desc><progress:value>VARCHAR(30)</progress:value></progress:code>
	<progress:code><progress:desc>char[50]</progress:desc><progress:value>VARCHAR(50)</progress:value></progress:code>
	<progress:code><progress:desc>deci-2</progress:desc><progress:value>DECIMAL(2)</progress:value></progress:code>
	<progress:code><progress:desc>deci-2[150]</progress:desc><progress:value>DECIMAL(2)</progress:value></progress:code>
	<progress:code><progress:desc>deci-2[50]</progress:desc><progress:value>DECIMAL(2)</progress:value></progress:code>
	<progress:code><progress:desc>deci-2[30]</progress:desc><progress:value>DECIMAL(2)</progress:value></progress:code>
	<progress:code><progress:desc>deci-2[13]</progress:desc><progress:value>DECIMAL(2)</progress:value></progress:code>
	<progress:code><progress:desc>deci-2[9]</progress:desc><progress:value>DECIMAL(2)</progress:value></progress:code>
	<progress:code><progress:desc>deci-2[8]</progress:desc><progress:value>DECIMAL(2)</progress:value></progress:code>
	<progress:code><progress:desc>deci-2[5]</progress:desc><progress:value>DECIMAL(2)</progress:value></progress:code>
	<progress:code><progress:desc>deci-3</progress:desc><progress:value>DECIMAL(3)</progress:value></progress:code>
	<progress:code><progress:desc>deci-4</progress:desc><progress:value>DECIMAL(4)</progress:value></progress:code>
	<progress:code><progress:desc>deci-6</progress:desc><progress:value>DECIMAL(6)</progress:value></progress:code>
	<progress:code><progress:desc>inte</progress:desc><progress:value>INT</progress:value></progress:code>
	<progress:code><progress:desc>inte[9]</progress:desc><progress:value>INT</progress:value></progress:code>
	<progress:code><progress:desc>inte[10]</progress:desc><progress:value>INT</progress:value></progress:code>
	<progress:code><progress:desc>inte[13]</progress:desc><progress:value>BIGINT</progress:value></progress:code>
	<progress:code><progress:desc>inte[20]</progress:desc><progress:value>BIGINT</progress:value></progress:code>
	<progress:code><progress:desc>logi</progress:desc><progress:value>TINYINT</progress:value></progress:code>
	<progress:code><progress:desc>logi[5]</progress:desc><progress:value>VARCHAR(5)</progress:value></progress:code>
	<progress:code><progress:desc>logi[9]</progress:desc><progress:value>VARCHAR(9)</progress:value></progress:code>
	<progress:code><progress:desc>logi[10]</progress:desc><progress:value>VARCHAR(10)</progress:value></progress:code>
	<progress:code><progress:desc>logi[50]</progress:desc><progress:value>VARCHAR(50)</progress:value></progress:code>
	<progress:code><progress:desc>date</progress:desc><progress:value>DATE</progress:value></progress:code>
	<progress:code><progress:desc>datetm</progress:desc><progress:value>DATE</progress:value></progress:code>
	<progress:code><progress:desc>date[5]</progress:desc><progress:value>DATETIME</progress:value></progress:code>
	<progress:code><progress:desc>date[10]</progress:desc><progress:value>DATE</progress:value></progress:code>
	<progress:code><progress:desc>date[13]</progress:desc><progress:value>DATETIME</progress:value></progress:code>
	<progress:code><progress:desc>date[20]</progress:desc><progress:value>DATETIME</progress:value></progress:code>
	<progress:code><progress:desc>date[50]</progress:desc><progress:value>DATETIME</progress:value></progress:code>
</progress:codes>

<!-- Anchor to lookup table in this.document -->
<xsl:variable name="type-code" select="document('')/*/progress:codes"/>
	
<xsl:variable name="newline"><xsl:text>
</xsl:text></xsl:variable>
<xsl:variable name="spacer"><xsl:text> </xsl:text></xsl:variable>

	<xsl:template match="/SOLDB">
		<xsl:text>SELECT DATABASE();</xsl:text><xsl:value-of select="$newline" />
		<xsl:text>USE `SOL`;</xsl:text><xsl:value-of select="$newline" />
		<xsl:for-each select="TABLE">
				<xsl:sort select="./@TableName"/>
					<xsl:value-of select="$newline" /><xsl:text>DROP TABLE IF EXISTS </xsl:text><xsl:value-of select="'&#96;'"/><xsl:value-of select="./@TableName"/><xsl:value-of select="'&#96;'"/><xsl:text>;</xsl:text><xsl:value-of select="$newline" />
					<xsl:text>CREATE TABLE </xsl:text><xsl:value-of select="'&#96;'"/><xsl:value-of select="./@TableName"/><xsl:value-of select="'&#96;'"/> <xsl:text>(</xsl:text><xsl:value-of select="$newline" />
							<xsl:for-each select="FIELDS/FIELD">
								<!-- theres a bug , we need to avoid numeric field nnames -->
								<xsl:choose>
									<xsl:when test="string(number(./@FieldName)) = 'NaN'">
										<xsl:value-of select="'&#96;'"/>
											<xsl:value-of select="./@FieldName"/>
										<xsl:value-of select="'&#96;'"/>
										<xsl:value-of select="$spacer" />
											<xsl:apply-templates select="$type-code">
												<xsl:with-param name="progress-desc" select="./@DataType"/>
											</xsl:apply-templates>
										<xsl:choose>
											<xsl:when test="position() != last()">
												<xsl:value-of select="'&#44;'"/><xsl:value-of select="$newline" />
											</xsl:when>
											<xsl:otherwise> <!-- on the last Field -->
												<xsl:choose>
													<xsl:when test="../../INDEX"> <!-- if there is an INDEX then add a comma -->
														<xsl:value-of select="'&#44;'"/><xsl:value-of select="$newline" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$newline" />
													</xsl:otherwise>
												</xsl:choose>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>							
							<xsl:for-each select="INDEX">
								<xsl:choose>
									<xsl:when test="./INDEX-TYPE/@IndexType = 'primary-unique'">
										<xsl:text>PRIMARY KEY </xsl:text><xsl:value-of select="'&#96;'"/><xsl:value-of select="./@IndexName"/><xsl:value-of select="'&#96;'"/><xsl:text>(</xsl:text>
									</xsl:when>
									<xsl:when test="./INDEX-TYPE/@IndexType = 'primary'">
										<xsl:text>PRIMARY KEY </xsl:text><xsl:value-of select="'&#96;'"/><xsl:value-of select="./@IndexName"/><xsl:value-of select="'&#96;'"/><xsl:text>(</xsl:text>
									</xsl:when>									
									<xsl:otherwise>
										<xsl:text>INDEX </xsl:text><xsl:value-of select="'&#96;'"/><xsl:value-of select="./@IndexName"/><xsl:value-of select="'&#96;'"/><xsl:text>(</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:for-each select="./FIELD">
									<xsl:value-of select="'&#96;'"/><xsl:value-of select="./@IndexFieldName"/><xsl:value-of select="'&#96;'"/><xsl:text> ASC</xsl:text>
										<xsl:choose>
											<xsl:when test="position() != last()">
												<xsl:value-of select="'&#44;'"/>
											</xsl:when>
										</xsl:choose>
								</xsl:for-each>
								<xsl:text>) VISIBLE</xsl:text>
								<xsl:choose>
									<xsl:when test="position() != last()">
										<xsl:value-of select="'&#44;'"/><xsl:value-of select="$newline" />
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>						
							<xsl:value-of select="$newline" /><xsl:text>) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;</xsl:text>					
				</xsl:for-each>
	</xsl:template>

<xsl:template match="progress:codes">
  <xsl:param name="progress-desc"/>
  <xsl:value-of select="key('type-lookup', $progress-desc)/progress:value"/>
 </xsl:template>

</xsl:stylesheet>