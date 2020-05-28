<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:csv="csv:csv" xmlns:sol="urn:sol:data"> 
<xsl:output method="text" />
	
<!-- K Caulfield - May 2020 -->
<!-- XSL to transform standard xml output from Solcase dumpfiile to CSV for AGENDA -->

<xsl:variable name="codeStyle"><xsl:text>language-visual-basic</xsl:text></xsl:variable>

<xsl:variable name="delimiter" select="';'"/>

<xsl:variable name="url"></xsl:variable>

<xsl:variable name="newline"><xsl:text>
</xsl:text></xsl:variable>

<csv:columns>
        <column>PARENT_ID</column>
        <column>LINKED</column>
        <column>TITLE</column>
        <column>TYPE_IDENTIFIER</column>
        <column>PARENT_DESCRIPTION</column>
        <column>TYPE</column>
        <column>IDENTIFIER</column>
        <column>DESCRIPTION</column>
        <column>DOCUMENT</column>
</csv:columns>

	<xsl:template name="string-replace"> 
	<xsl:param name="string1" select="''" /> 
	<xsl:param name="string2" select="''" /> 
	<xsl:param name="replacement" select="''" /> 
	<xsl:param name="global" select="true()" /> 
	<xsl:choose> 
		<xsl:when test="contains($string1, $string2)"> 
			<xsl:value-of select="substring-before($string1, $string2)" /> 
			<xsl:value-of select="$replacement" /> 
			<xsl:variable name="rest" select="substring-after($string1, $string2)" /> 
				<xsl:choose> <xsl:when test="$global"> 
					<xsl:call-template name="string-replace"> 
					<xsl:with-param name="string1" select="$rest" /> 
					<xsl:with-param name="string2" select="$string2" /> 
					<xsl:with-param name="replacement" select="$replacement" /> 
					<xsl:with-param name="global" select="$global" /> 
				</xsl:call-template> 
				</xsl:when> 
				<xsl:otherwise> 
					<xsl:value-of select="$rest" /> 
				</xsl:otherwise> 
				</xsl:choose> 
				</xsl:when> 
				<xsl:otherwise> 
					<xsl:value-of select="$string1" /> 
				</xsl:otherwise> 
				</xsl:choose>
	</xsl:template>
		
	<xsl:template name="replaceSolcaseChars">
	<xsl:param name="codeString" select="''" /> 
		<xsl:variable name="scriptCode"><xsl:value-of select="$codeString"/></xsl:variable>
		<xsl:variable name="scriptCodePass1">
			<xsl:call-template name="string-replace">
				<xsl:with-param name="string1">
					<xsl:value-of select="$scriptCode"/>
				</xsl:with-param>
				<xsl:with-param name="string2"     select="'|=|'" />
				<!-- <xsl:with-param name="replacement" select="'&lt;BR/&gt;'" /> -->
				<xsl:with-param name="replacement" select="'&#10;'" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="scriptCodePass2">
			<xsl:call-template name="string-replace">
				<xsl:with-param name="string1">
					<xsl:value-of select="$scriptCodePass1"/>
				</xsl:with-param>
				<xsl:with-param name="string2"     select="'|-|'" />
				<xsl:with-param name="replacement" select="'&quot;'" />
			</xsl:call-template>						
		</xsl:variable>
		<xsl:value-of select="$scriptCodePass2" />
	</xsl:template>
	
	<xsl:template name="replaceSolcaseIfElse">
	<xsl:param name="codeString" select="''" /> 
		<xsl:variable name="scriptCode"><xsl:value-of select="$codeString"/></xsl:variable>
		<xsl:variable name="scriptCodePass1">
			<xsl:call-template name="string-replace">
				<xsl:with-param name="string1">
					<xsl:value-of select="$scriptCode"/>
				</xsl:with-param>
				<xsl:with-param name="string2"     select="'[&amp;EndIf]'" />
				<xsl:with-param name="replacement" select="'[&amp;EndIf]&#10;'" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:call-template name="replaceSolcaseChars">
			<xsl:with-param name="codeString">
				<xsl:value-of select="$scriptCodePass1"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
		
		
    <xsl:template match="/SOLCASE">
        <!-- Output the CSV header -->
        <xsl:for-each select="document('')/*/csv:columns/*">
            <xsl:value-of select="upper-case(.)"/>
            <xsl:if test="position() != last()">
                <xsl:value-of select="$delimiter"/>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$newline"/>
        <xsl:for-each-group select="AGENDA" group-by="if (exists(./NE/@PARENT_ID)) then ./NE/@PARENT_ID else 99999999">
            <xsl:sort select="current-grouping-key()" data-type="number"/>
            <xsl:for-each-group select="current-group()" group-by="if (exists(./LE/@LINKED)) then ./LE/@LINKED else -1">
                <xsl:sort select="current-grouping-key()" data-type="number"/>
                <xsl:for-each-group select="current-group()" group-by="if (exists(./SE/@POSN_ID)) then ./SE/@POSN_ID else -1">
                    <xsl:sort select="current-grouping-key()" data-type="number"/>
                        <xsl:value-of select="./NE/@PARENT_ID" /><xsl:value-of select="$delimiter"/>
                        <xsl:value-of select="concat('#',./LE/@LINKED)" /><xsl:value-of select="$delimiter"/><xsl:value-of select="$delimiter"/>
                        <xsl:value-of select="/SOLCASE/AGENDA[./NE/@PARENT_ID=current()/LE/@LINKED]/DE[1]/@DESCRIPTION" /><xsl:value-of select="$delimiter"/>
                        <xsl:value-of select="concat(./TY/@TYPE,'-',./ID/@IDENTIFIER)" /><xsl:value-of select="$delimiter"/>
                        <xsl:value-of select="./ID/@IDENTIFIER" /><xsl:value-of select="$delimiter"/>
                        <xsl:value-of select="./DE[1]/@DESCRIPTION" /><xsl:value-of select="$delimiter"/>
                        <xsl:value-of select="./DO/@DOCUMENT" />
                        <xsl:value-of select="$newline"/>
                        <!--<xsl:if test="./IN[@IN_NUMBER='1']">
                            <td>
                                <pre><code>
                                    <xsl:call-template name="replaceSolcaseIfElse">
                                        <xsl:with-param name="codeString">
                                            <xsl:value-of select="./IN[@IN_NUMBER='1']"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                
                                    <xsl:value-of select="$newline" />
                                    <xsl:text>**** Standard Code References ***</xsl:text>
                                    <xsl:value-of select="$newline" />
                                    
                                    <xsl:variable name="values">
                                        <xsl:for-each select="./IN[@IN_NUMBER='1'][matches(.,'([A-Z][A-Z][0-9][0-9])')]">
                                            <xsl:analyze-string select="." regex="([A-Z][A-Z][0-9][0-9])">
                                                <xsl:matching-substring>
                                                    <xsl:value-of select="concat(.,' ')"/>
                                                </xsl:matching-substring>
                                            </xsl:analyze-string>
                                        </xsl:for-each>
                                    </xsl:variable>	
                                    
                                    <xsl:variable name="uniqueValues" select="distinct-values(tokenize($values, ' '))"/>
                                    
                                    <xsl:for-each select="$uniqueValues">
                                        <xsl:value-of select="."/>
                                        <xsl:text>: </xsl:text>
                                        <xsl:apply-templates select="$standard-code">
                                            <xsl:with-param name="sol-desc" select="."/>
                                        </xsl:apply-templates>
                                        <xsl:value-of select="$newline" />
                                    </xsl:for-each>
                                    
                                </code></pre>						
                            </td>
                        </xsl:if>
                        </tr>
                        <xsl:if test="./IN[@IN_NUMBER='2']">
                        <tr>
                        <td valign="top"></td>					
                        <td>
                            <pre><code>
                                <xsl:call-template name="replaceSolcaseIfElse">
                                    <xsl:with-param name="codeString">
                                        <xsl:value-of select="./IN[@IN_NUMBER='2']"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </code></pre>	
                        </td>				
                        </tr>
                        </xsl:if>
                        <xsl:if test="./SS[@SS_NUMBER='1']">
                        <tr>
                        <td valign="top">Pre-Script</td>
                        <td>
                            <pre><code>
                                <xsl:call-template name="replaceSolcaseChars">
                                    <xsl:with-param name="codeString">
                                        <xsl:value-of select="./SS[@SS_NUMBER='1']"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </code></pre>
                        </td>
                        
                        </tr>
                        </xsl:if>
                        <xsl:if test="./SS[@SS_NUMBER='2']">
                        <tr>
                        <td valign="top">Post-Script</td>
                        
                        <td>
                        <pre><code>
                            <xsl:call-template name="replaceSolcaseChars">
                                <xsl:with-param name="codeString">
                                    <xsl:value-of select="./SS[@SS_NUMBER='2']"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </code></pre>
                        </td>					
                        </tr>
                        </xsl:if> -->
                </xsl:for-each-group>
            </xsl:for-each-group>
        </xsl:for-each-group>
	</xsl:template>	

</xsl:stylesheet>
