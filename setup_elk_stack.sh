#!/bin/bash
#
# Script: setup_elk_stack.sh
# Author: Squzu
# Description: This script automates the setup of the ELK (Elasticsearch, Logstash, Kibana) stack on Ubuntu or CentOS/Red Hat.
# Version: 1.0
# Last Updated: 2024-05-21
# Website: https://github.com/squzu/elk-setup-script
# License: MIT License
#
# This script installs the ELK stack (Elasticsearch, Logstash, Kibana) on Ubuntu or CentOS/Red Hat systems. It downloads and installs the necessary packages,
# configures the services, and sets up Logstash to receive logs from various sources.
#
# This script supports the following operating systems:
# - Ubuntu
# - CentOS/Red Hat
#
# Usage: bash setup_elk_stack.sh
#
# Note: Make sure to run this script with root privileges or using sudo.
#

# Function to display a loading bar
function loading_bar() {
    local pid=$!
    local delay=0.5
    local spinstr='|/-\'
    while ps a | awk '{print $1}' | grep -q "$pid"; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Function to install packages on Ubuntu
function install_ubuntu_packages() {
    sudo apt update
    sudo apt install -y curl wget gnupg2 openjdk-11-jdk apt-transport-https
}

# Function to install packages on CentOS/Red Hat
function install_centos_packages() {
    sudo yum update -y
    sudo yum install -y curl wget java-11-openjdk-devel
}

# Function to install ELK stack on Ubuntu
function install_elk_ubuntu() {
    # Import Elasticsearch GPG key and add repository
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
    sudo apt-get update

    # Install Elasticsearch, Kibana, and Logstash
    sudo apt install -y elasticsearch kibana logstash &
    loading_bar
}

# Function to install ELK stack on CentOS/Red Hat
function install_elk_centos() {
    # Import Elasticsearch GPG key and add repository
    sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
    echo "[elasticsearch-8.x]
name=Elasticsearch repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md" | sudo tee /etc/yum.repos.d/elasticsearch-8.x.repo

    # Install Elasticsearch, Kibana, and Logstash
    sudo yum install -y elasticsearch kibana logstash &
    loading_bar
}

# Error handling function
function check_errors() {
    if [ $? -ne 0 ]; then
        echo "Error occurred. Exiting..."
        exit 1
    fi
}

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

# Print script information
echo "Script Name: setup_elk_stack.sh"
echo "Author: Squzu"
echo "Description: This script automates the setup of the ELK (Elasticsearch, Logstash, Kibana) stack on Ubuntu or CentOS/Red Hat."
echo "Version: 1.0"
echo "Last Updated: 2024-05-21"
echo "Website: https://github.com/squzu/elk-setup-script"
echo "License: MIT License"
echo ""

# Determine which installation functions to call based on the OS
if [ "$OS" == "Ubuntu" ]; then
    echo "Installing packages on Ubuntu..."
    install_ubuntu_packages
    check_errors
    echo "Installing ELK stack on Ubuntu..."
    install_elk_ubuntu
    check_errors
elif [ "$OS" == "CentOS Linux" ]; then
    echo "Installing packages on CentOS/Red Hat..."
    install_centos_packages
    check_errors
    echo "Installing ELK stack on CentOS/Red Hat..."
    install_elk_centos
    check_errors
else
    echo "Unsupported operating system: $OS"
    exit 1
fi

# Configure Elasticsearch
sudo sed -i 's/#network.host: 192.168.0.1/network.host: localhost/' /etc/elasticsearch/elasticsearch.yml
sudo sed -i 's/#http.port: 9200/http.port: 9200/' /etc/elasticsearch/elasticsearch.yml

# Configure Kibana
sudo sed -i 's/#server.port: 560/server.port: 5601/' /etc/kibana/kibana.yml
sudo sed -i 's/#server.host: "localhost"/server.host: "localhost"/' /etc/kibana/kibana.yml
IP=$(hostname -I | awk '{print $1}') && sudo sed -i "s/#server.host: \"localhost\"/server.host: \"$IP\"/" /etc/kibana/kibana.yml

# Configure Logstash
# Define the Logstash configuration
logstash_config=$(cat <<EOF
input {
    beats {
        port => 5044
        add_field => { "logtag" => "auditbeat" }
    }
    tcp {
        port => 5514
        add_field => { "logtag" => "rsyslogs" }
    }
    udp {
        port => 5514
        add_field => { "logtag" => "rsyslogs" }
    }
}

filter {
    if "auditbeat" in [logtag] {
        mutate {
            add_field => { "index" => "auditbeat" }
        }
    } else if "rsyslogs" in [logtag] {
        mutate {
            add_field => { "index" => "rsyslogs" }
        }
    }
}

output {
    if [index] == "auditbeat" {
        elasticsearch {
            hosts => ["http://localhost:9200"]
            index => "auditbeat-%{+YYYY.MM.dd}"
        }
    } else if [index] == "rsyslogs" {
        elasticsearch {
            hosts => ["http://localhost:9200"]
            index => "rsyslogs-%{+YYYY.MM.dd}"
        }
    }
}
EOF
)

# Save the Logstash configuration to elk.conf
echo "$logstash_config" | sudo tee /etc/logstash/conf.d/elk.conf > /dev/null

# Enable and start ELK services
sudo systemctl start elasticsearch
sudo systemctl start kibana
sudo systemctl start logstash

sudo systemctl enable elasticsearch
sudo systemctl enable kibana
sudo systemctl enable logstash
