import os
import configparser #/etc/grafana/grafana.ini

config = configparser.ConfigParser()


PORT = input("What port you want grafana to listen on ")
config.read("/etc/grafana/grafana.ini")
config.set('server','http_port',PORT)
# os.environ["GF_SERVER_HTTP_PORT"] = str(PORT)
PORT = input("What port you want InfluxDB to listen on ")
os.environ["INFLUXDB_HTTP_BIND_ADDRESS"] = str(PORT)
