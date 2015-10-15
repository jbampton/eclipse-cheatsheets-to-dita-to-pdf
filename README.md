# eclipse-cheatsheets-to-dita-to-pdf

I worked on https://github.com/debrief/debrief and this project is based on parts of the document publishing that I did in that project.  See the glossary of links at the bottom of this README which describe the technologies being used.

This is mainly a Java based project in that all the code libraries use Java (Apache FOP, Saxon, DITA Open Toolkit (DITA-OT), Apache ANT, Eclipse).  Development was originally done in oXygen XML Editor then ported to Eclipse.

The roadmap for this project is make the "info.debrief" custom DITA-OT plugin compatible with the latest versions of the libraries (DITA-OT 2.1, Apache FOP 2.0) and with the full Apache ANT build code and in depth instructions on how to get up and running inside Eclipse and more.... 

Basically this code takes a set of Eclipse cheat sheets and transforms them to PDF. 

It's a two step process first the DITA XML is created from the Eclipse cheat sheets and then you use the DITA-Open Toolkit to create the PDF from the auto created DITA files.

The two parts of the transformation and rendering comprise of:

1.	- Use cheatsheet-to-dita.xsl which requires an XSLT 2.0 compliant processor.
	- I used SaxonHE9-6-0-7J from Saxonica which is currently the latest version.
	- This file takes as input a collection on XML files (Eclipse cheat sheets) and creates multiple output files - a parent DITA Map and some associated tasks.
	- The 'dita-output' and sub 'dita' folder contains the dynamically created DITA files from this step
	
	
2.	- The 'info.debrief' DITA-OT custom plugin produces the PDF via the DITA-OT and a XSL - Formatting Objects Processor (FO Processor)
	- The 'dita-output/out' folder contains the resulting PDF output from step 2
	- I used Apache FOP 1.1 for the FO Processor and DITA-OT 1.8.5
	
	
How DITA-OT Plugins work:

1. 	- Plugins are placed in the DITA-OT plugins directory.  You can see the plugin I built in this directory named 'info.debrief'.
	- When ready a plugin must be integrated into DITA-OT using Apache Ant.  On the command line it would be -> ant -f integrator.xml
	- Every plugin has a transtype -> this plugins transtype is 'debrief'
	- Plugins are comprised of some XML config files, some artwork and some custom XSL (XSLT/XSL-FO/XPath) code 


Project Set Up, Build and Run.

1. 	- Download Eclipse Mars and install and then open.	
	- Clone Git repo
	- Switch your Eclipse workspace to the parent of the folder above.
	- Then go -> File -> New -> Project
	- Select 'Java Project' click next
	- Enter 'eclipse-cheatsheets-to-dita-to-pdf' in the Project Name field
	- Un-check location checkbox and enter in the parent folder of the project. In project layout select the 'Use project folder as root for sources and class files' radio button and then click next.
	- You must add the JAR files from SaxonHE and DITA-OT to Ant inside Eclipse. Go Preferences -> Ant -> Runtime -> Classpath tab -> click Global Entries -> click Add JARs -> navigate to "src/libs/DITA-OT1.8.5/lib" and add all the JAR files from that directory.  Click add JARS again and add saxon9he.jar from  "src/libs/SaxonHE9-6-0-7J".  Make sure to click Apply and then click Ok.
	
		
	
2.  - right click on build1.xml and select -> Run As -> Ant Build
	- this should run and re-create the DITA XML output in the 'dita-output' directory.  There should be five DITA files, one parent Ditamap and 4 task files with the Ditamap at the root of the output folder with task files together in the sub folder 'dita'
	- The final resulting PDF should be called map.pdf 


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
