<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output method='html' version='1.0' encoding='UTF-8'
		indent='yes' />
	<xsl:template match="/">
		<html>
			<body>
				<h2>

					<p align="center">
						Moolya Software Testing Pvt Ltd
						<img align="right" width="200" height="100"
							src="/Users/manikandan/Robo/NoTestword/moolya.PNG" class="CalloutRightPhoto" />
					</p>

					<p align="center">Flipkart Ebook Automation Test Report
					</p>
				</h2>


				<p align="left">
					<table border="1">
						<tr bgcolor="#9E289E">

							<th align="left">
								<font face="Arial,Helvetica" size="4" color="white">Project Name
								</font>
							</th>

						</tr>
						<xsl:for-each select="testrun">
							<tr>
								<td>
									<xsl:value-of select="@project" />
								</td>
							</tr>
						</xsl:for-each>


					</table>
				</p>



				<p align="left">
					<table border="1">
						<tr bgcolor="#9E289E">
							<th align="left">
								<font face="Arial,Helvetica" size="4" color="white">Package Name</font>
							</th>

						</tr>
						<tr>
							<xsl:for-each select="testrun/testsuite/testsuite">
								<tr>
									<td>
										<xsl:value-of select="@name" />
									</td>
								</tr>
							</xsl:for-each>
						</tr>
					</table>
				</p>

				<p align="left">
					<table border="1">
						<tr bgcolor="#9E289E">

							<th align="center">
								<font face="Arial,Helvetica" size="4" color="white">Device Name</font>
							</th>
							<th align="center">
								<font face="Arial,Helvetica" size="4" color="white">Time Take in
									(hh:mm:ss)</font>
							</th>

						</tr>


						<xsl:for-each select="testrun/testsuite">


							<tr>
								<td>
									<xsl:value-of select="@name" />
								</td>
								<xsl:choose>
									<xsl:when test="not(@time)">
										<th align="center">
											<font face="Arial,Helvetica" size="4" color="black">Test
												Incompleted</font>
										</th>
									</xsl:when>
									<xsl:otherwise>
										<xsl:variable name="time" select="@time" />
										<xsl:variable name="hhmmss">
											<xsl:variable name="hh" select="floor($time div 3600)" />
											<xsl:variable name="mm" select="floor($time div 60) mod 60" />
											<xsl:variable name="ss" select="round ($time mod 60)" />

											<xsl:if test="$hh &lt; 10">
												<xsl:text>0</xsl:text>
											</xsl:if>
											<xsl:value-of select="$hh" />
											<xsl:text>:</xsl:text>
											<xsl:if test="$mm &lt; 10">
												<xsl:text>0</xsl:text>
											</xsl:if>
											<xsl:value-of select="$mm" />
											<xsl:text>:</xsl:text>
											<xsl:if test="$ss &lt; 10">
												<xsl:text>0</xsl:text>
											</xsl:if>
											<xsl:value-of select="$ss" />


										</xsl:variable>
										<td align="center">
											<xsl:value-of select="$hhmmss" />
										</td>
									</xsl:otherwise>

								</xsl:choose>
							</tr>


						</xsl:for-each>


					</table>
				</p>
				<p>
					<table border="1">
						<tr bgcolor="#9E289E">
							<th align="left">
								<font face="Arial,Helvetica" size="4" color="white">Test Result</font>
							</th>

						</tr>

					</table>


					<table border="1">
						<tr bgcolor="#9E289E">

							<th align="left">
								<font face="Arial,Helvetica" size="4" color="white">No of Tests</font>
							</th>
							<th align="left">
								<font face="Arial,Helvetica" size="4" color="white">Tests Started</font>
							</th>
                                                        <th align="left">
								<font face="Arial,Helvetica" size="4" color="white">No of Passed</font>
							</th>
							<th align="left">
								<font face="Arial,Helvetica" size="4" color="white">No of Failures</font>
							</th>
							<th align="left">
								<font face="Arial,Helvetica" size="4" color="white">No of Errors</font>
							</th>
							<th align="left">
								<font face="Arial,Helvetica" size="4" color="white">No of Ignored</font>
							</th>

						</tr>
						<xsl:for-each select="testrun">
							<tr>
								<td align="center">
									<xsl:value-of select="@tests" />
								</td>
								<td align="center">
									<xsl:value-of select="@started" />
								</td>
                                                                <td align="center">
									<xsl:value-of select="@started - @failures" />
								</td>
								<td align="center">
									<xsl:value-of select="@failures" />
								</td>
								<td align="center">
									<xsl:value-of select="@errors" />
								</td>
								<td align="center">
									<xsl:value-of select="@ignored" />
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</p>


				<table border="1">
					<tr bgcolor="#9E289E">

						<th align="left">
							<font face="Arial,Helvetica" size="4" color="white">Test Name</font>
						</th>
						<th align="left">
							<font face="Arial,Helvetica" size="4" color="white">Class Name</font>
						</th>
						<th align="left">
							<font face="Arial,Helvetica" size="4" color="white">Time Taken in
								(hh:mm:ss)</font>
						</th>
						<th align="left">
							<font face="Arial,Helvetica" size="4" color="white">Result</font>
						</th>
                                               

					</tr>
					<xsl:for-each select="testrun/testsuite/testsuite/testcase">

                                                           
						<tr> 
							<td align="center">
                                                         
								<xsl:value-of select="@name" />
                                                                
                                                                
								<td>
									<xsl:value-of select="@classname" />
								</td>

								<xsl:choose>
									<xsl:when test="not(@time)">
										<th align="left">
											<font face="Arial,Helvetica" size="4" color="black">Test
												Incompleted</font>
										</th>
									</xsl:when>
									<xsl:otherwise>
										<xsl:variable name="time" select="@time" />
										<xsl:variable name="hhmmss">
											<xsl:variable name="hh" select="floor($time div 3600)" />
											<xsl:variable name="mm" select="floor($time div 60) mod 60" />
											<xsl:variable name="ss" select="round ($time mod 60)" />
											<xsl:if test="$hh &lt; 10">
												<xsl:text>0</xsl:text>
											</xsl:if>
											<xsl:value-of select="$hh" />
											<xsl:text>:</xsl:text>
											<xsl:if test="$mm &lt; 10">
												<xsl:text>0</xsl:text>
											</xsl:if>
											<xsl:value-of select="$mm" />
											<xsl:text>:</xsl:text>
											<xsl:if test="$ss &lt; 10">
												<xsl:text>0</xsl:text>
											</xsl:if>
											<xsl:value-of select="$ss" />
										</xsl:variable>
										<td align="center">
                                                                                 
                                                                                  
                                                                                  <xsl:value-of select="$hhmmss" />
										</td>
									</xsl:otherwise>
								</xsl:choose>
								<td>

									<xsl:choose>
                                                                          
										<xsl:when test="not(failure)">
                                                                                  <xsl:choose>
                                                                                  
                                                                                  <xsl:when test="not(error)">
                                                                                    
											<xsl:choose>
												<xsl:when test="@incomplete">
													<xsl:attribute name="style">background-color:red;</xsl:attribute>
											<font face="Arial,Helvetica" size="4" color="white">Fail</font>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="style">background-color:green;</xsl:attribute>
											 <font face="Arial,Helvetica" size="4" color="white">Pass</font>
												</xsl:otherwise>
											</xsl:choose>
                                                                                        
                                                                                        </xsl:when>
                                                                                  
                                                                                  <xsl:otherwise>
                                                                                     <font face="Arial,Helvetica" size="4" color="red">Error :</font>
                                                                                 <p><xsl:value-of select="error" /></p>
                                                                                  </xsl:otherwise>
                                                                                  </xsl:choose>
                                                                                  
										</xsl:when>
                                                                                
										<xsl:otherwise>
                                                                                  <font face="Arial,Helvetica" size="4" color="red">Failure : </font>
								
                                                                			<p ><xsl:value-of select="failure" /></p>
										</xsl:otherwise>

									</xsl:choose>

								</td>

							</td>
                                            
						</tr>
					</xsl:for-each>
                                        


					<p>
						<table border="1">
							<tr bgcolor="#9E289E">
								<th align="left">
									<font face="Arial,Helvetica" size="4" color="white">Note</font>
								</th>
							</tr>
						</table>
						<table border="1">
							<tr>
								<tr>
									<th align="left">
										<font face="Arial,Helvetica" size="4" color="#9E289E">Failure :</font>
										Failures are when your test cases fail - i.e. your assertions
										are incorrect.
									</th>
								</tr>
								<tr>
									<th align="left">
										<font face="Arial,Helvetica" size="4" color="#9E289E">Error :</font>
										Errors are unexpected errors that occur while trying to
										actually run the test.
										For example, a NullPointer, or a ClassNotFound exception will
										report an error.
									</th>
								</tr>
								<tr>
									<th align="left">
										<font face="Arial,Helvetica" size="4" color="#9E289E">Ignored :</font>
										Errors are unexpected errors that occur while trying to
										actually run the test.
										For example, a NullPointer, or a ClassNotFound exception will
										report an error.
									</th>
								</tr>

							</tr>
						</table>
					</p>
				</table>
				<p align="center">© Moolya Software Testing Pvt Ltd
				</p>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
