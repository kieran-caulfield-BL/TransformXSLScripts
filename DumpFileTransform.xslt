<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sol="urn:sol:data"> 
<xsl:output method="html" indent="yes" media-type="text/html" />
	
<!-- K Caulfield - July 2019 -->
<!-- XSL to transform standard xml output from Solcase dumpfile -->

<xsl:variable name="codeStyle"><xsl:text>language-visual-basic</xsl:text></xsl:variable>

<xsl:variable name="url"></xsl:variable>

<xsl:variable name="newline"><xsl:text>
</xsl:text></xsl:variable>

<!-- Progress FieldType Code Lookup Key -->
<xsl:key name="code-lookup" match="sol:standardcode" use="sol:desc"/>

<sol:standardcodes>
	<sol:standardcode><sol:desc>BL01</sol:desc><sol:value>Recoverable Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL02</sol:desc><sol:value>VAT On Recoverable Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL03</sol:desc><sol:value>Non Recoverable Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL04</sol:desc><sol:value>VAT On Non Recoverable Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL05</sol:desc><sol:value>Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL06</sol:desc><sol:value>VAT On Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL07</sol:desc><sol:value>Disbursements + VAT</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL08</sol:desc><sol:value>Fees</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL09</sol:desc><sol:value>VAT On Fees</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL10</sol:desc><sol:value>Time Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL11</sol:desc><sol:value>Vat On Time Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL12</sol:desc><sol:value>Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL13</sol:desc><sol:value>VAT On Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL14</sol:desc><sol:value>Costs + VAT</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL15</sol:desc><sol:value>Recoverable Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL16</sol:desc><sol:value>VAT On recoverable Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL17</sol:desc><sol:value>Recoverable Costs + VAT</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL18</sol:desc><sol:value>Payments To Client From Other Party</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL19</sol:desc><sol:value>Payments To Solicitor From Other Party</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL20</sol:desc><sol:value>Payments To Court From Other Party</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL21</sol:desc><sol:value>Payments (Prepayment) From Other Party</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL22</sol:desc><sol:value>Payments Written Off</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL23</sol:desc><sol:value>Recovered</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL24</sol:desc><sol:value>Client Receipts</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL25</sol:desc><sol:value>Client Payments</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL26</sol:desc><sol:value>Office Receipts</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL27</sol:desc><sol:value>Transfer (Client)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL28</sol:desc><sol:value>Transfer (Office)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL29</sol:desc><sol:value>Balance</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL30</sol:desc><sol:value>Not currently used</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL31</sol:desc><sol:value>Uncleared Payments</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL32</sol:desc><sol:value>Anticipated Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BL33</sol:desc><sol:value>VAT On Anticipated Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL01</sol:desc><sol:value>Recoverable Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL02</sol:desc><sol:value>VAT On Recoverable Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL03</sol:desc><sol:value>Non Recoverable Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL04</sol:desc><sol:value>VAT On Non Recoverable Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL05</sol:desc><sol:value>Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL06</sol:desc><sol:value>VAT On Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL07</sol:desc><sol:value>Disbursements + VAT</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL08</sol:desc><sol:value>Fees</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL09</sol:desc><sol:value>VAT On Fees</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL10</sol:desc><sol:value>Time Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL11</sol:desc><sol:value>VAT On Time Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL12</sol:desc><sol:value>Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL13</sol:desc><sol:value>VAT On Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL14</sol:desc><sol:value>Costs + VAT</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL15</sol:desc><sol:value>Recoverable Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL16</sol:desc><sol:value>VAT On recoverable Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL17</sol:desc><sol:value>Recoverable Costs + VAT</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL18</sol:desc><sol:value>Payments To Client From Other Party</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL19</sol:desc><sol:value>Payments To Solicitor From Other Party</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL20</sol:desc><sol:value>Payments To Court From Other Party</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL21</sol:desc><sol:value>Payments (Prepayment) From Other Party</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL22</sol:desc><sol:value>Payments written off</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL23</sol:desc><sol:value>Recovered</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL24</sol:desc><sol:value>Client Receipts</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL25</sol:desc><sol:value>Client Payments</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL26</sol:desc><sol:value>Office Receipts</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL27</sol:desc><sol:value>Transfer (Client)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL28</sol:desc><sol:value>Transfer (Office)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL29</sol:desc><sol:value>Balance</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL30</sol:desc><sol:value>Not currently used</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL31</sol:desc><sol:value>Uncleared Payments</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL32</sol:desc><sol:value>Anticipated Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TL33</sol:desc><sol:value>VAT on Anticipated Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB01</sol:desc><sol:value>Recoverable Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB02</sol:desc><sol:value>VAT On Recoverable Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB03</sol:desc><sol:value>Non Recoverable Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB04</sol:desc><sol:value>Vat On Non Recoverable Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB05</sol:desc><sol:value>Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB06</sol:desc><sol:value>Vat On Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB07</sol:desc><sol:value>Disbursements + Vat</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB08</sol:desc><sol:value>Fees</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB09</sol:desc><sol:value>Vat On Fees</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB10</sol:desc><sol:value>Time Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB11</sol:desc><sol:value>Vat On Time Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB12</sol:desc><sol:value>Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB13</sol:desc><sol:value>Vat On Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB14</sol:desc><sol:value>Costs + Vat</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB15</sol:desc><sol:value>Recoverable Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB16</sol:desc><sol:value>Vat On Recoverable Costs</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB17</sol:desc><sol:value>Recoverable Costs + Vat</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB18</sol:desc><sol:value>Payments To Client From Other Party</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB19</sol:desc><sol:value>Payments To Solicitor From Other Party</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB20</sol:desc><sol:value>Payments To Court From Other Party</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB21</sol:desc><sol:value>Payments (Prepayment) From Other Party</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB22</sol:desc><sol:value>Payments Written Off</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB23</sol:desc><sol:value>Recovered</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB24</sol:desc><sol:value>Client Receipts</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB25</sol:desc><sol:value>Client Payments</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB26</sol:desc><sol:value>Office Receipts</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB27</sol:desc><sol:value>Transfer (Client)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB28</sol:desc><sol:value>Transfer (Office)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB29</sol:desc><sol:value>Balance</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB30</sol:desc><sol:value>Movement Since Last Bill (yes/blank)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB31</sol:desc><sol:value>Uncleared Payments</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB32</sol:desc><sol:value>Anticipated Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>UB33</sol:desc><sol:value>VAT on Anticipated Disbursements</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB01</sol:desc><sol:value>Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB02</sol:desc><sol:value>Address 1</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB03</sol:desc><sol:value>Address 2</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB04</sol:desc><sol:value>Address 3</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB05</sol:desc><sol:value>Address 4</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB06</sol:desc><sol:value>Postcode</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB07</sol:desc><sol:value>Type Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB08</sol:desc><sol:value>Type Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB09</sol:desc><sol:value>Telephone</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB10</sol:desc><sol:value>Fax Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB11</sol:desc><sol:value>DX Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB12</sol:desc><sol:value>DX District</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB13</sol:desc><sol:value>Added Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB14</sol:desc><sol:value>Added Case Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB15</sol:desc><sol:value>Added By</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB16</sol:desc><sol:value>Last Used Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB17</sol:desc><sol:value>Last Used by Case Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB18</sol:desc><sol:value>Last Used By</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB19</sol:desc><sol:value>Approved Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB20</sol:desc><sol:value>Approved By</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB21</sol:desc><sol:value>Address Book Notes</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB22</sol:desc><sol:value>Address Book Code (Internal)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB23</sol:desc><sol:value>Email Address</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AB99</sol:desc><sol:value>This code is used to reference user defined address book screens, e.g. [AB99 (ADG01)]</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BD01</sol:desc><sol:value>Period Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BD02</sol:desc><sol:value>Start Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BD03</sol:desc><sol:value>End Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BD04</sol:desc><sol:value>Budget Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BD05</sol:desc><sol:value>Owner Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BD06</sol:desc><sol:value>Budget Amount in minutes</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BD07</sol:desc><sol:value>Actual Amount in minutes</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BD08</sol:desc><sol:value>Budget Amount in hours and minutes</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BD09</sol:desc><sol:value>Actual Amount in hours and minutes</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BU01</sol:desc><sol:value>Bundle description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BU02</sol:desc><sol:value>Bundle template</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BU03</sol:desc><sol:value>History ID of Cover/Title Page document</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BU04</sol:desc><sol:value>Unused in SolCase</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>BU05</sol:desc><sol:value>The stage of the Document Bundle wizard to display.</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT01</sol:desc><sol:value>Description 1</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT02</sol:desc><sol:value>Description 2</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT03</sol:desc><sol:value>Description 3</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT04</sol:desc><sol:value>Date of Case Opened</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT05</sol:desc><sol:value>Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT06</sol:desc><sol:value>Case Type Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT07</sol:desc><sol:value>Case Type Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT08</sol:desc><sol:value>Milestone Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT09</sol:desc><sol:value>Milestone Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT10</sol:desc><sol:value>Milestone Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT11</sol:desc><sol:value>Case Fee Earner Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT12</sol:desc><sol:value>Number Of Months Since Opening File</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT13</sol:desc><sol:value>Time MTD</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT14</sol:desc><sol:value>No. of Other Partys</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT15</sol:desc><sol:value>Linked Case Type Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT16</sol:desc><sol:value>Linked Case Type Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT17</sol:desc><sol:value>Cost Centre Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT18</sol:desc><sol:value>Cost Centre Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT19</sol:desc><sol:value>Date of the Last Time Posting</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT20</sol:desc><sol:value>Case Escalation Fee Earner Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT21</sol:desc><sol:value>Linked Case Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT22</sol:desc><sol:value>Old Case Code (prelink to accounts)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT23</sol:desc><sol:value>Fee Scale Band Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT24</sol:desc><sol:value>Case Short Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT25</sol:desc><sol:value>Case Password</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT26</sol:desc><sol:value>Legal Aid (Yes/No)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT27</sol:desc><sol:value>Legal Aid Change Band</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT28</sol:desc><sol:value>Accounts Change Band</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT29</sol:desc><sol:value>Number of Other Party Records</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT31</sol:desc><sol:value>Scale Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT32</sol:desc><sol:value>Uplift</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>MT33</sol:desc><sol:value>Chargeable</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PD01</sol:desc><sol:value>Case Paid User Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PD02</sol:desc><sol:value>Case Paid Tape Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PD03</sol:desc><sol:value>Number of Requests on Case Paid Tape</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL01</sol:desc><sol:value>Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL02</sol:desc><sol:value>Not used</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL03</sol:desc><sol:value>Salutation (Private)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL04</sol:desc><sol:value>Addressee (Company)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL05</sol:desc><sol:value>Salutation (Company)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL06</sol:desc><sol:value>Address 1</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL07</sol:desc><sol:value>Address 2</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL08</sol:desc><sol:value>Address 3</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL09</sol:desc><sol:value>Address 4</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL10</sol:desc><sol:value>Postcode</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL11</sol:desc><sol:value>Telephone</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL12</sol:desc><sol:value>Telephone (Work - Private)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL13</sol:desc><sol:value>Fax (Company)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL14</sol:desc><sol:value>Fee Earner Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL15</sol:desc><sol:value>Fee Earner Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL16</sol:desc><sol:value>Fee Earner Reference</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL17</sol:desc><sol:value>Fee Earner Extension</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL18</sol:desc><sol:value>They/He/She</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL19</sol:desc><sol:value>I/We</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL20</sol:desc><sol:value>Type (P) rivate (B) usiness</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL21</sol:desc><sol:value>Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL22</sol:desc><sol:value>Trading As</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL23</sol:desc><sol:value>Time MTD</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL24</sol:desc><sol:value>Escalation Fee Earner Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL25</sol:desc><sol:value>Old Client Code (prelink to accounts)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL26</sol:desc><sol:value>Fee Scale Band Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL27</sol:desc><sol:value>Client Short Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL28</sol:desc><sol:value>Debt Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CL29</sol:desc><sol:value>Interest Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CO01</sol:desc><sol:value>Company Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CO02</sol:desc><sol:value>Company Address 1</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CO03</sol:desc><sol:value>Company Address 2</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CO04</sol:desc><sol:value>Company Address 3</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CO05</sol:desc><sol:value>Company Address 4</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CO06</sol:desc><sol:value>Company Postcode</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CO07</sol:desc><sol:value>Company Phone No.</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CO08</sol:desc><sol:value>Image Directory</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CO09</sol:desc><sol:value>Script Directory</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CO10</sol:desc><sol:value>Style Sheet</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CO11</sol:desc><sol:value>General Web Pages Directory</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>CO12</sol:desc><sol:value>Web Page Time Out (Hrs:Mins)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC01</sol:desc><sol:value>Total Interest (at today)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC02</sol:desc><sol:value>Interest Paid</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC03</sol:desc><sol:value>Number of Items</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC04</sol:desc><sol:value>First Arrangement Payment Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC05</sol:desc><sol:value>Next Arrangement Payment Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC06</sol:desc><sol:value>Arrangement Payment Amount</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC07</sol:desc><sol:value>Arrangement Payment Frequency</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC08</sol:desc><sol:value>Total</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC09</sol:desc><sol:value>Total Paid</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC10</sol:desc><sol:value>County Court Issue Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC11</sol:desc><sol:value>County Court Issue Amount (Balance of Debt Only)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC12</sol:desc><sol:value>County Court Interest at Issue</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC13</sol:desc><sol:value>County Court Judgment Date Requested</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC14</sol:desc><sol:value>Unused</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC15</sol:desc><sol:value>County Court Judgment balance of debt plus interest</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC16</sol:desc><sol:value>High Court Issue Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC17</sol:desc><sol:value>High Court Issue Amount (Balance of Debt Only)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC18</sol:desc><sol:value>High Court Interest at Issue</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC19</sol:desc><sol:value>High Court Judgment Date Requested</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC20</sol:desc><sol:value>Code Currently Unused</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC21</sol:desc><sol:value>High Court Judgment Amount (Balance of Debt Plus Interest)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC22</sol:desc><sol:value>Interest Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC23</sol:desc><sol:value>Interest Calculation Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC24</sol:desc><sol:value>Current Interest Per Day</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC25</sol:desc><sol:value>Current Interest Rate (%)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC26</sol:desc><sol:value>Description (Case)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC27</sol:desc><sol:value>Current Debt Balance</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC28</sol:desc><sol:value>Interest Rate Above Base</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC29</sol:desc><sol:value>Type of Contractual Interest</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC30</sol:desc><sol:value>Arrears on an Arrangement Payment</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC31</sol:desc><sol:value>Payments Made this Period on an Arrangement</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC32</sol:desc><sol:value>County Court Issue Amount (Balance of Debt plus Interest)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC33</sol:desc><sol:value>High Court Issue Amount (Balance of Debt plus Interest)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC34</sol:desc><sol:value>Interest at County Court Judgment</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC35</sol:desc><sol:value>Interest at High Court Judgment</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC36</sol:desc><sol:value>Interest Rate Period (Monthly or Annual)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC37</sol:desc><sol:value>Interest Per Month or Part Thereof (Yes/No)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC38</sol:desc><sol:value>Calculate Interest for Payment Screen (Yes/No)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DC41</sol:desc><sol:value>Interest Type Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB01</sol:desc><sol:value>Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB02</sol:desc><sol:value>Amount</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB03</sol:desc><sol:value>Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB04</sol:desc><sol:value>Reference</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB05</sol:desc><sol:value>Client Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB06</sol:desc><sol:value>Case Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB07</sol:desc><sol:value>Interest From</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB08</sol:desc><sol:value>Interest Charged (Yes/No)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB09</sol:desc><sol:value>Interest Above Base</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB10</sol:desc><sol:value>Interest Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB11</sol:desc><sol:value>Interest Calculation Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB12</sol:desc><sol:value>Amount Paid</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB13</sol:desc><sol:value>Amount Unpaid</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB14</sol:desc><sol:value>Sequence Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB15</sol:desc><sol:value>Sequence Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB16</sol:desc><sol:value>Current Interest per Day</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB70</sol:desc><sol:value>View Debt Invoice Details</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>DB99</sol:desc><sol:value>Enables individual metadata screen fields to be displayed and updated via scripting</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE01</sol:desc><sol:value>Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE02</sol:desc><sol:value>Ref</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE03</sol:desc><sol:value>Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE04</sol:desc><sol:value>Extension</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE05</sol:desc><sol:value>Time</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE06</sol:desc><sol:value>Network Login Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE07</sol:desc><sol:value>Charge Out Rate</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE08</sol:desc><sol:value>Cost Rate</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE09</sol:desc><sol:value>Escalation Fee Earner (Supervisor) Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE10</sol:desc><sol:value>Mail ID</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE11</sol:desc><sol:value>Hierarchy Level Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE12</sol:desc><sol:value>Hierarchy Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE13</sol:desc><sol:value>Legal Aid Supplier Number (Office)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE14</sol:desc><sol:value>Legal Aid Supplier Number (Fee Earner)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE15</sol:desc><sol:value>User Information for the Fee Earner</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE16</sol:desc><sol:value>Accounts Fee Earner</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>FE18</sol:desc><sol:value>Standard Hourly Rate</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS01</sol:desc><sol:value>Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS02</sol:desc><sol:value>Date Inserted</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS03</sol:desc><sol:value>Client Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS04</sol:desc><sol:value>Case Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS05</sol:desc><sol:value>Fee Earner Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS06</sol:desc><sol:value>Time Cost</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS07</sol:desc><sol:value>Charge Amount</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS08</sol:desc><sol:value>Time Used</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS09</sol:desc><sol:value>Work Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS10</sol:desc><sol:value>Work Type Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS11</sol:desc><sol:value>Fee Transaction Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS12</sol:desc><sol:value>Fee Transaction Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS13</sol:desc><sol:value>Time Item (Yes/No)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS14</sol:desc><sol:value>Notes</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS15</sol:desc><sol:value>Hours</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS16</sol:desc><sol:value>Minutes</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS17</sol:desc><sol:value>Charge Rate</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS18</sol:desc><sol:value>Bill Status</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS19</sol:desc><sol:value>Fee Earner Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS20</sol:desc><sol:value>Bill Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS21</sol:desc><sol:value>Operator</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS22</sol:desc><sol:value>History Document Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS23</sol:desc><sol:value>Bill item (Yes/No)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS24</sol:desc><sol:value>History Document File Name (the name only, not the path)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS25</sol:desc><sol:value>Transaction Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS26</sol:desc><sol:value>Document Category</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS27</sol:desc><sol:value>Extra Text</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS28</sol:desc><sol:value>Time Item LA Status</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS29</sol:desc><sol:value>Bill Number (as a numeric value)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS30</sol:desc><sol:value>CDS Time Item Values</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS31</sol:desc><sol:value>Document Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS32</sol:desc><sol:value>Items</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS33</sol:desc><sol:value>Billing Status</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS34</sol:desc><sol:value>History ID</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS38</sol:desc><sol:value>Time Inserted</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS39</sol:desc><sol:value>History Exported (Yes/No)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS43</sol:desc><sol:value>Key Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS44</sol:desc><sol:value>Important</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS70</sol:desc><sol:value>View Document</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS71</sol:desc><sol:value>Edit Document</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS72</sol:desc><sol:value>History Item</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS73</sol:desc><sol:value>Data conversion</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS74</sol:desc><sol:value>Exclude items</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HS99</sol:desc><sol:value>Enables individual metadata screen fields to be displayed and updated via scripting</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV01</sol:desc><sol:value>Action</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV02</sol:desc><sol:value>Version</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV03</sol:desc><sol:value>Created By</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV04</sol:desc><sol:value>Date Created</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV05</sol:desc><sol:value>Amended By</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV06</sol:desc><sol:value>Date Amended</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV07</sol:desc><sol:value>Category</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV08</sol:desc><sol:value>Read Only</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV09</sol:desc><sol:value>Master Version</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV10</sol:desc><sol:value>Case Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV11</sol:desc><sol:value>Document File</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV12</sol:desc><sol:value>Document Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV70</sol:desc><sol:value>View Document Version</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV71</sol:desc><sol:value>Edit Document Version</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>HV72</sol:desc><sol:value>Data conversion</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>IM01</sol:desc><sol:value>Document ID</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>IM02</sol:desc><sol:value>Document Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>IM03</sol:desc><sol:value>Creation Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>IM04</sol:desc><sol:value>Creation time</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>IM05</sol:desc><sol:value>Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>IM06</sol:desc><sol:value>User ID</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>IN01</sol:desc><sol:value>Rate (Interest Rate)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>IN02</sol:desc><sol:value>Start Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>IN03</sol:desc><sol:value>End Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>IN04</sol:desc><sol:value>Code (Interest Type Code)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>IN05</sol:desc><sol:value>Description (Interest Type Description)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>IN06</sol:desc><sol:value>Period Type (Annual/Monthly)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>JG01</sol:desc><sol:value>Judgment User Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>JG02</sol:desc><sol:value>Judgment Tape Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>JG03</sol:desc><sol:value>Number of Requests on Judgment Tape</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG01</sol:desc><sol:value>Total Amount 1</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG02</sol:desc><sol:value>Net Amount1</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG03</sol:desc><sol:value>Vat Amount1</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG04</sol:desc><sol:value>Posting Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG05</sol:desc><sol:value>Narrative</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG06</sol:desc><sol:value>Case Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG07</sol:desc><sol:value>VAT Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG08</sol:desc><sol:value>Transaction Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG09</sol:desc><sol:value>Transaction Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG10</sol:desc><sol:value>Pencilled (Yes/No)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG11</sol:desc><sol:value>Payee(r)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG12</sol:desc><sol:value>Bill Number (can be written to directly by a script)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG13</sol:desc><sol:value>Bill Status (can be written to directly by a script)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG14</sol:desc><sol:value>Linked Accounts Reference Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG15</sol:desc><sol:value>Posted in Accounts (Yes/No)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG16</sol:desc><sol:value>Item Cleared (Yes/No) - Version 98 Only</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG17</sol:desc><sol:value>Ledger Extra Narrative</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG18</sol:desc><sol:value>Ref</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG19</sol:desc><sol:value>Bill Number (as a numeric value)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG20</sol:desc><sol:value>Sequence No</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG21</sol:desc><sol:value>Billing Status</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG26</sol:desc><sol:value>Third Party Transaction No.</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG27</sol:desc><sol:value>Recoverable Disbursement (yes/no)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG28</sol:desc><sol:value>Category</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG32</sol:desc><sol:value>Office debit transaction (yes/no)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG33</sol:desc><sol:value>Office credit transaction (yes/no)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG34</sol:desc><sol:value>Client debit transaction (yes/no)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG35</sol:desc><sol:value>Client credit transaction (yes/no)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>LG99</sol:desc><sol:value>Enables individual metadata screen fields to be displayed and updated via scripting</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SH01</sol:desc><sol:value>Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SH02</sol:desc><sol:value>Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SH03</sol:desc><sol:value>Original Start Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SH04</sol:desc><sol:value>Current Start Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SH05</sol:desc><sol:value>End Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SH06</sol:desc><sol:value>Days (Total)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SH07</sol:desc><sol:value>Days (Current)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SH08</sol:desc><sol:value>Client Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SH09</sol:desc><sol:value>Case Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP01</sol:desc><sol:value>Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP02</sol:desc><sol:value>Salutation</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP03</sol:desc><sol:value>Addressee</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP04</sol:desc><sol:value>Contact 1 or Addressee</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP05</sol:desc><sol:value>Contact 2 or Addressee</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP06</sol:desc><sol:value>Address 1</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP07</sol:desc><sol:value>Address 2</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP08</sol:desc><sol:value>Address 3</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP09</sol:desc><sol:value>Address 4</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP10</sol:desc><sol:value>Postcode</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP11</sol:desc><sol:value>Telephone 1</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP12</sol:desc><sol:value>Telephone 2</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP13</sol:desc><sol:value>Fax</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP18</sol:desc><sol:value>They/He/She</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP19</sol:desc><sol:value>I/We</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP20</sol:desc><sol:value>Type (P) rivate (B) usiness</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP22</sol:desc><sol:value>Trading As</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>OP24</sol:desc><sol:value>Case Code (Internal)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC01</sol:desc><sol:value>Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC02</sol:desc><sol:value>Debt Amount</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC03</sol:desc><sol:value>Debt Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC04</sol:desc><sol:value>Debt Ref</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC05</sol:desc><sol:value>Payment Amount</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC06</sol:desc><sol:value>Balance</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC07</sol:desc><sol:value>Balance for Interest</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC08</sol:desc><sol:value>Interest Rate</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC09</sol:desc><sol:value>No. of days Interest</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC10</sol:desc><sol:value>Interest per day</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC11</sol:desc><sol:value>Interest Amount</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC12</sol:desc><sol:value>Total of Interest</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC13</sol:desc><sol:value>Item Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC14</sol:desc><sol:value>Item Amount</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PC15</sol:desc><sol:value>Item Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PY01</sol:desc><sol:value>Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PY02</sol:desc><sol:value>Amount</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PY03</sol:desc><sol:value>Reference</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PY04</sol:desc><sol:value>Client Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PY05</sol:desc><sol:value>Case Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PY06</sol:desc><sol:value>Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PY07</sol:desc><sol:value>Linked Accounts Reference Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PY08</sol:desc><sol:value>Clearance Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PY09</sol:desc><sol:value>Clearance Status</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PY10</sol:desc><sol:value>Record Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PY70</sol:desc><sol:value>View Payment Details</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>PY99</sol:desc><sol:value>Enables individual metadata screen fields to be displayed and updated via scripting</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>RC01</sol:desc><sol:value>Total Amount</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>RC02</sol:desc><sol:value>Net Amount</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>RC03</sol:desc><sol:value>VAT</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>RC04</sol:desc><sol:value>Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>RC05</sol:desc><sol:value>Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>RC06</sol:desc><sol:value>Type</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>RC07</sol:desc><sol:value>Client Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>RC08</sol:desc><sol:value>Case Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD01</sol:desc><sol:value>Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD02</sol:desc><sol:value>Date Due</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD03</sol:desc><sol:value>Date Inserted</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD04</sol:desc><sol:value>Days</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD05</sol:desc><sol:value>Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD06</sol:desc><sol:value>Client Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD07</sol:desc><sol:value>Case Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD08</sol:desc><sol:value>Priority</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD09</sol:desc><sol:value>Next Action</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD10</sol:desc><sol:value>Fee Earner Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD11</sol:desc><sol:value>Category</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD19</sol:desc><sol:value>PY Record Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>AD99</sol:desc><sol:value>Enables individual metadata screen fields to be displayed and updated via scripting</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SP01</sol:desc><sol:value>SPC User Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SP02</sol:desc><sol:value>SPC Tape Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SP03</sol:desc><sol:value>Number of Requests on SPC Tape</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SP04</sol:desc><sol:value>Total Court Fees for SPC Tape</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SP05</sol:desc><sol:value>Total Claim Amount on SPC Tape</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>SP06</sol:desc><sol:value>SPC Generated Case Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TA01</sol:desc><sol:value>Time MTD</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TA02</sol:desc><sol:value>Time YTD</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TA03</sol:desc><sol:value>Time Total</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TA04</sol:desc><sol:value>Charge MTD</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TA05</sol:desc><sol:value>Charge YTD</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TA06</sol:desc><sol:value>Charge Total</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TA07</sol:desc><sol:value>Cost MTD</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TA08</sol:desc><sol:value>Cost YTD</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TA09</sol:desc><sol:value>Cost Total</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TP01</sol:desc><sol:value>Amount</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TP02</sol:desc><sol:value>Allocated</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>TP03</sol:desc><sol:value>Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US01</sol:desc><sol:value>User Login ID</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US02</sol:desc><sol:value>User Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US03</sol:desc><sol:value>User Reference</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US04</sol:desc><sol:value>User Fee Earner: Name (Current User)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US05</sol:desc><sol:value>User Extension</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US06</sol:desc><sol:value>User Level (output as a char value)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US08</sol:desc><sol:value>User Job Title</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US09</sol:desc><sol:value>User Level</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US10</sol:desc><sol:value>Hierarchy Level Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US11</sol:desc><sol:value>Hierarchy Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US12</sol:desc><sol:value>Email Address</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US13</sol:desc><sol:value>Directory Path for Image Files</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US14</sol:desc><sol:value>Style Sheet</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US15</sol:desc><sol:value>User logged in (Yes/No)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US16</sol:desc><sol:value>User Fee Earner (Name)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US17</sol:desc><sol:value>User Template</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US18</sol:desc><sol:value>Template Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>US19</sol:desc><sol:value>Network Login ID</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>VT01</sol:desc><sol:value>Vat Rate</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>VT02</sol:desc><sol:value>Vat Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>VT03</sol:desc><sol:value>Vat Rate Description</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WT01</sol:desc><sol:value>Warrant User Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WT02</sol:desc><sol:value>Warrant Tape Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WT03</sol:desc><sol:value>Number of Requests on Warrant Tape</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WT04</sol:desc><sol:value>Default County Court Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WT05</sol:desc><sol:value>Total Court Fees for Warrant Tape</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WT06</sol:desc><sol:value>Total Claim Amount on Warrant Tape</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WT07</sol:desc><sol:value>Case Warrant Number</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WT08</sol:desc><sol:value>Last Warrant Number Used</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WL01</sol:desc><sol:value>User Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WL02</sol:desc><sol:value>Client Code</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WL03</sol:desc><sol:value>Active Login (Yes/No)</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WL04</sol:desc><sol:value>Company Name</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WL05</sol:desc><sol:value>Login Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WL06</sol:desc><sol:value>Login Time</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WL07</sol:desc><sol:value>Logout Date</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WL08</sol:desc><sol:value>Logout Time</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WL09</sol:desc><sol:value>Duration</sol:value></sol:standardcode>
	<sol:standardcode><sol:desc>WL10</sol:desc><sol:value>Sessionkey</sol:value></sol:standardcode>
