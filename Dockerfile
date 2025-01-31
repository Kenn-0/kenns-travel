FROM node:lts-alpine as build

WORKDIR /app
COPY package.json .

RUN yarn

COPY . .

RUN yarn build

FROM nginx:stable-alpine

COPY --from=build /app/build /usr/share/nginx/html
