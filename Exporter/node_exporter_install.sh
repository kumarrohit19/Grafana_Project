#!/bin/bash

set -e

VERSION="1.7.0"
USER="node_exporter"

echo "Installing Node Exporter $VERSION..."

# Create user
useradd --no-create-home --shell /bin/false $USER || true

# Download
cd /tmp
wget https://github.com/prometheus/node_exporter/releases/download/v$VERSION/node_exporter-$VERSION.linux-amd64.tar.gz

# Extract
tar xvf node_exporter-$VERSION.linux-amd64.tar.gz

# Install
cp node_exporter-$VERSION.linux-amd64/node_exporter /usr/local/bin/

chown $USER:$USER /usr/local/bin/node_exporter

# Create service
cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=$USER
Group=$USER
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

# Start
systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter

systemctl status node_exporter --no-pager
