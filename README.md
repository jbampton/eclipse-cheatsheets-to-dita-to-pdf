# eclipse-cheatsheets-to-dita-to-pdf

I worked on https://github.com/debrief/debrief and I was given permission to extract the part of the project I worked on.

Basically this code takes a set of Eclipse cheat sheets and transforms them to PDF.

It's a two step process first the DITA XML is created from the ecliplse cheat sheets and then you use DITA-OT to create the PDF from the created DITA files.

The first step uses cheatsheet-to-dita.xsl which requires an XSLT 2.0 compliant processor like Saxon 9+ HE

The second step requires DITA-OT and that "info.debrief" be placed in the DITA-OT plugins directory.

Currently tested with DITA-OT 1.8.5.

Set the transtype to 'debrief'.

All of this code can be put into Eclipse with ANT to build automatically.

Development was originally done in oXygen XML editor then ported to Eclipse.

