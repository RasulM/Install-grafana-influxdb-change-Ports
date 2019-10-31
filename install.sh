#!/bin/bash
sudo dpkg -i grafana_6.4.3_armhf.deb
systemctl daemon-reload;
systemctl start grafana-server;
systemctl status grafana-server;
sudo systemctl enable grafana-server.service;
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/os-release
test $VERSION_ID = "9" && echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt-get update && sudo apt-get install influxdb
sudo systemctl unmask influxdb.service
sudo systemctl start influxdb
sudo systemctl enable influxdb.service
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
sudo python3 setports.py