</sol:standardcodes>

<!-- Anchor to lookup table in this.document -->
<xsl:variable name="standard-code" select="document('')/*/sol:standardcodes"/>

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

	<html>
		<head>
			<link rel="stylesheet" href="C:\Users\kieran.caulfield\OneDrive - Birkett Long LLP\themes\prism.css"/>
			<!--<link rel="stylesheet" href="chives-tables.css" />-->
			<style type="text/css">
			table a:link {
				color: #666;
				font-weight: bold;
				text-decoration:none;
			}
			table a:visited {
				color: #999999;
				font-weight:bold;
				text-decoration:none;
			}
			table a:active,
			table a:hover {
				color: #bd5a35;
				text-decoration:underline;
			}
			table {
				font-family:Arial, Helvetica, sans-serif;
				color:#666;
				font-size:12px;
				text-shadow: 1px 1px 0px #fff;
				background:#eaebec;
				margin:20px auto;
				border:#ccc 1px solid;
				width: 100%;
				table-layout: fixed;
			
				-moz-border-radius:3px;
				-webkit-border-radius:3px;
				border-radius:3px;
			
				-moz-box-shadow: 0 1px 2px #d1d1d1;
				-webkit-box-shadow: 0 1px 2px #d1d1d1;
				box-shadow: 0 1px 2px #d1d1d1;
			}
			.fixed {
			  table-layout: fixed;
			}
			table th {
				padding:21px 25px 22px 25px;
				border-top:1px solid #fafafa;
				border-bottom:1px solid #e0e0e0;
			
				background: #ededed;
				background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
				background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
			}
			table th:first-child {
				text-align: left;
				padding-left:20px;
			}
			table tr:first-child th:first-child {
				-moz-border-radius-topleft:3px;
				-webkit-border-top-left-radius:3px;
				border-top-left-radius:3px;
			}
			table tr:first-child th:last-child {
				-moz-border-radius-topright:3px;
				-webkit-border-top-right-radius:3px;
				border-top-right-radius:3px;
			}
			table tr {
				text-align: left;
				padding-left:20px;
				border-left: 0;
			}
			table td:first-child {
				text-align: left;
				padding-left:20px;
				border-left: 0;
			}
			table td {
				text-align: left;
				padding-left:20px;
				border-left: 0;
				
				text-overflow: ellipsis;
  				white-space: nowrap;
  				overflow: hidden;
				
				padding:18px;
				border-top: 1px solid #ffffff;
				border-bottom:1px solid #e0e0e0;
				border-left: 1px solid #e0e0e0;
			
				background: #fafafa;
				background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
				background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
				
				white-space:pre-line;
			}
			.w {
			  width: 300px;
			}
			table tr.even td {
				background: #f6f6f6;
				background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
				background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
			}
			table tr:last-child td {
				border-bottom:0;
			}
			table tr:last-child td:first-child {
				-moz-border-radius-bottomleft:3px;
				-webkit-border-bottom-left-radius:3px;
				border-bottom-left-radius:3px;
			}
			table tr:last-child td:last-child {
				-moz-border-radius-bottomright:3px;
				-webkit-border-bottom-right-radius:3px;
				border-bottom-right-radius:3px;
			}
			table tr:hover td {
				background: #f2f2f2;
				background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
				background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);	
			}			

			/*
        		=================================
        		start of Tooltip css code here
        		================================= */

        		a.info{
        		position:relative;           /*this is the key*/
        		z-index:24;
        		text-decoration:none;
        		font-style:italic;
        		}

        		a.info:hover {
        		z-index:25;
        		background-color:#ccffff;

        		}

        		a.info span{
        		display: none;  /* hide the span text using this css */
        		}

        		a.info:hover span{ /*the span will display just on :hover state*/
        		display:block;
        		position:absolute;
        		top: 1.5em;
        		left: 3em;
        		width:15em;
        		border:1px solid #9900ff; /* border colour */
        		background-color:#ffffff; /* background colour here */
        		color:#000000;         /* text colour */
        		text-align: left;
        		font-size: .8em;
        		font-style:italic;
        		z-index:30;
        		}
        		
				#menu-bar {
				  width: 95%;
				  margin: 0px 0px 0px 0px;
				  padding: 6px 6px 4px 6px;
				  height: 40px;
				  line-height: 100%;
				  border-radius: 24px;
				  -webkit-border-radius: 24px;
				  -moz-border-radius: 24px;
				  box-shadow: 2px 2px 3px #322DB5;
				  -webkit-box-shadow: 2px 2px 3px #322DB5;
				  -moz-box-shadow: 2px 2px 3px #322DB5;
				  background: #A1D968;
				  border: solid 1px #89D63C;
				  position:relative;
				  z-index:999;
				}
				#menu-bar li {
				  margin: 0px 0px 6px 0px;
				  padding: 0px 6px 0px 6px;
				  float: left;
				  position: relative;
				  list-style: none;
				}
				#menu-bar a {
				  font-weight: bold;
				  font-family: arial;
				  font-style: normal;
				  font-size: 12px;
				  color: #E7E5E5;
				  text-decoration: none;
				  display: block;
				  padding: 6px 20px 6px 20px;
				  margin: 0;
				  margin-bottom: 6px;
				  border-radius: 10px;
				  -webkit-border-radius: 10px;
				  -moz-border-radius: 10px;
				  text-shadow: 2px 2px 3px #000000;
				}
				#menu-bar li ul li a {
				  margin: 0;
				}
				#menu-bar .active a, #menu-bar li:hover > a {
				  background: #0399D4;
				  background: linear-gradient(top,  #EBEBEB,  #A1A1A1);
				  background: -ms-linear-gradient(top,  #EBEBEB,  #A1A1A1);
				  background: -webkit-gradient(linear, left top, left bottom, from(#EBEBEB), to(#A1A1A1));
				  background: -moz-linear-gradient(top,  #EBEBEB,  #A1A1A1);
				  color: #444444;
				  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
				  -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
				  box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
				  text-shadow: 2px 2px 3px #FFFFFF;
				}
				#menu-bar ul li:hover a, #menu-bar li:hover li a {
				  background: none;
				  border: none;
				  color: #666;
				  -box-shadow: none;
				  -webkit-box-shadow: none;
				  -moz-box-shadow: none;
				}
				#menu-bar ul a:hover {
				  background: #0399D4 !important;
				  background: linear-gradient(top,  #04ACEC,  #0186BA) !important;
				  background: -ms-linear-gradient(top,  #04ACEC,  #0186BA) !important;
				  background: -webkit-gradient(linear, left top, left bottom, from(#04ACEC), to(#0186BA)) !important;
				  background: -moz-linear-gradient(top,  #04ACEC,  #0186BA) !important;
				  color: #FFFFFF !important;
				  border-radius: 0;
				  -webkit-border-radius: 0;
				  -moz-border-radius: 0;
				  text-shadow: 2px 2px 3px #FFFFFF;
				}
				#menu-bar li:hover > ul {
				  display: block;
				}
				#menu-bar ul {
				  background: #DDDDDD;
				  background: linear-gradient(top,  #FFFFFF,  #CFCFCF);
				  background: -ms-linear-gradient(top,  #FFFFFF,  #CFCFCF);
				  background: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#CFCFCF));
				  background: -moz-linear-gradient(top,  #FFFFFF,  #CFCFCF);
				  display: none;
				  margin: 0;
				  padding: 0;
				  width: 185px;
				  position: absolute;
				  top: 30px;
				  left: 0;
				  border: solid 1px #B4B4B4;
				  border-radius: 10px;
				  -webkit-border-radius: 10px;
				  -moz-border-radius: 10px;
				  -webkit-box-shadow: 2px 2px 3px #222222;
				  -moz-box-shadow: 2px 2px 3px #222222;
				  box-shadow: 2px 2px 3px #222222;
				}
				#menu-bar ul li {
				  float: none;
				  margin: 0;
				  padding: 0;
				}
				#menu-bar ul a {
				  padding:10px 0px 10px 15px;
				  color:#424242 !important;
				  font-size:12px;
				  font-style:normal;
				  font-family:arial;
				  font-weight: normal;
				  text-shadow: 2px 2px 3px #FFFFFF;
				}
				#menu-bar ul li:first-child > a {
				  border-top-left-radius: 10px;
				  -webkit-border-top-left-radius: 10px;
				  -moz-border-radius-topleft: 10px;
				  border-top-right-radius: 10px;
				  -webkit-border-top-right-radius: 10px;
				  -moz-border-radius-topright: 10px;
				}
				#menu-bar ul li:last-child > a {
				  border-bottom-left-radius: 10px;
				  -webkit-border-bottom-left-radius: 10px;
				  -moz-border-radius-bottomleft: 10px;
				  border-bottom-right-radius: 10px;
				  -webkit-border-bottom-right-radius: 10px;
				  -moz-border-radius-bottomright: 10px;
				}
				#menu-bar:after {
				  content: ".";
				  display: block;
				  clear: both;
				  visibility: hidden;
				  line-height: 0;
				  height: 0;
				}
				#menu-bar {
				  display: inline-block;
				}
				  html[xmlns] #menu-bar {
				  display: block;
				}
				* html #menu-bar {
				  height: 1%;
				}
        		
			</style>	
		</head>
		<body style="font-family: Arial">
		
			<!--  MENU ITEMS -->
			<ul id="menu-bar">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#">Agendas</a>
					<ul>
						<xsl:for-each-group select="AGENDA[@AT='A']" group-by="if (exists(./NE/@PARENT_ID)) then ./NE/@PARENT_ID else 99999999">
							<xsl:sort select="current-grouping-key()" data-type="number"/>
							<xsl:for-each-group select="current-group()" group-by="if (exists(./LE/@LINKED)) then ./LE/@LINKED else -1">
								<xsl:sort select="current-grouping-key()" data-type="number"/>
								<xsl:for-each-group select="current-group()" group-by="if (exists(./SE/@POSN_ID)) then ./SE/@POSN_ID else -1">
									<xsl:sort select="current-grouping-key()" data-type="number"/>
										<li>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="concat('#',./ID/@IDENTIFIER)" />
												</xsl:attribute>
												<!-- <xsl:value-of select="concat(./TY/@TYPE,'-',./ID/@IDENTIFIER)" /> -->
												<xsl:value-of select="./DE[1]/@DESCRIPTION" />
											</a>
										</li>
								</xsl:for-each-group>
							</xsl:for-each-group>
						</xsl:for-each-group>	
					</ul>
				</li>
				<li><a href="#">Documents</a>
					<ul>
						<xsl:for-each-group select="AGENDA[@AT='D']" group-by="if (exists(./DE[1]/@DESCRIPTION)) then ./DE[1]/@DESCRIPTION else 99999999">
							<xsl:sort select="current-grouping-key()" data-type="text"/>
										<li>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="concat('#',./ID/@IDENTIFIER)" />
												</xsl:attribute>
												<!-- <xsl:value-of select="concat(./TY/@TYPE,'-',./ID/@IDENTIFIER)" /> -->
												<xsl:value-of select="./DE[1]/@DESCRIPTION" />
											</a>
										</li>
						</xsl:for-each-group>	
					</ul>
				</li>	
				<li><a href="#">Letters</a>
					<ul>
						<xsl:for-each-group select="AGENDA[@AT='L']" group-by="if (exists(./NE/@PARENT_ID)) then ./NE/@PARENT_ID else 99999999">
							<xsl:sort select="current-grouping-key()" data-type="number"/>
							<xsl:for-each-group select="current-group()" group-by="if (exists(./LE/@LINKED)) then ./LE/@LINKED else -1">
								<xsl:sort select="current-grouping-key()" data-type="number"/>
								<xsl:for-each-group select="current-group()" group-by="if (exists(./SE/@POSN_ID)) then ./SE/@POSN_ID else -1">
									<xsl:sort select="current-grouping-key()" data-type="number"/>
										<li>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="concat('#',./ID/@IDENTIFIER)" />
												</xsl:attribute>
												<!-- <xsl:value-of select="concat(./TY/@TYPE,'-',./ID/@IDENTIFIER)" /> -->
												<xsl:value-of select="./DE[1]/@DESCRIPTION" />
											</a>
										</li>
								</xsl:for-each-group>
							</xsl:for-each-group>
						</xsl:for-each-group>
					</ul>
				</li>							
				<li><a href="#">Scripts</a>
					<ul>
						<xsl:for-each-group select="AGENDA[@AT='P']" group-by="if (exists(./NE/@PARENT_ID)) then ./NE/@PARENT_ID else 99999999">
							<xsl:sort select="current-grouping-key()" data-type="number"/>
							<xsl:for-each-group select="current-group()" group-by="if (exists(./LE/@LINKED)) then ./LE/@LINKED else -1">
								<xsl:sort select="current-grouping-key()" data-type="number"/>
								<xsl:for-each-group select="current-group()" group-by="if (exists(./SE/@POSN_ID)) then ./SE/@POSN_ID else -1">
									<xsl:sort select="current-grouping-key()" data-type="number"/>
										<li>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="concat('#',./ID/@IDENTIFIER)" />
												</xsl:attribute>
												<!-- <xsl:value-of select="concat(./TY/@TYPE,'-',./ID/@IDENTIFIER)" /> -->
												<xsl:value-of select="./DE[1]/@DESCRIPTION" />
											</a>
										</li>
								</xsl:for-each-group>
							</xsl:for-each-group>
						</xsl:for-each-group>	
					</ul>
				</li>
				<li><a href="#">Script Codes</a>
					<ul>
						<xsl:for-each-group select="AGENDA[@AT='P']" group-by="if (exists(./DO/@DOCUMENT)) then ./DO/@DOCUMENT else 99999999">
							<xsl:sort select="current-grouping-key()" data-type="text"/>
										<li>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="concat('#',./DO/@DOCUMENT)" />
												</xsl:attribute>
												<!-- <xsl:value-of select="concat(./TY/@TYPE,'-',./ID/@IDENTIFIER)" /> -->
												<xsl:value-of select="./DO/@DOCUMENT" />
											</a>
										</li>
						</xsl:for-each-group>	
					</ul>
				</li>				
				<li><a href="#">Screens</a>
					<ul>
						<xsl:for-each select="SCREEN">
							<xsl:sort select="./@DS"/>
										<li>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="concat('#',./@DS)" />
												</xsl:attribute>
												<xsl:value-of select="./@SCREEN-NAME" />
											</a>
										</li>
						</xsl:for-each>	
					</ul>
				</li>
				<li><a href="#">Reports</a>
					<ul>
						<xsl:for-each select="REPORT">
							<xsl:sort select="./@DE"/>
										<li>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="concat('#',./@DE)" />
												</xsl:attribute>
												<xsl:value-of select="./@DE" />
											</a>
										</li>
						</xsl:for-each>	
					</ul>
				</li>
			</ul>
			
			
			<table class="fixed" summary="SolCase Matter">
					<col style="width: 150px;"/>
					<col/>
				<xsl:for-each select="MATTER_TYPE">
				<xsl:sort select="./@MATTER"/>
					
					<tr>
						<th>
							<xsl:value-of select="./@MATTER" />
						</th>
						<th>
							<a>
								<xsl:attribute name="id">
									<xsl:value-of select="./@MATTER" />
								</xsl:attribute>
								<xsl:value-of select="./@DS" />
							</a>
						</th>
					</tr>

					<tr>
					<td valign="top"><xsl:text>Sections</xsl:text></td>
					<td style="font-family: arial; font-size: 12px; color:#0000FF;" disable-output-escaping="yes">	
							<!-- table of Report details here -->
						<table summary="SolCase Matter Scripts">
							<col style="width: 20px;"/>
							<col/>
							<xsl:for-each select="./SS">
								<tr>
								<td valign="top"><xsl:value-of select="./@SS_NUMBER"/></td>							
								<td>
								<pre><code>
									<xsl:call-template name="replaceSolcaseChars">
										<xsl:with-param name="codeString">
											<xsl:value-of select="./text()"/>
										</xsl:with-param>
									</xsl:call-template>
								</code></pre>
								</td>	
								</tr>
							</xsl:for-each>
						</table>
					</td>
					</tr>		
						
				</xsl:for-each>
			</table>
		
			<table class="fixed" cellspacing='0' summary="SolCase Agenda">
					<col style="width: 150px;"/>
					<col/>
				<xsl:for-each-group select="AGENDA" group-by="if (exists(./NE/@PARENT_ID)) then ./NE/@PARENT_ID else 99999999">
					<xsl:sort select="current-grouping-key()" data-type="number"/>
					<xsl:for-each-group select="current-group()" group-by="if (exists(./LE/@LINKED)) then ./LE/@LINKED else -1">
						<xsl:sort select="current-grouping-key()" data-type="number"/>
						<xsl:for-each-group select="current-group()" group-by="if (exists(./SE/@POSN_ID)) then ./SE/@POSN_ID else -1">
							<xsl:sort select="current-grouping-key()" data-type="number"/>
								<tr>
									<th>
									<a class="info" href="javascript:void(0)" >
										<xsl:attribute name="name">
											<xsl:value-of select="./NE/@PARENT_ID" />
										</xsl:attribute>
										<xsl:attribute name="href">
											<xsl:value-of select="concat('#',./LE/@LINKED)" />
										</xsl:attribute>
										<xsl:attribute name="title">
											<xsl:value-of select="/SOLCASE/AGENDA[./NE/@PARENT_ID=current()/LE/@LINKED]/DE[1]/@DESCRIPTION" />
										</xsl:attribute>
										<xsl:value-of select="concat(./TY/@TYPE,'-',./ID/@IDENTIFIER)" />
									</a>
									</th>
									<th>
										<a class="info" href="javascript:void(0)">
											<xsl:attribute name="id">
												<xsl:value-of select="./ID/@IDENTIFIER" />
											</xsl:attribute>
											<xsl:value-of select="./DE[1]/@DESCRIPTION" />
										</a>
									</th>
								</tr>
								<tr>
								<td valign="top">
									<a><xsl:attribute name="id"><xsl:value-of select="./DO/@DOCUMENT" /></xsl:attribute><xsl:value-of select="./DO/@DOCUMENT" /></a>
								</td>
								<xsl:if test="./IN[@IN_NUMBER='1']">
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
								</xsl:if>
						</xsl:for-each-group>
					</xsl:for-each-group>
				</xsl:for-each-group>
			</table>	

			<table class="fixed" cellspacing='0' summary="SolCase Screen">
					<col style="width: 150px;"/>
					<col/>
				<xsl:for-each select="SCREEN">
				<xsl:sort select="./@DS"/>
					
					<tr class="even">
						<th>
						<xsl:value-of select="./@SCREEN-NAME" />
						</th>
						<th>
							<a>
								<xsl:attribute name="id">
									<xsl:value-of select="./@DS" />
								</xsl:attribute>
								<xsl:value-of select="./@DS" />
							</a>
						</th>
					</tr>

					<tr class="even">
					<td valign="top"><xsl:text>Fields</xsl:text></td>
					<td style="font-family: arial; font-size: 12px; color:#0000FF;" disable-output-escaping="yes">	
							<!-- table of fields here -->
						<table class="fixed" summary="SolCase Screen Fields">
							<xsl:for-each select="./FIELDS">
								<tr>
									<td><xsl:value-of select="./FD/@FIELD" /></td>
									<td><xsl:value-of select="./FO/@CODE" /></td>				
									<td><xsl:value-of select="./FY/@TYPE" /></td>
									<td><xsl:value-of select="./FH/@HELPER" /></td>
								</tr>
							</xsl:for-each>
						</table>
					</td>
					</tr>		
						
				</xsl:for-each>
			</table>
			
			<table class="fixed" summary="SolCase Reports">
					<col style="width: 150px;"/>
					<col/>
				<xsl:for-each select="REPORT">
				<xsl:sort select="./@DE"/>
					
					<tr>
						<th>
							<xsl:text>Report Name</xsl:text>
						</th>
						<th>
							<a>
								<xsl:attribute name="id">
									<xsl:value-of select="./@DE" />
								</xsl:attribute>
								<xsl:value-of select="./@DE" />
							</a>
						</th>
					</tr>

					<tr>
					<td valign="top"><xsl:text>Sections</xsl:text></td>
					<td style="font-family: arial; font-size: 12px; color:#0000FF;" disable-output-escaping="yes">	
							<!-- table of Report details here -->
						<table summary="SolCase Report Details">
							<col style="width: 20px;"/>
							<col/>
							<xsl:for-each select="./RE">
								<tr>
								<td valign="top"><xsl:value-of select="./@RE_NUMBER"/></td>							
								<td>
								<pre><code>
									<xsl:call-template name="replaceSolcaseChars">
										<xsl:with-param name="codeString">
											<xsl:value-of select="./text()"/>
										</xsl:with-param>
									</xsl:call-template>
								</code></pre>
								</td>	
								</tr>
							</xsl:for-each>
						</table>
					</td>
					</tr>		
						
				</xsl:for-each>
			</table>			
			
			
		<script src="C:\Users\kieran.caulfield\OneDrive - Birkett Long LLP\src\prism.js"></script>
		</body>
	</html>
	</xsl:template>
	
	<xsl:template match="sol:standardcodes">
	  <xsl:param name="sol-desc"/>
	  <xsl:value-of select="key('code-lookup', $sol-desc)/sol:value"/>
	 </xsl:template>	

</xsl:stylesheet>
