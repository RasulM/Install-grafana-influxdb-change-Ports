import os
import configparser #/etc/grafana/grafana.ini

config = configparser.ConfigParser()
config.read("/etc/grafana/grafana.ini")

PORT = input("What port you want grafana to listen on ")
#comment out config stuff if you get error
config.set('server','http_port',PORT)
# os.environ["GF_SERVER_HTTP_PORT"] = str(PORT)
PORT = input("What port you want InfluxDB to listen on ")
os.environ["INFLUXDB_HTTP_BIND_ADDRESS"] = str(PORT)
