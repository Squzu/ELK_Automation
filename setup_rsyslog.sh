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

# Function to enable rsyslog on Ubuntu
function enable_rsyslog_ubuntu() {
    # Add rsyslog configuration to send all logs to localhost on port 5514
    echo "*.* @localhost:5514" | sudo tee -a /etc/rsyslog.conf > /dev/null
    sudo systemctl restart rsyslog
    echo "rsyslog enabled to send all logs to localhost on port 5514."
}

# Function to enable rsyslog on CentOS/Red Hat
function enable_rsyslog_centos() {
    # Add rsyslog configuration to send all logs to localhost on port 5514
    echo "*.* @localhost:5514" | sudo tee -a /etc/rsyslog.conf > /dev/null
    sudo systemctl restart rsyslog
    echo "rsyslog enabled to send all logs to localhost on port 5514."
}

# Enable rsyslog based on OS
if [ "$OS" == "Ubuntu" ]; then
    enable_rsyslog_ubuntu
elif [ "$OS" == "CentOS Linux" ]; then
    enable_rsyslog_centos
elif [ "$OS" == "Red Hat Enterprise Linux Server" ]; then
    enable_rsyslog_centos
else
    echo "Rsyslog enable not supported on $OS."
fi

