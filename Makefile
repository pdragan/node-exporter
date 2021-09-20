.PHONY: all
all: clean zip

.PHONY: zip
zip:
	zip node-exporter.zip node_exporter.service install.sh

.PHONY: clean
clean:
	rm -f node-exporter.zip
