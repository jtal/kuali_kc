<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:PHS_Fellowship_Supplemental="http://apply.grants.gov/forms/PHS_Fellowship_Supplemental-V1.0" xmlns:att="http://apply.grants.gov/system/Attachments-V1.0" xmlns:codes="http://apply.grants.gov/system/UniversalCodes-V2.0" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:glob="http://apply.grants.gov/system/Global-V1.0" xmlns:globLib="http://apply.grants.gov/system/GlobalLibrary-V2.0" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output version="1.0" method="xml" encoding="UTF-8" indent="no"/>
	<xsl:param name="SV_OutputFormat" select="'PDF'"/>
	<xsl:variable name="XML" select="/"/>
	<xsl:variable name="fo:layout-master-set">
		<fo:layout-master-set>
			<fo:simple-page-master master-name="default-page" page-height="11.0in" page-width="8.5in" margin-left="0.35in" margin-right="0.35in">
				<fo:region-body margin-top="0.7in" margin-bottom="0.5in"/>
				<fo:region-before extent="0.7in"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:variable>
	<xsl:template match="/">
		<fo:root>
			<xsl:copy-of select="$fo:layout-master-set"/>
			<fo:page-sequence master-reference="default-page" initial-page-number="1" format="1">
				<xsl:call-template name="headerall"/>
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<xsl:for-each select="$XML">
							<fo:inline-container>
								<fo:block>
									<xsl:text>&#x2029;</xsl:text>
								</fo:block>
							</fo:inline-container>
							<fo:table font-family="Verdana" font-size="10pt" table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-body start-indent="0pt">
									<fo:table-row>
										<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
											<fo:block>
												<fo:inline-container>
													<fo:block>
														<xsl:text>&#x2029;</xsl:text>
													</fo:block>
												</fo:inline-container>
												<fo:table table-layout="fixed" width="100%" border-spacing="2pt">
													<fo:table-column column-width="proportional-column-width(1)"/>
													<fo:table-body start-indent="0pt">
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline font-weight="bold">
																		<xsl:text>A. Application Type:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding-left="20pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>From SF424 (R&amp;R) Cover Page. The response provided on that page, regarding the type of application being submitted, is repeated here for your reference, as you attach the sections that are appropriate for this Career Development Award.</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding-left="22pt" padding="2pt" display-align="center">
																<fo:block>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:ApplicationType">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:TypeOfApplication">
																				<xsl:choose>
																					<xsl:when test="string(.)='New'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> New&#160;&#160;&#160;&#160;&#160; </xsl:text>
																				</fo:inline>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:ApplicationType">
																			<xsl:choose>
																				<xsl:when test="string(.)='Resubmission'">
																					<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																						<xsl:text>&#x2714;</xsl:text>
																					</fo:inline>
																				</xsl:when>
																				<xsl:otherwise>
																					<fo:inline border="solid 1pt black">
																						<fo:leader leader-length="10pt" leader-pattern="space"/>
																					</fo:inline>
																				</xsl:otherwise>
																			</xsl:choose>
																			<fo:inline>
																				<xsl:text> Resubmission&#160;&#160;&#160;&#160;&#160; </xsl:text>
																			</fo:inline>
																		</xsl:for-each>
																	</xsl:for-each>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:ApplicationType">
																			<xsl:choose>
																				<xsl:when test="string(.)='Renewal'">
																					<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																						<xsl:text>&#x2714;</xsl:text>
																					</fo:inline>
																				</xsl:when>
																				<xsl:otherwise>
																					<fo:inline border="solid 1pt black">
																						<fo:leader leader-length="10pt" leader-pattern="space"/>
																					</fo:inline>
																				</xsl:otherwise>
																			</xsl:choose>
																			<fo:inline>
																				<xsl:text> Renewal&#160;&#160;&#160;&#160;&#160; </xsl:text>
																			</fo:inline>
																		</xsl:for-each>
																	</xsl:for-each>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:ApplicationType">
																			<xsl:choose>
																				<xsl:when test="string(.)='Continuation'">
																					<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																						<xsl:text>&#x2714;</xsl:text>
																					</fo:inline>
																				</xsl:when>
																				<xsl:otherwise>
																					<fo:inline border="solid 1pt black">
																						<fo:leader leader-length="10pt" leader-pattern="space"/>
																					</fo:inline>
																				</xsl:otherwise>
																			</xsl:choose>
																			<fo:inline>
																				<xsl:text> Continuation&#160;&#160;&#160;&#160;&#160; </xsl:text>
																			</fo:inline>
																		</xsl:for-each>
																	</xsl:for-each>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:ApplicationType">
																			<xsl:choose>
																				<xsl:when test="string(.)='Revision'">
																					<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																						<xsl:text>&#x2714;</xsl:text>
																					</fo:inline>
																				</xsl:when>
																				<xsl:otherwise>
																					<fo:inline border="solid 1pt black">
																						<fo:leader leader-length="10pt" leader-pattern="space"/>
																					</fo:inline>
																				</xsl:otherwise>
																			</xsl:choose>
																			<fo:inline>
																				<xsl:text> Revision&#160;&#160;&#160;&#160;&#160; </xsl:text>
																			</fo:inline>
																		</xsl:for-each>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
											<fo:block>
												<fo:inline-container>
													<fo:block>
														<xsl:text>&#x2029;</xsl:text>
													</fo:block>
												</fo:inline-container>
												<fo:table table-layout="fixed" width="100%" border-spacing="2pt">
													<fo:table-column column-width="40%"/>
													<fo:table-column column-width="60%"/>
													<fo:table-body start-indent="0pt">
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline font-weight="bold">
																		<xsl:text>B. Research Training Plan</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>1. Introduction to Application</xsl:text>
																	</fo:inline>
																	<fo:block/>
																	<fo:inline>
																		<xsl:text>(for RESUBMISSION applications only)</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table font-family="Verdana" font-size="9pt" table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:IntroductionToApplication">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>2. * Specific Aims</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table font-family="Verdana" font-size="9pt" table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:SpecificAims">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>3. * Background and Significance</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table font-family="Verdana" font-size="9pt" table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:BackgroundAndSignificance">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>4. * Preliminary Studies/Progress Report</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table font-family="Verdana" font-size="9pt" table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:PreliminaryStudiesProgressReport">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>5. * Research Design and Methods</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchDesignAndMethods">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>6. Inclusion Enrollment Report</xsl:text>
																	</fo:inline>
																	<fo:block/>
																	<fo:inline>
																		<xsl:text>(for RENEWAL applications only)</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table font-family="Verdana" font-size="9pt" table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:InclusionEnrollmentReport">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>7. Progress Report Publication List</xsl:text>
																	</fo:inline>
																	<fo:block/>
																	<fo:inline>
																		<xsl:text>(for RENEWAL applications only)</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:ProgressReportPublicationList">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
											<fo:block>
												<fo:inline-container>
													<fo:block>
														<xsl:text>&#x2029;</xsl:text>
													</fo:block>
												</fo:inline-container>
												<fo:table table-layout="fixed" width="100%" border-spacing="2pt">
													<fo:table-column column-width="40%"/>
													<fo:table-column column-width="60%"/>
													<fo:table-body start-indent="0pt">
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline text-decoration="underline">
																		<xsl:text>Human Subjects</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding-left="20pt" padding-right="20pt" number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>Please note. The following item is taken from the Research &amp; Related Other Project Information form. The response provided on that page, regarding the involvement of human subjects, is repeated here for your reference as you provide related responses for this Fellowship application. If you wish to change the answer to the item shown below, please do so on the Research &amp; Related Other Project Information form; you will not be able to edit the response here.</xsl:text>
																						</fo:inline>
																						<fo:block/>
																						<fo:inline>
																							<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; Are Human Subjects Involved?&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:HumanSubjectsInvolved">
																									<xsl:choose>
																										<xsl:when test="string(.)='Y: Yes'">
																											<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																												<xsl:text>&#x2714;</xsl:text>
																											</fo:inline>
																										</xsl:when>
																										<xsl:otherwise>
																											<fo:inline border="solid 1pt black">
																												<fo:leader leader-length="10pt" leader-pattern="space"/>
																											</fo:inline>
																										</xsl:otherwise>
																									</xsl:choose>
																									<fo:inline>
																										<xsl:text> Yes&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																									</fo:inline>
																									<xsl:choose>
																										<xsl:when test="string(.)='N: No'">
																											<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																												<xsl:text>&#x2714;</xsl:text>
																											</fo:inline>
																										</xsl:when>
																										<xsl:otherwise>
																											<fo:inline border="solid 1pt black">
																												<fo:leader leader-length="10pt" leader-pattern="space"/>
																											</fo:inline>
																										</xsl:otherwise>
																									</xsl:choose>
																									<fo:inline>
																										<xsl:text> No</xsl:text>
																									</fo:inline>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																						<fo:inline>
																							<xsl:text>&#160;&#160;&#160;&#160;&#160; </xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>8. * Human Subjects Involvement Indefinite?</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;</xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:HumanSubjectsIndefinite">
																				<xsl:choose>
																					<xsl:when test="string(.)='Y: Yes'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> Yes&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																				</fo:inline>
																				<xsl:choose>
																					<xsl:when test="string(.)='N: No'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> No</xsl:text>
																				</fo:inline>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>9. Clinical Trial?</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;</xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:ClinicalTrial">
																				<xsl:choose>
																					<xsl:when test="string(.)='Y: Yes'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> Yes&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																				</fo:inline>
																				<xsl:choose>
																					<xsl:when test="string(.)='N: No'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> No</xsl:text>
																				</fo:inline>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>10. Agency-Defined Phase III Clinical Trial?</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;</xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:Phase3ClinicalTrial">
																				<xsl:choose>
																					<xsl:when test="string(.)='Y: Yes'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> Yes&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																				</fo:inline>
																				<xsl:choose>
																					<xsl:when test="string(.)='N: No'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> No</xsl:text>
																				</fo:inline>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>11. Protection of Human Subjects</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:ProtectionOfHumanSubjects">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>12. Inclusion of Women and Minorities</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:InclusionOfWomenAndMinorities">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>13. Targeted/Planned Enrollment</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:TargetedPlannedEnrollment">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>14. Inclusion of Children</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:InclusionOfChildren">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
											<fo:block>
												<fo:inline-container>
													<fo:block>
														<xsl:text>&#x2029;</xsl:text>
													</fo:block>
												</fo:inline-container>
												<fo:table table-layout="fixed" width="100%" border-spacing="2pt">
													<fo:table-column column-width="40%"/>
													<fo:table-column column-width="60%"/>
													<fo:table-body start-indent="0pt">
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline text-decoration="underline">
																		<xsl:text>Other Research Training Plan Sections</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding-left="20pt" padding-right="20pt" number-columns-spanned="2" padding="2pt" display-align="before">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>Please note. The following item is taken from the Research &amp; Related Other Project Information form. The response provided on that page, regarding the use of vertebrate animals, is repeated here for your reference as you provide related responses for this Fellowship application. If you wish to change the answer to the item shown below, please do so on the Research &amp; Related Other Project Information form; you will not be able to edit the response here.</xsl:text>
																						</fo:inline>
																						<fo:block/>
																						<fo:inline>
																							<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; Are Vertebrate Animals Used?&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:VertebrateAnimalsUsed">
																									<xsl:choose>
																										<xsl:when test="string(.)='Y: Yes'">
																											<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																												<xsl:text>&#x2714;</xsl:text>
																											</fo:inline>
																										</xsl:when>
																										<xsl:otherwise>
																											<fo:inline border="solid 1pt black">
																												<fo:leader leader-length="10pt" leader-pattern="space"/>
																											</fo:inline>
																										</xsl:otherwise>
																									</xsl:choose>
																									<fo:inline>
																										<xsl:text> Yes&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																									</fo:inline>
																									<xsl:choose>
																										<xsl:when test="string(.)='N: No'">
																											<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																												<xsl:text>&#x2714;</xsl:text>
																											</fo:inline>
																										</xsl:when>
																										<xsl:otherwise>
																											<fo:inline border="solid 1pt black">
																												<fo:leader leader-length="10pt" leader-pattern="space"/>
																											</fo:inline>
																										</xsl:otherwise>
																									</xsl:choose>
																									<fo:inline>
																										<xsl:text> No</xsl:text>
																									</fo:inline>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>15. * Vertebrate Animals Use Indefinite?</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;</xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:VertebrateAnimalsIndefinite">
																				<xsl:choose>
																					<xsl:when test="string(.)='Y: Yes'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> Yes&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																				</fo:inline>
																				<xsl:choose>
																					<xsl:when test="string(.)='N: No'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> No</xsl:text>
																				</fo:inline>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>16. Vertebrate Animals</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:VertebrateAnimals">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>17. Select Agent Research</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:SelectAgentResearch">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>18. Resource Sharing Plan</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:ResourceSharingPlan">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>19. * Respective Contributions</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:RespectiveContributions">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>20. * Selection of Sponsor and Institution</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table font-family="Verdana" font-size="9pt" table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:SelectionOfSponsorAndInstitution">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>21. * Responsible Conduct of Research</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table font-family="Verdana" font-size="9pt" table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:ResearchTrainingPlan">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:ResponsibleConductOfResearch">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																										<xsl:for-each select="att:FileName">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
											<fo:block>
												<fo:inline-container>
													<fo:block>
														<xsl:text>&#x2029;</xsl:text>
													</fo:block>
												</fo:inline-container>
												<fo:table table-layout="fixed" width="100%" border-spacing="2pt">
													<fo:table-column column-width="proportional-column-width(1)"/>
													<fo:table-column column-width="proportional-column-width(1)"/>
													<fo:table-body start-indent="0pt">
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline font-weight="bold">
																		<xsl:text>C. Additional Information</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline text-decoration="underline">
																		<xsl:text>Human Embryonic Stem Cells</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>1. * Does the proposed project involve human embryonic stem cells?&#160;&#160; </xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																				<xsl:for-each select="PHS_Fellowship_Supplemental:isHumanStemCellsInvolved">
																					<xsl:choose>
																						<xsl:when test="string(.)='Y: Yes'">
																							<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																								<xsl:text>&#x2714;</xsl:text>
																							</fo:inline>
																						</xsl:when>
																						<xsl:otherwise>
																							<fo:inline border="solid 1pt black">
																								<fo:leader leader-length="10pt" leader-pattern="space"/>
																							</fo:inline>
																						</xsl:otherwise>
																					</xsl:choose>
																					<fo:inline>
																						<xsl:text> Yes&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																					</fo:inline>
																					<xsl:choose>
																						<xsl:when test="string(.)='N: No'">
																							<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																								<xsl:text>&#x2714;</xsl:text>
																							</fo:inline>
																						</xsl:when>
																						<xsl:otherwise>
																							<fo:inline border="solid 1pt black">
																								<fo:leader leader-length="10pt" leader-pattern="space"/>
																							</fo:inline>
																						</xsl:otherwise>
																					</xsl:choose>
																					<fo:inline>
																						<xsl:text> No</xsl:text>
																					</fo:inline>
																				</xsl:for-each>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding-left="20pt" padding-right="20pt" number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>If the proposed project involves human embryonic stem cells, list below the registration number of the specific cell line(s), using the registry information provided within the agency instructions. Or, if a specific stem cell line cannot be referenced at this time, please check the box indicating that one from the</xsl:text>
																	</fo:inline>
																	<fo:block/>
																	<fo:inline>
																		<xsl:text>Registry will be used:</xsl:text>
																	</fo:inline>
																	<fo:block/>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																				<xsl:for-each select="PHS_Fellowship_Supplemental:StemCellsIndicator">
																					<xsl:choose>
																						<xsl:when test="string(.)='Y: Yes'">
																							<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																								<xsl:text>&#x2714;</xsl:text>
																							</fo:inline>
																						</xsl:when>
																						<xsl:otherwise>
																							<fo:inline border="solid 1pt black">
																								<fo:leader leader-length="10pt" leader-pattern="space"/>
																							</fo:inline>
																						</xsl:otherwise>
																					</xsl:choose>
																				</xsl:for-each>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																	<fo:inline>
																		<xsl:text>&#160;&#160; Specific stem cell line cannot be referenced at this time. One from the registry will be used.</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding-left="20pt" number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline text-decoration="underline">
																		<xsl:text>Cell Line(s):</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding-left="20pt" padding-right="50pt" number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 1">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 2">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 3">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 4">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 5">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 6">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 7">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 8">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 9">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 10">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 11">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 12">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 13">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 14">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 15">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 16">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 15">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 18">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 19">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:StemCells">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:CellLines">
																										<xsl:if test="position() = 20">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:if>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
											<fo:block>
												<fo:inline-container>
													<fo:block>
														<xsl:text>&#x2029;</xsl:text>
													</fo:block>
												</fo:inline-container>
												<fo:table table-layout="fixed" width="100%" border-spacing="2pt">
													<fo:table-column column-width="40%"/>
													<fo:table-column column-width="60%"/>
													<fo:table-body start-indent="0pt">
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline text-decoration="underline">
																		<xsl:text>Candidate</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>2. Alternate Phone Number:&#160; </xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table font-family="Verdana" font-size="9pt" table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" height="20" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:AlernatePhoneNumber">
																									<xsl:variable name="value-of-template">
																										<xsl:apply-templates/>
																									</xsl:variable>
																									<xsl:choose>
																										<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																											<fo:block>
																												<xsl:copy-of select="$value-of-template"/>
																											</fo:block>
																										</xsl:when>
																										<xsl:otherwise>
																											<fo:inline>
																												<xsl:copy-of select="$value-of-template"/>
																											</fo:inline>
																										</xsl:otherwise>
																									</xsl:choose>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>3. Graduate Degree Earned (if applicable):</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border-spacing="2pt">
																		<fo:table-column column-width="50%"/>
																		<fo:table-column column-width="30%"/>
																		<fo:table-column column-width="20%"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell padding="2pt" display-align="after">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>Degree:</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="after">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>If &quot;other&quot;, please</xsl:text>
																						</fo:inline>
																						<fo:block/>
																						<fo:inline>
																							<xsl:text>indicate degree type:</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="after">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>Date Earned (month/year):</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline-container>
																							<fo:block>
																								<xsl:text>&#x2029;</xsl:text>
																							</fo:block>
																						</fo:inline-container>
																						<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																							<fo:table-column column-width="proportional-column-width(1)"/>
																							<fo:table-body start-indent="0pt">
																								<fo:table-row>
																									<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																										<fo:block>
																											<fo:inline>
																												<xsl:text>&#160;</xsl:text>
																											</fo:inline>
																											<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																												<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																													<xsl:for-each select="PHS_Fellowship_Supplemental:GraduateDegreeEarned">
																														<xsl:for-each select="PHS_Fellowship_Supplemental:DegreeType">
																															<xsl:variable name="value-of-template">
																																<xsl:apply-templates/>
																															</xsl:variable>
																															<xsl:choose>
																																<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																																	<fo:block>
																																		<xsl:copy-of select="$value-of-template"/>
																																	</fo:block>
																																</xsl:when>
																																<xsl:otherwise>
																																	<fo:inline>
																																		<xsl:copy-of select="$value-of-template"/>
																																	</fo:inline>
																																</xsl:otherwise>
																															</xsl:choose>
																														</xsl:for-each>
																													</xsl:for-each>
																												</xsl:for-each>
																											</xsl:for-each>
																										</fo:block>
																									</fo:table-cell>
																								</fo:table-row>
																							</fo:table-body>
																						</fo:table>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline-container>
																							<fo:block>
																								<xsl:text>&#x2029;</xsl:text>
																							</fo:block>
																						</fo:inline-container>
																						<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																							<fo:table-column column-width="proportional-column-width(1)"/>
																							<fo:table-body start-indent="0pt">
																								<fo:table-row>
																									<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																										<fo:block>
																											<fo:inline>
																												<xsl:text>&#160;</xsl:text>
																											</fo:inline>
																											<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																												<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																													<xsl:for-each select="PHS_Fellowship_Supplemental:GraduateDegreeEarned">
																														<xsl:for-each select="PHS_Fellowship_Supplemental:OtherDegreeTypeText">
																															<xsl:variable name="value-of-template">
																																<xsl:apply-templates/>
																															</xsl:variable>
																															<xsl:choose>
																																<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																																	<fo:block>
																																		<xsl:copy-of select="$value-of-template"/>
																																	</fo:block>
																																</xsl:when>
																																<xsl:otherwise>
																																	<fo:inline>
																																		<xsl:copy-of select="$value-of-template"/>
																																	</fo:inline>
																																</xsl:otherwise>
																															</xsl:choose>
																														</xsl:for-each>
																													</xsl:for-each>
																												</xsl:for-each>
																											</xsl:for-each>
																										</fo:block>
																									</fo:table-cell>
																								</fo:table-row>
																							</fo:table-body>
																						</fo:table>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline-container>
																							<fo:block>
																								<xsl:text>&#x2029;</xsl:text>
																							</fo:block>
																						</fo:inline-container>
																						<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																							<fo:table-column column-width="proportional-column-width(1)"/>
																							<fo:table-body start-indent="0pt">
																								<fo:table-row>
																									<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																										<fo:block>
																											<fo:inline>
																												<xsl:text>&#160;</xsl:text>
																											</fo:inline>
																											<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																												<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																													<xsl:for-each select="PHS_Fellowship_Supplemental:GraduateDegreeEarned">
																														<xsl:for-each select="PHS_Fellowship_Supplemental:DegreeDate">
																															<xsl:variable name="value-of-template">
																																<xsl:apply-templates/>
																															</xsl:variable>
																															<xsl:choose>
																																<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																																	<fo:block>
																																		<xsl:copy-of select="$value-of-template"/>
																																	</fo:block>
																																</xsl:when>
																																<xsl:otherwise>
																																	<fo:inline>
																																		<xsl:copy-of select="$value-of-template"/>
																																	</fo:inline>
																																</xsl:otherwise>
																															</xsl:choose>
																														</xsl:for-each>
																													</xsl:for-each>
																												</xsl:for-each>
																											</xsl:for-each>
																										</fo:block>
																									</fo:table-cell>
																								</fo:table-row>
																							</fo:table-body>
																						</fo:table>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="after">
																<fo:block>
																	<fo:inline>
																		<xsl:text>4. Degree Sought During Proposed Award:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border-spacing="2pt">
																		<fo:table-column column-width="50%"/>
																		<fo:table-column column-width="30%"/>
																		<fo:table-column column-width="20%"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell padding="2pt" display-align="after">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>Degree:</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="after">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>If &quot;other&quot;, please</xsl:text>
																						</fo:inline>
																						<fo:block/>
																						<fo:inline>
																							<xsl:text>indicate degree type:</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="after">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>Expected Completion Date (month/year):</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline-container>
																							<fo:block>
																								<xsl:text>&#x2029;</xsl:text>
																							</fo:block>
																						</fo:inline-container>
																						<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																							<fo:table-column column-width="proportional-column-width(1)"/>
																							<fo:table-body start-indent="0pt">
																								<fo:table-row>
																									<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																										<fo:block>
																											<fo:inline>
																												<xsl:text>&#160;</xsl:text>
																											</fo:inline>
																											<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																												<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																													<xsl:for-each select="PHS_Fellowship_Supplemental:GraduateDegreeSought">
																														<xsl:for-each select="PHS_Fellowship_Supplemental:DegreeType">
																															<xsl:variable name="value-of-template">
																																<xsl:apply-templates/>
																															</xsl:variable>
																															<xsl:choose>
																																<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																																	<fo:block>
																																		<xsl:copy-of select="$value-of-template"/>
																																	</fo:block>
																																</xsl:when>
																																<xsl:otherwise>
																																	<fo:inline>
																																		<xsl:copy-of select="$value-of-template"/>
																																	</fo:inline>
																																</xsl:otherwise>
																															</xsl:choose>
																														</xsl:for-each>
																													</xsl:for-each>
																												</xsl:for-each>
																											</xsl:for-each>
																										</fo:block>
																									</fo:table-cell>
																								</fo:table-row>
																							</fo:table-body>
																						</fo:table>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline-container>
																							<fo:block>
																								<xsl:text>&#x2029;</xsl:text>
																							</fo:block>
																						</fo:inline-container>
																						<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																							<fo:table-column column-width="proportional-column-width(1)"/>
																							<fo:table-body start-indent="0pt">
																								<fo:table-row>
																									<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																										<fo:block>
																											<fo:inline>
																												<xsl:text>&#160;</xsl:text>
																											</fo:inline>
																											<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																												<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																													<xsl:for-each select="PHS_Fellowship_Supplemental:GraduateDegreeSought">
																														<xsl:for-each select="PHS_Fellowship_Supplemental:OtherDegreeTypeText">
																															<xsl:variable name="value-of-template">
																																<xsl:apply-templates/>
																															</xsl:variable>
																															<xsl:choose>
																																<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																																	<fo:block>
																																		<xsl:copy-of select="$value-of-template"/>
																																	</fo:block>
																																</xsl:when>
																																<xsl:otherwise>
																																	<fo:inline>
																																		<xsl:copy-of select="$value-of-template"/>
																																	</fo:inline>
																																</xsl:otherwise>
																															</xsl:choose>
																														</xsl:for-each>
																													</xsl:for-each>
																												</xsl:for-each>
																											</xsl:for-each>
																										</fo:block>
																									</fo:table-cell>
																								</fo:table-row>
																							</fo:table-body>
																						</fo:table>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline-container>
																							<fo:block>
																								<xsl:text>&#x2029;</xsl:text>
																							</fo:block>
																						</fo:inline-container>
																						<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																							<fo:table-column column-width="proportional-column-width(1)"/>
																							<fo:table-body start-indent="0pt">
																								<fo:table-row>
																									<fo:table-cell border="solid 1pt gray" padding="2pt" height="18" display-align="center">
																										<fo:block>
																											<fo:inline>
																												<xsl:text>&#160;</xsl:text>
																											</fo:inline>
																											<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																												<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																													<xsl:for-each select="PHS_Fellowship_Supplemental:GraduateDegreeSought">
																														<xsl:for-each select="PHS_Fellowship_Supplemental:DegreeDate">
																															<xsl:variable name="value-of-template">
																																<xsl:apply-templates/>
																															</xsl:variable>
																															<xsl:choose>
																																<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																																	<fo:block>
																																		<xsl:copy-of select="$value-of-template"/>
																																	</fo:block>
																																</xsl:when>
																																<xsl:otherwise>
																																	<fo:inline>
																																		<xsl:copy-of select="$value-of-template"/>
																																	</fo:inline>
																																</xsl:otherwise>
																															</xsl:choose>
																														</xsl:for-each>
																													</xsl:for-each>
																												</xsl:for-each>
																											</xsl:for-each>
																										</fo:block>
																									</fo:table-cell>
																								</fo:table-row>
																							</fo:table-body>
																						</fo:table>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>5. * Field of Training for Current Proposal:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:FieldOfTraining">
																									<xsl:variable name="value-of-template">
																										<xsl:apply-templates/>
																									</xsl:variable>
																									<xsl:choose>
																										<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																											<fo:block>
																												<xsl:copy-of select="$value-of-template"/>
																											</fo:block>
																										</xsl:when>
																										<xsl:otherwise>
																											<fo:inline>
																												<xsl:copy-of select="$value-of-template"/>
																											</fo:inline>
																										</xsl:otherwise>
																									</xsl:choose>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>6. * Current Or Prior Kirschstein-NRSA Support?&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupportIndicator">
																				<xsl:choose>
																					<xsl:when test="string(.)='Y: Yes'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> Yes&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																				</fo:inline>
																				<xsl:choose>
																					<xsl:when test="string(.)='N: No'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> No</xsl:text>
																				</fo:inline>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;&#160;&#160; If yes, please identify current and prior Kirschstein-NRSA support below:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding-left="12pt" number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="18%"/>
																		<fo:table-column column-width="20%"/>
																		<fo:table-column column-width="18%"/>
																		<fo:table-column column-width="18%"/>
																		<fo:table-column column-width="26%"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>* Level</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>* Type</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>Start Date (if known)</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>End Date (if known)</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>Grant Number (if known)</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() = 1">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:Level">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =1">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:Type">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =1">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:StartDate">
																											<fo:inline>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 6, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 9, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(string(.))), 1, 4)), '0000')"/>
																											</fo:inline>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =1">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:EndDate">
																											<fo:inline>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 6, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 9, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(string(.))), 1, 4)), '0000')"/>
																											</fo:inline>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =1">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:GrantNumber">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() = 2">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:Level">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =2">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:Type">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =2">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:StartDate">
																											<fo:inline>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 6, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 9, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(string(.))), 1, 4)), '0000')"/>
																											</fo:inline>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =2">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:EndDate">
																											<fo:inline>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 6, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 9, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(string(.))), 1, 4)), '0000')"/>
																											</fo:inline>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =2">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:GrantNumber">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() = 3">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:Level">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =3">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:Type">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =3">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:StartDate">
																											<fo:inline>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 6, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 9, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(string(.))), 1, 4)), '0000')"/>
																											</fo:inline>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =3">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:EndDate">
																											<fo:inline>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 6, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 9, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(string(.))), 1, 4)), '0000')"/>
																											</fo:inline>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =3">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:GrantNumber">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() = 4">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:Level">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =4">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:Type">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =4">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:StartDate">
																											<fo:inline>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 6, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 9, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(string(.))), 1, 4)), '0000')"/>
																											</fo:inline>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =4">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:EndDate">
																											<fo:inline>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 6, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(.)), 9, 2)), '00')"/>
																												<xsl:text>/</xsl:text>
																												<xsl:value-of select="format-number(number(substring(string(string(string(.))), 1, 4)), '0000')"/>
																											</fo:inline>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:CurrentPriorNRSASupport">
																									<xsl:if test="position() =4">
																										<xsl:for-each select="PHS_Fellowship_Supplemental:GrantNumber">
																											<xsl:variable name="value-of-template">
																												<xsl:apply-templates/>
																											</xsl:variable>
																											<xsl:choose>
																												<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																													<fo:block>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:block>
																												</xsl:when>
																												<xsl:otherwise>
																													<fo:inline>
																														<xsl:copy-of select="$value-of-template"/>
																													</fo:inline>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:for-each>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>7. * Applications for Concurrent Support?&#160;&#160; </xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;</xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:ConcurrentSupport">
																				<xsl:choose>
																					<xsl:when test="string(.)='Y: Yes'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> Yes&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																				</fo:inline>
																				<xsl:choose>
																					<xsl:when test="string(.)='N: No'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																				<fo:inline>
																					<xsl:text> No</xsl:text>
																				</fo:inline>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;&#160; If yes, please describe in an attached file:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;</xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:ConcurrentSupportDescription">
																				<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																					<xsl:for-each select="att:FileName">
																						<xsl:variable name="value-of-template">
																							<xsl:apply-templates/>
																						</xsl:variable>
																						<xsl:choose>
																							<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																								<fo:block>
																									<xsl:copy-of select="$value-of-template"/>
																								</fo:block>
																							</xsl:when>
																							<xsl:otherwise>
																								<fo:inline>
																									<xsl:copy-of select="$value-of-template"/>
																								</fo:inline>
																							</xsl:otherwise>
																						</xsl:choose>
																					</xsl:for-each>
																				</xsl:for-each>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>8. * Goals for Fellowship Training and Career</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;</xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:FellowshipTrainingAndCareerGoals">
																				<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																					<xsl:for-each select="att:FileName">
																						<xsl:variable name="value-of-template">
																							<xsl:apply-templates/>
																						</xsl:variable>
																						<xsl:choose>
																							<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																								<fo:block>
																									<xsl:copy-of select="$value-of-template"/>
																								</fo:block>
																							</xsl:when>
																							<xsl:otherwise>
																								<fo:inline>
																									<xsl:copy-of select="$value-of-template"/>
																								</fo:inline>
																							</xsl:otherwise>
																						</xsl:choose>
																					</xsl:for-each>
																				</xsl:for-each>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>9. * Activities Planned Under This Award</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;</xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:ActivitiesPlannedUnderThisAward">
																				<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																					<xsl:for-each select="att:FileName">
																						<xsl:variable name="value-of-template">
																							<xsl:apply-templates/>
																						</xsl:variable>
																						<xsl:choose>
																							<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																								<fo:block>
																									<xsl:copy-of select="$value-of-template"/>
																								</fo:block>
																							</xsl:when>
																							<xsl:otherwise>
																								<fo:inline>
																									<xsl:copy-of select="$value-of-template"/>
																								</fo:inline>
																							</xsl:otherwise>
																						</xsl:choose>
																					</xsl:for-each>
																				</xsl:for-each>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>10. Doctoral Dissertation and Other Research</xsl:text>
																	</fo:inline>
																	<fo:block/>
																	<fo:inline>
																		<xsl:text>Experience</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;</xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:DissertationAndResearchExperience">
																				<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																					<xsl:for-each select="att:FileName">
																						<xsl:variable name="value-of-template">
																							<xsl:apply-templates/>
																						</xsl:variable>
																						<xsl:choose>
																							<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																								<fo:block>
																									<xsl:copy-of select="$value-of-template"/>
																								</fo:block>
																							</xsl:when>
																							<xsl:otherwise>
																								<fo:inline>
																									<xsl:copy-of select="$value-of-template"/>
																								</fo:inline>
																							</xsl:otherwise>
																						</xsl:choose>
																					</xsl:for-each>
																				</xsl:for-each>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="after">
																<fo:block>
																	<fo:inline>
																		<xsl:text>11. * Citizenship:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block/>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="before">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="65%"/>
																		<fo:table-column column-width="35%"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell font-size="9pt" border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:Citizenship">
																									<xsl:choose>
																										<xsl:when test="string(.)='U.S. Citizen or noncitizen national'">
																											<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																												<xsl:text>&#x2714;</xsl:text>
																											</fo:inline>
																										</xsl:when>
																										<xsl:otherwise>
																											<fo:inline border="solid 1pt black">
																												<fo:leader leader-length="10pt" leader-pattern="space"/>
																											</fo:inline>
																										</xsl:otherwise>
																									</xsl:choose>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																						<fo:inline>
																							<xsl:text> U.S. Citizen or noncitizen national</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell font-size="9pt" border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:Citizenship">
																									<xsl:choose>
																										<xsl:when test="string(.)='Permanent Resident of U.S. Pending'">
																											<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																												<xsl:text>&#x2714;</xsl:text>
																											</fo:inline>
																										</xsl:when>
																										<xsl:otherwise>
																											<fo:inline border="solid 1pt black">
																												<fo:leader leader-length="10pt" leader-pattern="space"/>
																											</fo:inline>
																										</xsl:otherwise>
																									</xsl:choose>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																						<fo:inline>
																							<xsl:text> Permanent Resident of U.S. Pending</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell font-size="9pt" border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:Citizenship">
																									<xsl:choose>
																										<xsl:when test="string(.)='Permanent Resident of U.S.'">
																											<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																												<xsl:text>&#x2714;</xsl:text>
																											</fo:inline>
																										</xsl:when>
																										<xsl:otherwise>
																											<fo:inline border="solid 1pt black">
																												<fo:leader leader-length="10pt" leader-pattern="space"/>
																											</fo:inline>
																										</xsl:otherwise>
																									</xsl:choose>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																						<fo:inline>
																							<xsl:text> Permanent Resident of U.S.</xsl:text>
																						</fo:inline>
																						<fo:block/>
																						<fo:inline>
																							<xsl:text>&#160;&#160;&#160; </xsl:text>
																						</fo:inline>
																						<fo:inline font-size="7pt">
																							<xsl:text>(If a permanent resident of the U.S., a notarized statement must be provided by the time of award)</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell font-size="9pt" border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:Citizenship">
																									<xsl:choose>
																										<xsl:when test="string(.)='Non-U.S. Citizen with temporary visa'">
																											<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																												<xsl:text>&#x2714;</xsl:text>
																											</fo:inline>
																										</xsl:when>
																										<xsl:otherwise>
																											<fo:inline border="solid 1pt black">
																												<fo:leader leader-length="10pt" leader-pattern="space"/>
																											</fo:inline>
																										</xsl:otherwise>
																									</xsl:choose>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<fo:inline font-size="9pt">
																							<xsl:text>Non-U.S. Citizen with temporary U.S. visa</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="after">
																<fo:block>
																	<fo:inline text-decoration="underline">
																		<xsl:text>Institution</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block/>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-rows-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>12.&#160; </xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:ChangeOfInstitution">
																				<xsl:choose>
																					<xsl:when test="string(.)='Y: Yes'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																	<fo:inline>
																		<xsl:text> Change of Sponsoring Institution</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="after">
																<fo:block>
																	<fo:inline>
																		<xsl:text>* Name of Former Institution:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:FormerInstitution">
																									<xsl:variable name="value-of-template">
																										<xsl:apply-templates/>
																									</xsl:variable>
																									<xsl:choose>
																										<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																											<fo:block>
																												<xsl:copy-of select="$value-of-template"/>
																											</fo:block>
																										</xsl:when>
																										<xsl:otherwise>
																											<fo:inline>
																												<xsl:copy-of select="$value-of-template"/>
																											</fo:inline>
																										</xsl:otherwise>
																									</xsl:choose>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>13. Assurances/Certification:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block/>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding-left="20pt" number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>In agreeing to the assurances/certification section 18 on the SF424 (R&amp;R) form, the authorized representative agrees to comply with the policies, assurances and/or certifications listed in the agency&apos;s application guide, when applicable. Descriptions of individual assurances/certifications are provided at: http://grants.nih.gov/grants/funding/424.</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline text-decoration="underline">
																							<xsl:text>If unable to certify compliance,</xsl:text>
																						</fo:inline>
																						<fo:inline>
																							<xsl:text> where applicable, provide an explanation and attach below.</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell padding-left="10pt" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline-container>
																							<fo:block>
																								<xsl:text>&#x2029;</xsl:text>
																							</fo:block>
																						</fo:inline-container>
																						<fo:table table-layout="fixed" width="100%" border-spacing="2pt">
																							<fo:table-column column-width="20%"/>
																							<fo:table-column column-width="80%"/>
																							<fo:table-body start-indent="0pt">
																								<fo:table-row>
																									<fo:table-cell padding="2pt" display-align="center">
																										<fo:block>
																											<fo:inline>
																												<xsl:text>Explanation:</xsl:text>
																											</fo:inline>
																										</fo:block>
																									</fo:table-cell>
																									<fo:table-cell padding="2pt" display-align="center">
																										<fo:block>
																											<fo:inline-container>
																												<fo:block>
																													<xsl:text>&#x2029;</xsl:text>
																												</fo:block>
																											</fo:inline-container>
																											<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																												<fo:table-column column-width="proportional-column-width(1)"/>
																												<fo:table-body start-indent="0pt">
																													<fo:table-row>
																														<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																															<fo:block>
																																<fo:inline>
																																	<xsl:text>&#160;</xsl:text>
																																</fo:inline>
																																<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																																	<xsl:for-each select="PHS_Fellowship_Supplemental:AdditionalInformation">
																																		<xsl:for-each select="PHS_Fellowship_Supplemental:AssurancesCertificationExplanation">
																																			<xsl:for-each select="PHS_Fellowship_Supplemental:attFile">
																																				<xsl:for-each select="att:FileName">
																																					<xsl:variable name="value-of-template">
																																						<xsl:apply-templates/>
																																					</xsl:variable>
																																					<xsl:choose>
																																						<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																																							<fo:block>
																																								<xsl:copy-of select="$value-of-template"/>
																																							</fo:block>
																																						</xsl:when>
																																						<xsl:otherwise>
																																							<fo:inline>
																																								<xsl:copy-of select="$value-of-template"/>
																																							</fo:inline>
																																						</xsl:otherwise>
																																					</xsl:choose>
																																				</xsl:for-each>
																																			</xsl:for-each>
																																		</xsl:for-each>
																																	</xsl:for-each>
																																</xsl:for-each>
																															</fo:block>
																														</fo:table-cell>
																													</fo:table-row>
																												</fo:table-body>
																											</fo:table>
																										</fo:block>
																									</fo:table-cell>
																								</fo:table-row>
																							</fo:table-body>
																						</fo:table>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
											<fo:block>
												<fo:inline-container>
													<fo:block>
														<xsl:text>&#x2029;</xsl:text>
													</fo:block>
												</fo:inline-container>
												<fo:table table-layout="fixed" width="100%" border-spacing="2pt">
													<fo:table-column column-width="40%"/>
													<fo:table-column column-width="60%"/>
													<fo:table-body start-indent="0pt">
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline font-weight="bold">
																		<xsl:text>D. Budget</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline text-decoration="underline">
																		<xsl:text>Senior Fellowship Applicants Only:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>1. Present Institutional Base Salary:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table border="0" table-layout="fixed" width="100%" border-spacing="2pt">
																		<fo:table-column column-width="45%"/>
																		<fo:table-column column-width="30%"/>
																		<fo:table-column column-width="25%"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="0" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline font-family="Verdana" font-size="7pt">
																							<xsl:text>Amount</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="0" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline font-family="Verdana" font-size="7pt">
																							<xsl:text>Academic Period</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="0" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline font-family="Verdana" font-size="7pt">
																							<xsl:text>Number of Months</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:InstitutionalBaseSalary">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:Amount">
																										<fo:inline>
																											<xsl:text>$</xsl:text>
																										</fo:inline>
																										<fo:inline>
																											<xsl:value-of select="format-number(number(string(.)), '#,###,###,##0.00')"/>
																										</fo:inline>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:InstitutionalBaseSalary">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:AcademicPeriod">
																										<xsl:variable name="value-of-template">
																											<xsl:apply-templates/>
																										</xsl:variable>
																										<xsl:choose>
																											<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																												<fo:block>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:block>
																											</xsl:when>
																											<xsl:otherwise>
																												<fo:inline>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:inline>
																											</xsl:otherwise>
																										</xsl:choose>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:InstitutionalBaseSalary">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:NumberOfMonths">
																										<xsl:variable name="value-of-template">
																											<xsl:apply-templates/>
																										</xsl:variable>
																										<xsl:choose>
																											<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																												<fo:block>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:block>
																											</xsl:when>
																											<xsl:otherwise>
																												<fo:inline>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:inline>
																											</xsl:otherwise>
																										</xsl:choose>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="after">
																<fo:block>
																	<fo:inline>
																		<xsl:text>2. Stipends/Salary During First Year of Proposed Fellowship:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;&#160; a. Federal Stipend Requested:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table border="0" table-layout="fixed" width="100%" border-spacing="2pt">
																		<fo:table-column column-width="45%"/>
																		<fo:table-column column-width="30%"/>
																		<fo:table-column column-width="25%"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="0" padding="2pt" height="19" display-align="after">
																					<fo:block>
																						<fo:inline font-family="Verdana" font-size="7pt">
																							<xsl:text>Amount</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="0" padding="2pt" height="19" display-align="after">
																					<fo:block>
																						<fo:inline font-family="Verdana" font-size="7pt">
																							<xsl:text>Number of Months</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="0" border-right-style="none" padding="2pt" height="19" display-align="center">
																					<fo:block/>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:FederalStipendRequested">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:Amount">
																										<fo:inline>
																											<xsl:text>$</xsl:text>
																										</fo:inline>
																										<fo:inline>
																											<xsl:value-of select="format-number(number(string(.)), '#,###,###,##0.00')"/>
																										</fo:inline>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:FederalStipendRequested">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:NumberOfMonths">
																										<xsl:variable name="value-of-template">
																											<xsl:apply-templates/>
																										</xsl:variable>
																										<xsl:choose>
																											<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																												<fo:block>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:block>
																											</xsl:when>
																											<xsl:otherwise>
																												<fo:inline>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:inline>
																											</xsl:otherwise>
																										</xsl:choose>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="0" padding="2pt" display-align="center">
																					<fo:block/>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;&#160; b. Supplementation from other sources:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table border="0" table-layout="fixed" width="100%" border-spacing="2pt">
																		<fo:table-column column-width="45%"/>
																		<fo:table-column column-width="30%"/>
																		<fo:table-column column-width="25%"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="0" font-family="Verdana" font-size="7pt" padding="2pt" display-align="after">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>Amount</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="0" font-family="Verdana" font-size="7pt" padding="2pt" display-align="after">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>Number of Months</xsl:text>
																						</fo:inline>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="0" padding="2pt" display-align="center">
																					<fo:block/>
																				</fo:table-cell>
																			</fo:table-row>
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:SupplementationFromOtherSources">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:Amount">
																										<fo:inline>
																											<xsl:text>$</xsl:text>
																										</fo:inline>
																										<fo:inline>
																											<xsl:value-of select="format-number(number(string(.)), '#,###,###,##0.00')"/>
																										</fo:inline>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:SupplementationFromOtherSources">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:NumberOfMonths">
																										<xsl:variable name="value-of-template">
																											<xsl:apply-templates/>
																										</xsl:variable>
																										<xsl:choose>
																											<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																												<fo:block>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:block>
																											</xsl:when>
																											<xsl:otherwise>
																												<fo:inline>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:inline>
																											</xsl:otherwise>
																										</xsl:choose>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																				<fo:table-cell border="0" padding="2pt" display-align="center">
																					<fo:block/>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block/>
															</fo:table-cell>
															<fo:table-cell font-family="Verdana" font-size="7pt" padding="2pt" display-align="after">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;</xsl:text>
																	</fo:inline>
																	<fo:block/>
																	<fo:inline>
																		<xsl:text>Type (sabbatical leave, salary, etc.)</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block/>
															</fo:table-cell>
															<fo:table-cell padding-right="25%" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:SupplementationFromOtherSources">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:Type">
																										<xsl:variable name="value-of-template">
																											<xsl:apply-templates/>
																										</xsl:variable>
																										<xsl:choose>
																											<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																												<fo:block>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:block>
																											</xsl:when>
																											<xsl:otherwise>
																												<fo:inline>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:inline>
																											</xsl:otherwise>
																										</xsl:choose>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block/>
															</fo:table-cell>
															<fo:table-cell font-family="Verdana" font-size="7pt" padding="2pt" display-align="after">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Source</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block/>
															</fo:table-cell>
															<fo:table-cell padding-right="10%" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:SupplementationFromOtherSources">
																									<xsl:for-each select="PHS_Fellowship_Supplemental:Source">
																										<xsl:variable name="value-of-template">
																											<xsl:apply-templates/>
																										</xsl:variable>
																										<xsl:choose>
																											<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																												<fo:block>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:block>
																											</xsl:when>
																											<xsl:otherwise>
																												<fo:inline>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:inline>
																											</xsl:otherwise>
																										</xsl:choose>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline text-decoration="underline">
																		<xsl:text>All Fellowship Applicants:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block/>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>3. * Tuition and Fees:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block/>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>&#160;</xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:TuitionAndFeesRequested">
																				<xsl:choose>
																					<xsl:when test="string(.)='N: No'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																	<fo:inline>
																		<xsl:text> None Requested&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																	</fo:inline>
																	<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																		<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																			<xsl:for-each select="PHS_Fellowship_Supplemental:TuitionAndFeesRequested">
																				<xsl:choose>
																					<xsl:when test="string(.)='Y: Yes'">
																						<fo:inline border="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
																							<xsl:text>&#x2714;</xsl:text>
																						</fo:inline>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline border="solid 1pt black">
																							<fo:leader leader-length="10pt" leader-pattern="space"/>
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:for-each>
																		</xsl:for-each>
																	</xsl:for-each>
																	<fo:inline>
																		<xsl:text> Funds Requested:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block/>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell font-size="7pt" padding-left="130pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Year 1</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding-right="100pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:TuitionRequestedYear1">
																									<fo:inline>
																										<xsl:text>$</xsl:text>
																									</fo:inline>
																									<fo:inline>
																										<xsl:value-of select="format-number(number(string(.)), '#,###,###,##0.00')"/>
																									</fo:inline>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell font-size="7pt" padding-left="130pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Year 2</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding-right="100pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:TuitionRequestedYear2">
																									<fo:inline>
																										<xsl:text>$</xsl:text>
																									</fo:inline>
																									<fo:inline>
																										<xsl:value-of select="format-number(number(string(.)), '#,###,###,##0.00')"/>
																									</fo:inline>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell font-size="7pt" padding-left="130pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Year 3</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding-right="100pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:TuitionRequestedYear3">
																									<fo:inline>
																										<xsl:text>$</xsl:text>
																									</fo:inline>
																									<fo:inline>
																										<xsl:value-of select="format-number(number(string(.)), '#,###,###,##0.00')"/>
																									</fo:inline>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell font-size="7pt" padding-left="130pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Year 4</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding-right="100pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:TuitionRequestedYear4">
																									<fo:inline>
																										<xsl:text>$</xsl:text>
																									</fo:inline>
																									<fo:inline>
																										<xsl:value-of select="format-number(number(string(.)), '#,###,###,##0.00')"/>
																									</fo:inline>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell font-size="7pt" padding-left="130pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Year 5</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding-right="100pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:TuitionRequestedYear5">
																									<fo:inline>
																										<xsl:text>$</xsl:text>
																									</fo:inline>
																									<fo:inline>
																										<xsl:value-of select="format-number(number(string(.)), '#,###,###,##0.00')"/>
																									</fo:inline>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell font-size="7pt" padding-left="130pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Year 6 (when applicable)</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding-right="100pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:TuitionRequestedYear6">
																									<fo:inline>
																										<xsl:text>$</xsl:text>
																									</fo:inline>
																									<fo:inline>
																										<xsl:value-of select="format-number(number(string(.)), '#,###,###,##0.00')"/>
																									</fo:inline>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell font-size="7pt" padding-left="130pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline font-weight="bold">
																		<xsl:text>Total Funds Requested:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding-right="100pt" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Budget">
																								<xsl:for-each select="PHS_Fellowship_Supplemental:TuitionRequestedTotal">
																									<fo:inline>
																										<xsl:text>$</xsl:text>
																									</fo:inline>
																									<fo:inline>
																										<xsl:value-of select="format-number(number(string(.)), '#,###,###,##0.00')"/>
																									</fo:inline>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
											<fo:block>
												<fo:inline-container>
													<fo:block>
														<xsl:text>&#x2029;</xsl:text>
													</fo:block>
												</fo:inline-container>
												<fo:table table-layout="fixed" width="100%" border-spacing="2pt">
													<fo:table-column column-width="40%"/>
													<fo:table-column column-width="60%"/>
													<fo:table-body start-indent="0pt">
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline font-weight="bold">
																		<xsl:text>E. Appendix</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
																		<fo:table-column column-width="proportional-column-width(1)"/>
																		<fo:table-body start-indent="0pt">
																			<fo:table-row>
																				<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
																					<fo:block>
																						<fo:inline>
																							<xsl:text>&#160;</xsl:text>
																						</fo:inline>
																						<xsl:for-each select="PHS_Fellowship_Supplemental:PHS_Fellowship_Supplemental">
																							<xsl:for-each select="PHS_Fellowship_Supplemental:Appendix">
																								<xsl:for-each select="att:AttachedFile">
																									<xsl:for-each select="att:FileName">
																										<xsl:variable name="value-of-template">
																											<xsl:apply-templates/>
																										</xsl:variable>
																										<xsl:choose>
																											<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																												<fo:block>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:block>
																											</xsl:when>
																											<xsl:otherwise>
																												<fo:inline>
																													<xsl:copy-of select="$value-of-template"/>
																												</fo:inline>
																											</xsl:otherwise>
																										</xsl:choose>
																									</xsl:for-each>
																								</xsl:for-each>
																							</xsl:for-each>
																						</xsl:for-each>
																					</fo:block>
																				</fo:table-cell>
																			</fo:table-row>
																		</fo:table-body>
																	</fo:table>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="2" padding="2pt" display-align="center">
																<fo:block/>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</xsl:for-each>
					</fo:block>
					<fo:block id="SV_RefID_PageTotal"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template name="headerall">
		<fo:static-content flow-name="xsl-region-before">
			<fo:block>
				<fo:inline-container>
					<fo:block>
						<xsl:text>&#x2029;</xsl:text>
					</fo:block>
				</fo:inline-container>
				<fo:table font-family="Verdana" table-layout="fixed" width="100%" border-spacing="2pt">
					<fo:table-column column-width="proportional-column-width(1)"/>
					<fo:table-column column-width="proportional-column-width(1)"/>
					<fo:table-body start-indent="0pt">
						<fo:table-row height="3pt">
							<fo:table-cell height="15pt" number-columns-spanned="2" padding="2pt" display-align="center">
								<fo:block/>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell font-size="smaller" margin-top="1pt" padding="0" padding-top="0pt" number-columns-spanned="2" text-align="center" display-align="before">
								<fo:block>
									<fo:inline font-weight="bold">
										<xsl:text>PHS Fellowship Supplemental Form</xsl:text>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row font-size="7pt">
							<fo:table-cell font-size="5pt" margin-top="1pt" padding="0" padding-top="0pt" number-columns-spanned="2" text-align="right" display-align="before">
								<fo:block>
									<fo:inline>
										<xsl:text>OMB Number: 0925-0002</xsl:text>
									</fo:inline>
									<fo:block/>
									<fo:inline>
										<xsl:text>Expiration Date: 10/31/2008</xsl:text>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</fo:static-content>
	</xsl:template>
	<xsl:template name="double-backslash">
		<xsl:param name="text"/>
		<xsl:param name="text-length"/>
		<xsl:variable name="text-after-bs" select="substring-after($text, '\')"/>
		<xsl:variable name="text-after-bs-length" select="string-length($text-after-bs)"/>
		<xsl:choose>
			<xsl:when test="$text-after-bs-length = 0">
				<xsl:choose>
					<xsl:when test="substring($text, $text-length) = '\'">
						<xsl:value-of select="concat(substring($text,1,$text-length - 1), '\\')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$text"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat(substring($text,1,$text-length - $text-after-bs-length - 1), '\\')"/>
				<xsl:call-template name="double-backslash">
					<xsl:with-param name="text" select="$text-after-bs"/>
					<xsl:with-param name="text-length" select="$text-after-bs-length"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
