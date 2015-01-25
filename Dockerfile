FROM node
RUN npm install -g supervisor
ADD ./package.json /app/package.json

WORKDIR /app
RUN npm install

ADD ./service.js /app/service.js
ADD ./src /app/src

EXPOSE 3000
ENTRYPOINT supervisor service.js
