FROM node:alpine

RUN apk add --no-cache bash curl

RUN mkdir -p /app
WORKDIR /app

COPY . /app
RUN npm install

CMD ./node_modules/.bin/bats wait-for-healthy.bats
