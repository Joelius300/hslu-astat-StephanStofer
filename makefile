PARAMS=--pdf-engine=xelatex --filter pandoc-mermaid --metadata-file=$(OPTIONS) --resource-path=$(SEARCHPATH)
OPTIONS=document_options.yaml
OUTPUT=Zusammenfassung_ASTAT_H20
INPUT=hslu-astat-StephanStofer/*.md
SEARCHPATH=hslu-astat-StephanStofer/images/
FILEEXTENSION=.pdf

all: compile clean open

compile: $(TARGET)
	pandoc -s $(PARAMS) $(INPUT) -o $(OUTPUT)$(FILEEXTENSION)

clean:
	rm -f *.lock
	if [ -d "mermaid-images" ]; then rm -R mermaid-images; fi
	rm -f *.json

open:
	open $(OUTPUT)$(FILEEXTENSION)
