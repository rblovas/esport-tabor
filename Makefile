all:	clean xmllint TDK_Esport_vallalkozas_az_egyetemen.pdf
epub:	clean xmllint TDK_Esport_vallalkozas_az_egyetemen.epub

TDK_Esport_vallalkozas_az_egyetemen.pdf: TDK_Esport_vallalkozas_az_egyetemen.xml udprog.xsl
	dblatex TDK_Esport_vallalkozas_az_egyetemen.xml -p udprog.xsl

TDK_Esport_vallalkozas_az_egyetemen.epub: TDK_Esport_vallalkozas_az_egyetemen.xml
	dbtoepub -o TDK_Esport_vallalkozas_az_egyetemen.epub TDK_Esport_vallalkozas_az_egyetemen.xml

.PHONY: jing
jing:
	xmllint --xinclude TDK_Esport_vallalkozas_az_egyetemen.xml --output output.xml
	java -jar /home/nbatfai/Downloads/jing-trang-20131210/build/jing.jar -c http://docbook.org/xml/5.1/rng/docbookxi.rnc output.xml

.PHONY: xmllint
xmllint:
	xmllint --xinclude TDK_Esport_vallalkozas_az_egyetemen.xml --output output.xml
	xmllint --relaxng http://docbook.org/xml/5.1/rng/docbookxi.rng output.xml --noout
	rm -f output.xml

.PHONY: clean
clean:
	rm -vf TDK_Esport_vallalkozas_az_egyetemen.pdf TDK_Esport_vallalkozas_az_egyetemen.epub

