![ruby-original](https://github.com/Squzu/ELK_Automation/assets/94438634/de0e46b1-0f77-4751-ae78-055e589727a1)![68747470733a2f2f696d672e736869656c64732e696f2f62616467652f7368656c6c5f7363726970742d2532333132313031312e7376673f7374796c653d666f722d7468652d6261646765266c6f676f3d676e752d62617368266c6f676f436f6c6f723d7768697465](https://github.com/Squzu/ELK_Automation/assets/94438634/6d507e44-d2e9-48fb-8d55-f87f598162f4)# ELK Stack Setup Automation 
![Uploading 68747470733a2f2f696d67<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="139" height="28" role="img" aria-label="SHELL SCRIPT"><title>SHELL SCRIPT</title><g shape-rendering="crispEdges"><rect width="139" height="28" fill="#121011"/></g><g fill="#fff" text-anchor="middle" font-family="Verdana,Geneva,DejaVu Sans,sans-serif" text-rendering="geometricPrecision" font-size="100"><image x="9" y="7" width="14" height="14" xlink:href="data:image/svg+xml;base64,PHN2ZyBmaWxsPSJ3aGl0ZSIgcm9sZT0iaW1nIiB2aWV3Qm94PSIwIDAgMjQgMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHRpdGxlPkdOVSBCYXNoPC90aXRsZT48cGF0aCBkPSJNMjEuMDM4LDQuOWwtNy41NzctNC40OThDMTMuMDA5LDAuMTM0LDEyLjUwNSwwLDEyLDBjLTAuNTA1LDAtMS4wMDksMC4xMzQtMS40NjIsMC40MDNMMi45NjEsNC45IEMyLjA1Nyw1LjQzNywxLjUsNi40MjksMS41LDcuNTAzdjguOTk1YzAsMS4wNzMsMC41NTcsMi4wNjYsMS40NjIsMi42MDNsNy41NzcsNC40OTdDMTAuOTkxLDIzLjg2NiwxMS40OTUsMjQsMTIsMjQgYzAuNTA1LDAsMS4wMDktMC4xMzQsMS40NjEtMC40MDJsNy41NzctNC40OTdjMC45MDQtMC41MzcsMS40NjItMS41MjksMS40NjItMi42MDNWNy41MDNDMjIuNSw2LjQyOSwyMS45NDMsNS40MzcsMjEuMDM4LDQuOXogTTE1LjE3LDE4Ljk0NmwwLjAxMywwLjY0NmMwLjAwMSwwLjA3OC0wLjA1LDAuMTY3LTAuMTExLDAuMTk4bC0wLjM4MywwLjIyYy0wLjA2MSwwLjAzMS0wLjExMS0wLjAwNy0wLjExMi0wLjA4NUwxNC41NywxOS4yOSBjLTAuMzI4LDAuMTM2LTAuNjYsMC4xNjktMC44NzIsMC4wODRjLTAuMDQtMC4wMTYtMC4wNTctMC4wNzUtMC4wNDEtMC4xNDJsMC4xMzktMC41ODRjMC4wMTEtMC4wNDYsMC4wMzYtMC4wOTIsMC4wNjktMC4xMjEgYzAuMDEyLTAuMDExLDAuMDI0LTAuMDIsMC4wMzYtMC4wMjZjMC4wMjItMC4wMTEsMC4wNDMtMC4wMTQsMC4wNjItMC4wMDZjMC4yMjksMC4wNzcsMC41MjEsMC4wNDEsMC44MDItMC4xMDEgYzAuMzU3LTAuMTgxLDAuNTk2LTAuNTQ1LDAuNTkyLTAuOTA3Yy0wLjAwMy0wLjMyOC0wLjE4MS0wLjQ2NS0wLjYxMy0wLjQ2OGMtMC41NSwwLjAwMS0xLjA2NC0wLjEwNy0xLjA3Mi0wLjkxNyBjLTAuMDA3LTAuNjY3LDAuMzQtMS4zNjEsMC44ODktMS44bC0wLjAwNy0wLjY1MmMtMC4wMDEtMC4wOCwwLjA0OC0wLjE2OCwwLjExMS0wLjJsMC4zNy0wLjIzNiBjMC4wNjEtMC4wMzEsMC4xMTEsMC4wMDcsMC4xMTIsMC4wODdsMC4wMDYsMC42NTNjMC4yNzMtMC4xMDksMC41MTEtMC4xMzgsMC43MjYtMC4wODhjMC4wNDcsMC4wMTIsMC4wNjcsMC4wNzYsMC4wNDgsMC4xNTEgbC0wLjE0NCwwLjU3OGMtMC4wMTEsMC4wNDQtMC4wMzYsMC4wODgtMC4wNjUsMC4xMTZjLTAuMDEyLDAuMDEyLTAuMDI1LDAuMDIxLTAuMDM4LDAuMDI4Yy0wLjAxOSwwLjAxLTAuMDM4LDAuMDEzLTAuMDU3LDAuMDA5IGMtMC4wOTgtMC4wMjItMC4zMzItMC4wNzMtMC42OTksMC4xMTNjLTAuMzg1LDAuMTk1LTAuNTIsMC41My0wLjUxNywwLjc3OGMwLjAwMywwLjI5NywwLjE1NSwwLjM4NywwLjY4MSwwLjM5NiBjMC43LDAuMDEyLDEuMDAzLDAuMzE4LDEuMDEsMS4wMjNDMTYuMTA1LDE3Ljc0NywxNS43MzYsMTguNDkxLDE1LjE3LDE4Ljk0NnogTTE5LjE0MywxNy44NTljMCwwLjA2LTAuMDA4LDAuMTE2LTAuMDU4LDAuMTQ1IGwtMS45MTYsMS4xNjRjLTAuMDUsMC4wMjktMC4wOSwwLjAwNC0wLjA5LTAuMDU2di0wLjQ5NGMwLTAuMDYsMC4wMzctMC4wOTMsMC4wODctMC4xMjJsMS44ODctMS4xMjkgYzAuMDUtMC4wMjksMC4wOS0wLjAwNCwwLjA5LDAuMDU2VjE3Ljg1OXogTTIwLjQ1OSw2Ljc5N2wtNy4xNjgsNC40MjdjLTAuODk0LDAuNTIzLTEuNTUzLDEuMTA5LTEuNTUzLDIuMTg3djguODMzIGMwLDAuNjQ1LDAuMjYsMS4wNjMsMC42NiwxLjE4NGMtMC4xMzEsMC4wMjMtMC4yNjQsMC4wMzktMC4zOTgsMC4wMzljLTAuNDIsMC0wLjgzMy0wLjExNC0xLjE5Ny0wLjMzTDMuMjI2LDE4LjY0IGMtMC43NDEtMC40NC0xLjIwMS0xLjI2MS0xLjIwMS0yLjE0MlY3LjUwM2MwLTAuODgxLDAuNDYtMS43MDIsMS4yMDEtMi4xNDJsNy41NzctNC40OThjMC4zNjMtMC4yMTYsMC43NzctMC4zMywxLjE5Ny0wLjMzIGMwLjQxOSwwLDAuODMzLDAuMTE0LDEuMTk3LDAuMzNsNy41NzcsNC40OThjMC42MjQsMC4zNzEsMS4wNDYsMS4wMTMsMS4xNjQsMS43MzJDMjEuNjg2LDYuNTU3LDIxLjEyLDYuNDExLDIwLjQ1OSw2Ljc5N3oiLz48L3N2Zz4="/><text transform="scale(.1)" x="795" y="175" textLength="950" fill="#fff" font-weight="bold">SHELL SCRIPT</text></g></svg>2e736869656c64732e696f2f62616467652f7368656c6c5f7363726970742d2532333132313031312e7376673f7374796c653d666f722d7468652d6261646765266c6f676f3d676e752d62617368266c6f676f436f6c6f723d7768697465.svg…]()

![Uploading 68747470733a2f2f7777772e766563746f726c<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="64" height="64"><path d="M32 16.77c0-2.678-1.664-5.03-4.166-5.937a9.14 9.14 0 0 0 .162-1.718c0-5-4.057-9.048-9.035-9.048-2.92 0-5.626 1.393-7.33 3.746a4.78 4.78 0 0 0-2.935-1c-2.65 0-4.8 2.15-4.8 4.8 0 .582.108 1.15.298 1.677A6.36 6.36 0 0 0 0 15.243a6.31 6.31 0 0 0 4.179 5.951 9.02 9.02 0 0 0-.162 1.718 9.03 9.03 0 0 0 9.021 9.021c2.92 0 5.626-1.407 7.317-3.76.84.663 1.866 1.028 2.935 1.028 2.65 0 4.8-2.15 4.8-4.8 0-.582-.108-1.15-.298-1.677A6.37 6.37 0 0 0 32 16.771" fill="#fff"/><path d="M12.578 13.795l7.006 3.192 7.06-6.194a7.4 7.4 0 0 0 .149-1.555 7.91 7.91 0 0 0-7.899-7.899 7.89 7.89 0 0 0-6.505 3.435l-1.177 6.1z" fill="#fed10a"/><path d="M5.33 21.207a7.66 7.66 0 0 0-.15 1.582c0 4.37 3.557 7.912 7.926 7.912a7.92 7.92 0 0 0 6.546-3.462l1.163-6.073-1.555-2.975-7.033-3.205z" fill="#24bbb1"/><path d="M5.288 9.09l4.8 1.136 1.055-5.45c-.65-.5-1.46-.77-2.3-.77A3.79 3.79 0 0 0 5.058 7.79c0 .446.08.893.23 1.298" fill="#ef5098"/><path d="M4.87 10.238c-2.137.703-3.638 2.76-3.638 5.018 0 2.205 1.366 4.166 3.408 4.95l6.735-6.086-1.23-2.637z" fill="#17a8e0"/><path d="M20.87 27.24a3.8 3.8 0 0 0 2.286.784 3.79 3.79 0 0 0 3.787-3.787 3.82 3.82 0 0 0-.23-1.312l-4.788-1.123z" fill="#93c83e"/><path d="M21.843 20.544l5.275 1.23a5.33 5.33 0 0 0 3.638-5.031 5.29 5.29 0 0 0-3.408-4.937l-6.898 6.046z" fill="#0779a1"/></svg>6f676f2e7a6f6e652f6c6f676f732f656c61737469632f656c61737469632d69636f6e2e737667.svg…]()

![U<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128 128"><linearGradient id="ruby-original-a" gradientUnits="userSpaceOnUse" x1="157.08" y1="2382.05" x2="131.682" y2="2426.892" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#FB7655"/><stop offset="0" stop-color="#FB7655"/><stop offset=".41" stop-color="#E42B1E"/><stop offset=".99" stop-color="#900"/><stop offset="1" stop-color="#900"/></linearGradient><path fill="url(#ruby-original-a)" d="M97.078 83.214L28.34 124.031l89.003-6.04 6.855-89.745z"/><linearGradient id="ruby-original-b" gradientUnits="userSpaceOnUse" x1="169.731" y1="2419.72" x2="136.998" y2="2441.685" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#871101"/><stop offset="0" stop-color="#871101"/><stop offset=".99" stop-color="#911209"/><stop offset="1" stop-color="#911209"/></linearGradient><path fill="url(#ruby-original-b)" d="M117.488 117.93l-7.649-52.799-20.837 27.514z"/><linearGradient id="ruby-original-c" gradientUnits="userSpaceOnUse" x1="143.542" y1="2380.69" x2="110.81" y2="2402.655" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#871101"/><stop offset="0" stop-color="#871101"/><stop offset=".99" stop-color="#911209"/><stop offset="1" stop-color="#911209"/></linearGradient><path fill="url(#ruby-original-c)" d="M117.592 117.93l-56.044-4.399-32.91 10.385z"/><linearGradient id="ruby-original-d" gradientUnits="userSpaceOnUse" x1="74.817" y1="2435.622" x2="79.891" y2="2402.644" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#fff"/><stop offset="0" stop-color="#fff"/><stop offset=".23" stop-color="#E57252"/><stop offset=".46" stop-color="#DE3B20"/><stop offset=".99" stop-color="#A60003"/><stop offset="1" stop-color="#A60003"/></linearGradient><path fill="url(#ruby-original-d)" d="M28.717 123.928l14.001-45.867-30.81 6.588z"/><linearGradient id="ruby-original-e" gradientUnits="userSpaceOnUse" x1="109.719" y1="2466.413" x2="111.589" y2="2432.757" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#fff"/><stop offset="0" stop-color="#fff"/><stop offset=".23" stop-color="#E4714E"/><stop offset=".56" stop-color="#BE1A0D"/><stop offset=".99" stop-color="#A80D00"/><stop offset="1" stop-color="#A80D00"/></linearGradient><path fill="url(#ruby-original-e)" d="M88.996 92.797l-12.882-50.46-36.866 34.558z"/><linearGradient id="ruby-original-f" gradientUnits="userSpaceOnUse" x1="140.691" y1="2497.523" x2="146.289" y2="2473.401" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#fff"/><stop offset="0" stop-color="#fff"/><stop offset=".18" stop-color="#E46342"/><stop offset=".4" stop-color="#C82410"/><stop offset=".99" stop-color="#A80D00"/><stop offset="1" stop-color="#A80D00"/></linearGradient><path fill="url(#ruby-original-f)" d="M121.275 43.047L86.426 14.585l-9.704 31.373z"/><linearGradient id="ruby-original-g" gradientUnits="userSpaceOnUse" x1="123.6" y1="2506.018" x2="147.719" y2="2518.077" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#fff"/><stop offset="0" stop-color="#fff"/><stop offset=".54" stop-color="#C81F11"/><stop offset=".99" stop-color="#BF0905"/><stop offset="1" stop-color="#BF0905"/></linearGradient><path fill="url(#ruby-original-g)" d="M104.978 4.437L84.481 15.764 71.551 4.285z"/><linearGradient id="ruby-original-h" gradientUnits="userSpaceOnUse" x1="53.674" y1="2444.028" x2="55.66" y2="2424.153" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#fff"/><stop offset="0" stop-color="#fff"/><stop offset=".31" stop-color="#DE4024"/><stop offset=".99" stop-color="#BF190B"/><stop offset="1" stop-color="#BF190B"/></linearGradient><path fill="url(#ruby-original-h)" d="M3.802 100.034l8.586-15.659L5.442 65.72z"/><path fill="#fff" d="M4.981 65.131l6.987 19.821 30.365-6.812L77 45.922l9.783-31.075L71.38 3.969l-26.19 9.802c-8.252 7.675-24.263 22.86-24.84 23.146-.573.291-10.575 19.195-15.369 28.214z"/><linearGradient id="ruby-original-i" gradientUnits="userSpaceOnUse" x1="40.026" y1="2418.781" x2="133.345" y2="2514.739" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#BD0012"/><stop offset="0" stop-color="#BD0012"/><stop offset=".07" stop-color="#fff"/><stop offset=".17" stop-color="#fff"/><stop offset=".27" stop-color="#C82F1C"/><stop offset=".33" stop-color="#820C01"/><stop offset=".46" stop-color="#A31601"/><stop offset=".72" stop-color="#B31301"/><stop offset=".99" stop-color="#E82609"/><stop offset="1" stop-color="#E82609"/></linearGradient><path fill="url(#ruby-original-i)" d="M29.519 29.521c17.882-17.73 40.937-28.207 49.785-19.28 8.843 8.926-.534 30.62-18.418 48.345-17.884 17.725-40.653 28.779-49.493 19.852-8.849-8.92.242-31.191 18.126-48.917z"/><linearGradient id="ruby-original-j" gradientUnits="userSpaceOnUse" x1="111.507" y1="2409.102" x2="83.398" y2="2416.039" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#8C0C01"/><stop offset="0" stop-color="#8C0C01"/><stop offset=".54" stop-color="#990C00"/><stop offset=".99" stop-color="#A80D0E"/><stop offset="1" stop-color="#A80D0E"/></linearGradient><path fill="url(#ruby-original-j)" d="M28.717 123.909l13.89-46.012 46.135 14.82c-16.68 15.642-35.233 28.865-60.025 31.192z"/><linearGradient id="ruby-original-k" gradientUnits="userSpaceOnUse" x1="159.785" y1="2442.837" x2="134.814" y2="2465.217" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#7E110B"/><stop offset="0" stop-color="#7E110B"/><stop offset=".99" stop-color="#9E0C00"/><stop offset="1" stop-color="#9E0C00"/></linearGradient><path fill="url(#ruby-original-k)" d="M77.062 45.831l11.844 46.911c13.934-14.65 26.439-30.401 32.563-49.883l-44.407 2.972z"/><linearGradient id="ruby-original-l" gradientUnits="userSpaceOnUse" x1="168.959" y1="2483.901" x2="156.521" y2="2497.199" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#79130D"/><stop offset="0" stop-color="#79130D"/><stop offset=".99" stop-color="#9E120B"/><stop offset="1" stop-color="#9E120B"/></linearGradient><path fill="url(#ruby-original-l)" d="M121.348 43.097c4.74-14.305 5.833-34.825-16.517-38.635l-18.339 10.13 34.856 28.505z"/><path fill="#9E1209" d="M3.802 99.828c.656 23.608 17.689 23.959 24.945 24.167l-16.759-39.14-8.186 14.973z"/><radialGradient id="ruby-original-m" cx="138.703" cy="2464.789" r="30.601" gradientTransform="matrix(1 0 0 -1 -47.5 2517)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#A80D00"/><stop offset="0" stop-color="#A80D00"/><stop offset=".99" stop-color="#7E0E08"/><stop offset="1" stop-color="#7E0E08"/></radialGradient><path fill="url(#ruby-original-m)" d="M77.128 45.904c10.708 6.581 32.286 19.798 32.723 20.041.68.383 9.304-14.542 11.261-22.976l-43.984 2.935z"/><radialGradient id="ruby-original-n" cx="96.325" cy="2424.465" r="40.679" gradientTransform="matrix(1 0 0 -1 -47.5 2517)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#A30C00"/><stop offset="0" stop-color="#A30C00"/><stop offset=".99" stop-color="#800E08"/><stop offset="1" stop-color="#800E08"/></radialGradient><path fill="url(#ruby-original-n)" d="M42.589 77.897l18.57 35.828c10.98-5.955 19.579-13.211 27.454-20.983L42.589 77.897z"/><linearGradient id="ruby-original-o" gradientUnits="userSpaceOnUse" x1="67.509" y1="2393.115" x2="57.373" y2="2427.506" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#8B2114"/><stop offset="0" stop-color="#8B2114"/><stop offset=".43" stop-color="#9E100A"/><stop offset=".99" stop-color="#B3100C"/><stop offset="1" stop-color="#B3100C"/></linearGradient><path fill="url(#ruby-original-o)" d="M11.914 84.904l-2.631 31.331c4.964 6.781 11.794 7.371 18.96 6.842-5.184-12.9-15.538-38.696-16.329-38.173z"/><linearGradient id="ruby-original-p" gradientUnits="userSpaceOnUse" x1="145.272" y1="2507.076" x2="167.996" y2="2497.045" gradientTransform="matrix(1 0 0 -1 -47.5 2517)"><stop offset="0" stop-color="#B31000"/><stop offset="0" stop-color="#B31000"/><stop offset=".44" stop-color="#910F08"/><stop offset=".99" stop-color="#791C12"/><stop offset="1" stop-color="#791C12"/></linearGradient><path fill="url(#ruby-original-p)" d="M86.384 14.67l36.891 5.177c-1.969-8.343-8.015-13.727-18.32-15.41L86.384 14.67z"/></svg>ploading ruby-original.svg…]()


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
    sudo chmod +x setup_elk_stack.sh
    sudo bash setup_elk_stack.sh
    ```

3. **Run the Auditbeat installation and configuration script:**
    ```bash
    sudo chmod +x setup_auditbeat.sh
    sudo bash setup_auditbeat.sh
    ```

4. **Run the rsyslog configuration script:**
    ```bash
    sudo chmod +x setup_rsyslog.sh
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
Elastisearch:
![image](https://github.com/Squzu/ELK_Automation/assets/94438634/942e64fd-42e6-40ce-a0be-283a99730530)

![image](https://github.com/Squzu/ELK_Automation/assets/94438634/e7a14154-c7f9-4631-99e5-35724f07b023)


Logstash:
![image](https://github.com/Squzu/ELK_Automation/assets/94438634/9729765f-24c7-4918-839d-8739902c3637)

Kibana:
![image](https://github.com/Squzu/ELK_Automation/assets/94438634/55ee8cf7-5f00-4402-96a9-f925e97bcb8a)

![image](https://github.com/Squzu/ELK_Automation/assets/94438634/c489c2d8-affe-4202-baf6-36aaff58659a)


### Auditbeat Configuration
![image](https://github.com/Squzu/ELK_Automation/assets/94438634/c5541135-68d1-4d6a-a101-e74d9a10b162)


### rsyslog Configuration

![image](https://github.com/Squzu/ELK_Automation/assets/94438634/df84aaa6-dd86-4e0f-b638-fd5253a085fa)

