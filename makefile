PARAMS=--pdf-engine=xelatex --filter pandoc-mermaid --metadata-file=$(OPTIONS)
OPTIONS=document_options.yaml
OUTPUT=Zusammenfassung_ASTAT_H20
INPUT=notes/*.md
FILEEXTENSION=.pdf

all: compile clean

compile: $(TARGET)
	pandoc -s $(PARAMS) $(INPUT) -o $(OUTPUT)$(FILEEXTENSION)

clean:
	rm -f *.lock
	if [ -d "mermaid-images" ]; then rm -R mermaid-images; fi
	rm -f *.json
