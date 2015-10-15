# eclipse-cheatsheets-to-dita-to-pdf

I worked on https://github.com/debrief/debrief and this project is based on parts of the document publishing in that project.  See the glossary of links at the bottom of this readme which describe the technologies being used.

This is mainly a Java based project in that all the code libraries use Java (Apache FOP, Saxon, DITA-OT, Apache ANT, Eclipse).  Development was originally done in oXygen XML Editor then ported to Eclipse.

The roadmap for this project is make the "info.debrief" custom DITA-OT plugin compatible with the latest versions of the libraries (DITA-OT 2.1, Apache FOP 2.0) and with the full Apache ANT build code and in depth instructions on how to get up and running inside Eclipse and more.... 

Basically this code takes a set of Eclipse cheat sheets and transforms them to PDF. 

It's a two step process first the DITA XML is created from the Eclipse cheat sheets and then you use the DITA-Open Toolkit to create the PDF from the auto created DITA files.

The two parts of the transformation comprise of:

1.	- Use cheatsheet-to-dita.xsl which requires an XSLT 2.0 compliant processor.
	- We used SaxonHE9-6-0-7J from Saxonica which is currently the latest version.
	- This file takes as input a collection on XML files (Eclipse cheat sheets) and creates multiple output files - a parent DITA Map and some associated tasks.
	- the 'dita-output' folder contains the dynamically created DITA files from this step
	
	
2.	- "info.debrief" plugin should be placed in the DITA-OT plugins directory.
	- You must then integrate "info.debrief" with the DITA-OT plug-in integration process using Apache Ant
	- Set the transtype to 'debrief'
	- You must add the jar files from DITA-OT to Ant inside Eclipse. Go Preferences -> Ant -> Runtime -> Classpath tab -> click Global Entries -> click Add Jars -> navigate to "src/libs/DITA-OT1.8.5/lib" and add all the Jar files from that directory.
	-
	- the 'dita-output/out' folder contains the resulting PDF output from step 2
	- The 'info.debrief' plugin is comprised of some XML config files, some artwork and some custom XSL (XSLT/XSL-FO/XPath) code 
	- the 'info.debrief' plugin produces the PDF via a XSL - Formatting Objects Processor (FO Processor)
	- We used Apache FOP 1.0 for the FO Processor
	- We used DITA-OT 1.8.5.

Project Set Up, Build and Run.

1. 	- Download Eclipse Mars and install and then open.	
	- clone Git repo
	- Switch your Eclipse workspace to the parent of the folder above.
	- run Eclipse and go -> File -> New -> Project
	- Select 'Java Project' click next.
	- Enter 'eclipse-cheatsheets-to-dita-to-pdf' in the Project Name field
	- Un-check location checkbox and enter in the parent folder of the project. In project layout select the 'Use project folder as root for sources and class files' radio button and then click next.
	
	
	
	
	
	
2.  - right click on build1.xml and select -> Run As -> Ant Build
	- this should run and re-create the DITA XML output in the 'dita-output' directory.  There should be five DITA files, one parent Ditamap and 4 task files with the Ditamap at the root of the output folder with task files together in the sub folder 'dita'.
	- more work to come on making the build file complete the second step.


Eclipse - https://eclipse.org/ 

Eclipse cheat sheets - http://help.eclipse.org/mars/index.jsp?topic=%2Forg.eclipse.platform.doc.user%2Freference%2Fref-cheatsheets.htm

Apache FOP - https://xmlgraphics.apache.org/fop/

Apache ANT - http://ant.apache.org

Saxon - http://saxon.sourceforge.net/

Saxonica - http://www.saxonica.com/welcome/welcome.xml

DITA - https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture

DITA-Open Toolkit - http://www.dita-ot.org/

DITA-OT installing plugins - http://dita-ot.sourceforge.net/1.7/dev_ref/plugins-installing.html

W3C - The Extensible Stylesheet Language Family (XSL) - http://www.w3.org/Style/XSL/

W3C XSLT 2.0 - http://www.w3.org/TR/xslt20/ 

XSL Formatting Objects - https://en.wikipedia.org/wiki/XSL_Formatting_Objects

XSL-FO Processors - http://www.w3.org/community/ppl/wiki/XSL-FO_Processors

XML - https://en.wikipedia.org/wiki/XML

oXygen XML Editor - http://www.oxygenxml.com

Generate sample DITA-OT plugin - https://dita-generator-hrd.appspot.com/pdf-plugin/

Creating DITA-OT plugins - http://dita-ot.sourceforge.net/1.5.4/dev_ref/plugins-overview.html

Customizing PDF output - http://www.dita-ot.org/1.8/readme/dita2pdf-customization.html
