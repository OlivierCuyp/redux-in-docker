FROM node:4.4.4

RUN apt-get update

ENV TERM=xterm
ENV ROOT /var/www/react-starter-app

# make this cache-able
RUN mkdir -p $ROOT/dist && \
    mkdir -p $ROOT/src
COPY package.json $ROOT/src/

WORKDIR $ROOT/src
RUN npm install --loglevel=warn

# build & test
COPY . $ROOT/src/
RUN npm run build && npm run test

EXPOSE 80
EXPOSE 8888

# start sever
CMD ./run.sh