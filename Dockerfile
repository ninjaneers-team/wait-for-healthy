FROM node:alpine

RUN apk add --no-cache bash curl

RUN wget -qO- "https://storage.googleapis.com/shellcheck/shellcheck-stable.linux.x86_64.tar.xz" | tar -xJv
RUN mv shellcheck-stable/shellcheck /usr/bin/

RUN mkdir -p /app
WORKDIR /app

COPY . /app
RUN npm install

CMD shellcheck ./wait-for-healthy && ./node_modules/.bin/bats wait-for-healthy.bats
