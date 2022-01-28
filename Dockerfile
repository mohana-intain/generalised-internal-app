FROM node:8
  
WORKDIR /opt/node-app

# install deps
COPY package.json /opt/node-app
RUN npm install

# Setup workdir
COPY . /opt/node-app

# run
EXPOSE 4000
CMD node app.js
