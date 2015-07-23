# eclipse-cheatsheets-to-dita-to-pdf

I worked on https://github.com/debrief/debrief and I was given permission to extract the part of the project I worked on.

Basically this code takes a set of Eclipse cheat sheets and transforms them to PDF. 
See the glossary of links below which describe the technologies being used.

It's a two step process first the DITA XML is created from the Eclipse cheat sheets and then you use the DITA-Open Toolkit to create the PDF from the auto created DITA files.

The two parts of the transformation comprise of:

1.	- Use cheatsheet-to-dita.xsl which requires an XSLT 2.0 compliant processor.
	- We used SaxonHE9-6-0-1J from Saxonica.
	- This file takes as input a collection on XML files (Eclipse cheat sheets) and creates multiple output files - a 	parent DITA Map and some associated tasks.
	
2.	- DITA-OT is required and that "info.debrief" plugin be placed in the DITA-OT plugins directory.
	- Set the transtype to 'debrief'
	- This plugin code takes as input the DITA XML and mainly uses custom XSLT, XPath and XSL-FO with some other config files to create the PDF.
	- We used Apache FOP 1.0 for the FO Processor
	- We used DITA-OT 1.8.5.


These two steps can be rolled into one with Apache ANT to build automatically and run from inside Eclipse to go from Eclipse cheat sheets to PDF in one go.

Development was originally done in oXygen XML editor then ported to Eclipse.

The roadmap for this project is to include the latest version of all the libraries like DITA-OT 2.1, Apache FOP 2.0 and Saxon, with the Apache ANT build code etc and full instructions on how to get up and running inside Eclipse. 


Eclipse - https://eclipse.org/ 

Eclipse cheat sheets - http://help.eclipse.org/mars/index.jsp?topic=%2Forg.eclipse.platform.doc.user%2Freference%2Fref-cheatsheets.htm

Apache FOP - https://xmlgraphics.apache.org/fop/

Apache ANT - http://ant.apache.org

Saxon - http://saxon.sourceforge.net/

Saxonica - http://www.saxonica.com/welcome/welcome.xml

DITA - https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture

DITA-Open Toolkit - http://www.dita-ot.org/

W3C - The Extensible Stylesheet Language Family (XSL) - http://www.w3.org/Style/XSL/

XML - https://en.wikipedia.org/wiki/XML

oXygen XML Editor - http://www.oxygenxml.com
