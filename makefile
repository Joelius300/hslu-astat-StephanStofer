PARAMS=-N --pdf-engine=xelatex -V documentclass=scrartcl -V papersize=a4 -V lang=de -V linkcolor=blue -V fontsize=11pt -V geometry=left=2cm,right=2cm,top=2cm,bottom=3cm --filter pandoc-mermaid
FONTS=-V mainfont="Baskerville" -V sansfont="Didot" -V monofont="Arial"
DATE=-V date="`date +'%d.%m.%Y'`"
FILE=Notizen_I.BA_IOT_H20
TARGET=notes/*.md
OUTFORMAT=.pdf

all: compile clean

compile: $(TARGET)
	pandoc -s $(PARAMS) $(FONTS) $(DATE) $(TARGET) -o $(FILE)$(OUTFORMAT)

clean:
	rm -f *.lock
	if [ -d "mermaid-images" ]; then rm -R mermaid-images; fi
	rm -f *.json
