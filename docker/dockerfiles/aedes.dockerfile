FROM node:20.9.0 as builder
WORKDIR /usr/src/app
RUN npm install aedes  aedes-persistence-redis aedes-logging
CMD [ "node", "app.js" ]