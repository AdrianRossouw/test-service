FROM paparent/nodejs:0.10.28
RUN npm install -g supervisor
ADD ./package.json /app/package.json

WORKDIR /app
RUN npm install

ADD ./src /app/
ADD ./service.js /app/service.js

EXPOSE 3000
ENTRYPOINT supervisor service.js
