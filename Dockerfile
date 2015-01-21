FROM paparent/nodejs:0.10.28
RUN npm install -g supervisor
ADD . /app
WORKDIR /app
EXPOSE 3000
ENTRYPOINT supervisor service.js
