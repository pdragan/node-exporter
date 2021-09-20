#!/bin/bash

NODE_EXPORTER_VERSION=1.2.2

# Initial setup

useradd --no-create-home --shell /bin/false node_exporter

mkdir -p /var/lib/node_exporter/textfile_collector

# Download prometheus server and node_exporter

wget https://github.com/prometheus/node_exporter/releases/download/v$NODE_EXPORTER_VERSION/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz

# Extract Node_Exporter
tar xvf node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz
cp node_exporter-$NODE_EXPORTER_VERSION.linux-amd64/node_exporter /usr/local/bin
chown node_exporter:node_exporter /usr/local/bin/node_exporter
chown -R node_exporter:node_exporter /var/lib/node_exporter/textfile_collector
chmod -R 766 /var/lib/node_exporter/textfile_collector

# SystemD Services
cp ./node_exporter.service /etc/systemd/system/node_exporter.service

systemctl daemon-reload

systemctl enable --now node_exporter
