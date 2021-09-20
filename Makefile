.PHONY: all
all: clean zip

.PHONY: zip
zip:
	zip node_exporter.zip node_exporter.service install.sh

.PHONY: clean
clean:
	rm -f node_exporter.zip
