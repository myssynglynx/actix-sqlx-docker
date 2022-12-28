FROM node:16 AS runtime

WORKDIR /usr/src/app
COPY package.json yarn.lock .

RUN yarn install --frozen-lockfile
COPY . .
