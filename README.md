# eclipse-cheatsheets-to-dita-to-pdf

I worked on https://github.com/debrief/debrief and I was given permission to extract the part of the project I worked on.

Basically this code takes a set of Eclipse cheat sheets and transforms them to PDF.

It's a two step process first the DITA XML is created from the Eclipse cheat sheets and then you use the DITA-Open Toolkit http://www.dita-ot.org/  to create the PDF from the created DITA files.

The two parts of the transformation comprise of:

1.	- Use cheatsheet-to-dita.xsl which requires an XSLT 2.0 compliant processor like Saxon 9+ HE http://saxon.sourceforge.net/ from http://www.saxonica.com/welcome/welcome.xml.
	- This file takes as input a collection on XML files (Eclipse cheat sheets) and creates multiple output files - a 	parent DITA Map and some associated tasks.
	
2.	- DITA-OT is required and that "info.debrief" plugin be placed in the DITA-OT plugins directory.
	- Set the transtype to 'debrief'
	- This plugin code takes as input the DITA XML and mainly uses custom XSLT, XPath and XSL-FO with some other config files to create the PDF.
	- We used Apache FOP for the FO Processor
	- Currently tested with DITA-OT 1.8.5.
	

These two steps can be rolled into one with ANT to build automatically and run from inside Eclipse to go from Eclipse cheat sheets to PDF in one go.

Development was originally done in oXygen XML editor then ported to Eclipse.

The roadmap for this project is to include the latest version of DITA-OT 2.1, Apache FOP and Saxon, with the Apache ANT build code etc and full instructions on how to get up and running inside Eclipse. 

