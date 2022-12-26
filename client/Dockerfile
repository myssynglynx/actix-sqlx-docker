FROM node:16 AS development

WORKDIR /usr/src/app
COPY package.json yarn.lock .

RUN yarn install --frozen-lockfile
COPY . .
