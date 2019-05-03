FROM node:10-alpine

ENV HUGO_VERSION=0.55.5

RUN apk --no-cache add --virtual .build-dependencies curl

RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | tar -xzf - hugo &&\
  chmod +x hugo &&\
  mv hugo /usr/local/bin/

RUN npm install -g firebase-tools

RUN npm uninstall -g yarn npm

RUN apk del .build-dependencies