# syntax=docker/dockerfile:1

FROM node:18-alpine

ARG APP_PORT

ENV NODE_ENV=production
ENV APP_PORT_NUMBER ${APP_PORT}

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --omit=dev

COPY . .

EXPOSE ${APP_PORT_NUMBER}
CMD [ "node", "index.js" ]
