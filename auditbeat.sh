#!/bin/bash

# Check the operating system
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
elif [ -f /etc/redhat-release ]; then
    OS=$(head -n1 /etc/redhat-release)
else
    echo "Unsupported operating system."
    exit 1
fi

# Function to install Auditbeat on Ubuntu
function install_auditbeat_ubuntu() {
    # Install prerequisites
    sudo apt update
    sudo apt install -y apt-transport-https wget

    # Import Elasticsearch GPG key and add repository
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
    echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list

    # Install Auditbeat
    sudo apt update
    sudo apt install -y auditbeat
}

# Function to install Auditbeat on CentOS/Red Hat
function install_auditbeat_centos() {
    # Import Elasticsearch GPG key and add repository
    sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
    echo "[elastic-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md" | sudo tee /etc/yum.repos.d/elastic-7.x.repo

    # Install Auditbeat
    sudo yum install -y auditbeat
}

# Function to configure Auditbeat
function configure_auditbeat() {
    # Replace the default auditbeat.yml with custom configuration
    echo "auditbeat.modules:
  - module: file_integrity
    paths:
      - /bin
      - /usr/bin
      - /sbin
      - /usr/sbin
      - /etc
  - module: system
    datasets:
      - host    # General host information, e.g. uptime, IPs
      - process # Started and stopped processes
setup.template.settings:
  index.number_of_shards: 1
output.logstash:
  hosts: [\"localhost:5044\"]
processors:
  - add_host_metadata: ~
  - add_cloud_metadata: ~
  - add_docker_metadata: ~" | sudo tee /etc/auditbeat/auditbeat.yml > /dev/null

    # Restart Auditbeat
    sudo systemctl restart auditbeat
    echo "Auditbeat configured and restarted."
}

# Install and configure Auditbeat based on OS
if [ "$OS" == "Ubuntu" ]; then
    install_auditbeat_ubuntu
    configure_auditbeat
elif [ "$OS" == "CentOS Linux" ]; then
    install_auditbeat_centos
    configure_auditbeat
elif [ "$OS" == "Red Hat Enterprise Linux Server" ]; then
    install_auditbeat_centos
    configure_auditbeat
else
    echo "Auditbeat installation not supported on $OS."
fi

