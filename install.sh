#!/bin/bash
wget https://dl.grafana.com/oss/release/grafana_6.4.3_armhf.deb 
sudo dpkg -i grafana_6.4.3_armhf.deb
systemctl daemon-reload;
sudo systemctl enable grafana-server.service;
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo grafana installed
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/os-release
test $VERSION_ID = "9" && echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt-get update && sudo apt-get install influxdb
sudo systemctl unmask influxdb.service
sudo systemctl enable influxdb.service
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo grafana installed
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
sudo python3 setports.py
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
sudo lsof -iUDP -P -n
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo you should reboot
