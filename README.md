Here's a comprehensive GitHub README file for your scripts:

---

# ELK Stack Setup Automation

This repository contains scripts to automate the setup of the ELK (Elasticsearch, Logstash, Kibana) stack on Ubuntu or CentOS/Red Hat systems. It also includes scripts to install and configure Auditbeat and rsyslog to send logs to Logstash.

## Features

- **OS Detection:** Automatically detects the operating system (Ubuntu or CentOS/Red Hat) and installs the appropriate packages.
- **Firewall Management:** Disables `firewalld` on CentOS/Red Hat and `ufw` on Ubuntu.
- **ELK Stack Installation:** Installs and configures Elasticsearch, Logstash, and Kibana.
- **Auditbeat Installation and Configuration:** Installs Auditbeat and configures it to send logs to Logstash.
- **rsyslog Configuration:** Configures rsyslog to send logs to Logstash on port 5514.

## Usage

To use these scripts, clone the repository and run the scripts with root privileges or using sudo.

1. **Clone the repository:**
    ```bash
    git clone https://github.com/squzu/elk-setup-script.git
    cd elk-setup-script
    ```

2. **Run the ELK stack setup script:**
    ```bash
    sudo bash setup_elk_stack.sh
    ```

3. **Run the Auditbeat installation and configuration script:**
    ```bash
    sudo bash setup_auditbeat.sh
    ```

4. **Run the rsyslog configuration script:**
    ```bash
    sudo bash setup_rsyslog.sh
    ```

## Technologies Used

- **Bash Scripting:** To automate the installation and configuration processes.
- **Elasticsearch, Logstash, Kibana (ELK):** For log management and visualization.
- **Auditbeat:** For monitoring and auditing the system.
- **rsyslog:** For forwarding system logs.

## Working

### ELK Stack Setup Script

This script performs the following steps:

1. Detects the operating system.
2. Installs necessary packages for Ubuntu or CentOS/Red Hat.
3. Downloads and installs the ELK stack.
4. Configures Elasticsearch, Logstash, and Kibana.
5. Disables the firewall.

### Auditbeat Installation and Configuration Script

This script performs the following steps:

1. Detects the operating system.
2. Installs Auditbeat on Ubuntu or CentOS/Red Hat.
3. Replaces the default `auditbeat.yml` with a custom configuration.
4. Restarts the Auditbeat service.

### rsyslog Configuration Script

This script performs the following steps:

1. Detects the operating system.
2. Adds configuration to send all logs to localhost on port 5514.
3. Restarts the rsyslog service.

## Contributing

Contributions are welcome! Please fork this repository, make your changes, and submit a pull request.

1. Fork the repository.
2. Create a new branch: `git checkout -b feature-branch`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature-branch`
5. Open a pull request.

## Screenshots

### ELK Stack Installation

![ELK Stack Installation](screenshots/elk_installation.png)

### Auditbeat Configuration

![Auditbeat Configuration](screenshots/auditbeat_configuration.png)

### rsyslog Configuration

![rsyslog Configuration](screenshots/rsyslog_configuration.png)

---
