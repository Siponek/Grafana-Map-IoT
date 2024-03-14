FROM nodered/node-red:3.1.6-18 AS builder
WORKDIR /usr/src/node-red
RUN npm install node-red-contrib-aedes node-red-contrib-influxdb 
ENTRYPOINT ["./entrypoint.sh"]