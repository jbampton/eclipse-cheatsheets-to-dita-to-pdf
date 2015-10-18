# eclipse-cheatsheets-to-dita-to-pdf

I worked on https://github.com/debrief/debrief and this project is based on some parts of the document publishing that I did in that project.  See the glossary of links at the bottom of this README which describe the technologies being used.

Note: Now supporting multiple output formats - PDF, HTMLHelp, TocJS, XHTML.

This program runs inside Eclipse, an integrated development environment (IDE) and is mainly a Java based project in that all the code libraries use Java (Apache FOP, Saxon, DITA Open Toolkit, Apache ANT, Eclipse) and it also uses XML heavily.   Development was originally done in oXygen XML Editor then ported to Eclipse.

The roadmap for this project is make the "info.debrief" custom DITA-OT plugin compatible with DITA-OT 2.1 and with the full Apache ANT build code and in depth instructions on how to get up and running inside Eclipse and more.... 

When built and run this project takes a set of Eclipse cheat sheets and transforms them to PDF.  Using PDF allows us to print nicely formated cheat sheets on paper which allows the user to work through the cheat sheets with a pen and check off each item as they go.  Using cheat sheets physically on paper was seen as a new way to learn and was the original concept of the Debrief cheat sheets publishing project I worked on.

Darwin Information Typing Architecture (DITA) is an XML data model for authoring and using DITA-OT you can publish those ideas. The DITA standard is maintained by the OASIS DITA Technical Committee.

It's a two step process first the DITA XML is created from the Eclipse cheat sheets (XML files) and then you use the DITA-Open Toolkit to create the PDF from the auto created DITA files.

The two parts of the transformation and rendering comprise of:

1.	- This is the transformation step and it uses cheatsheet-to-dita.xsl which requires an XSLT 2.0 compliant processor.
	- I used SaxonHE9-6-0-7J from Saxonica which is currently the latest version.
	- This file takes as input a collection on XML files (Eclipse cheat sheets) and creates multiple output files - a parent DITA Map and some associated tasks.
	- The 'output/debrief' and sub 'dita' folder contains the dynamically created (transformed) DITA files from this step. 
	
	
2.	- This is the rendering (printing) step and the 'info.debrief' custom DITA-OT plugin produces the PDF via the DITA-OT base libraries and a XSL - Formatting Objects Processor (FO Processor)
	- The 'output/debrief/pdf' folder contains the resulting PDF output from this step
	- I used Apache FOP 2.0 for the FO Processor and DITA-OT 1.8.5


Project Set Up, Build and Run.

1. 	- Download Eclipse Mars at https://eclipse.org/downloads/ and install and then open.	
	- Clone Git repo
	- Switch your Eclipse workspace to the parent of the folder you cloned into
	- Then go -> File -> New -> Project
	- Select 'Java Project' click next
	- Enter 'eclipse-cheatsheets-to-dita-to-pdf' in the Project Name field
	- Un-check location checkbox and enter in the parent folder of the project. In project layout select -> 'Use project folder as root for sources and class files' radio button and then click next.
	- You must add the JAR files from SaxonHE and DITA-OT to Ant inside Eclipse. Go Preferences -> Ant -> Runtime -> Classpath tab -> click Global Entries -> click Add JARs -> navigate to "src/libs/DITA-OT1.8.5/lib" and add all the JAR files from that directory.  Click add JARS again and add saxon9he.jar from  "src/libs/SaxonHE9-6-0-7J".  Make sure to click Apply and then click Ok.
		
	
2.  - Right click on build.xml and select -> Run As -> Ant Build -> (first one)
	- This should run and build all tasks, creating all working output formats in one go.
	- This process re-creates the DITA XML output in the 'output' directory.  There should be five DITA files, one parent Ditamap at and 4 task files with the Ditamap at the root of the 'output/debrief' folder with task files together in the sub folder 'dita'
	- The final resulting PDF should be called map.pdf and located in the 'pdf' folder.
	- There are currently 4 other output formats (Docbook, HTMLHelp, TocJS, XHTML) as seen by the names of the folders in the 'output/debrief' directory.  The PDF output is vastly superior to the others which have no customization.  The Docbook output is a work in progress. 
	- If you want to choose which output formats to render, you can right click on build.xml and select -> Run As -> Ant Build -> (second one), and then select which output format you would like on the 'Targets' tab under 'Check targets to execute' and click Run

	
How DITA-OT PDF Plugins work:

Plugins are placed in the DITA-OT plugins directory.  You can see the plugin I built in this directory named 'info.debrief'.

When ready a plugin must be integrated into DITA-OT using Apache Ant. 
 
On the command line it would be -> ant -f integrator.xml

Every plugin has a 'transtype' -> this plugins transtype is 'debrief'

PDF Plugins are comprised of some XML config files, some artwork and some custom XSL (XSLT/XSL-FO/XPath) code 
DITA-OT provides that base XSL code that you 'override' with your custom work.

Custom XSL can be placed in two XSL files both named custom.xsl.  I placed all the custom code at 'src/libs/DITA-OT1.8.5/plugins/info.debrief/cfg/fo/xsl/custom.xsl' for this project.  The other file is seen in the adjacent 'attrs' directory. 
 
Placing the custom code only in these two files follows best practice techniques on how to build a DITA-OT PDF plugin.


Eclipse - https://eclipse.org/ 

Eclipse cheat sheets - http://help.eclipse.org/mars/index.jsp?topic=%2Forg.eclipse.platform.doc.user%2Freference%2Fref-cheatsheets.htm

Apache FOP - https://xmlgraphics.apache.org/fop/

Apache ANT - http://ant.apache.org

Saxon - http://saxon.sourceforge.net/

Saxonica - http://www.saxonica.com/welcome/welcome.xml

DITA - https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture

DITA-Open Toolkit - http://www.dita-ot.org/

W3C - The Extensible Stylesheet Language Family (XSL) - http://www.w3.org/Style/XSL/

W3C XSLT 2.0 - http://www.w3.org/TR/xslt20/ 

XSL Formatting Objects - https://en.wikipedia.org/wiki/XSL_Formatting_Objects

XSL-FO Processors - http://www.w3.org/community/ppl/wiki/XSL-FO_Processors

XML - https://en.wikipedia.org/wiki/XML

Adobe PDF - https://en.wikipedia.org/wiki/Portable_Document_Format

XHTML - https://en.wikipedia.org/wiki/XHTML

Dublin Core Metadata Initiative - http://dublincore.org/

Microsoft HTML Help 1.4 - https://msdn.microsoft.com/en-us/library/windows/desktop/ms670169(v=vs.85).aspx

The Organization for the Advancement of Structured Information Standards (OASIS) - https://en.wikipedia.org/wiki/OASIS_(organization)

oXygen XML Editor - http://www.oxygenxml.com

DITA to TocJS - http://www.dita-ot.org/1.8/readme/dita2tocjs.html

DITA-OT installing plugins - http://dita-ot.sourceforge.net/1.7/dev_ref/plugins-installing.html

Generate sample DITA-OT plugin - https://dita-generator-hrd.appspot.com/pdf-plugin/

Creating DITA-OT plugins - http://dita-ot.sourceforge.net/1.5.4/dev_ref/plugins-overview.html

Customizing PDF output - http://www.dita-ot.org/1.8/readme/dita2pdf-customization.html

XSLT FAQ. Docbook FAQ. Braille. - http://www.dpawson.co.uk/

Got 15 minutes and want to learn Git? https://try.github.io/levels/1/challenges/1

Ruby regular expression editor - http://rubular.com/
