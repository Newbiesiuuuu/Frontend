FROM node:16-alpine as build

WORKDIR /app

COPY . .

RUN yarn install

RUN yarn build

## copy to nginx
FROM nginx:latest

COPY --from=build /app/dist /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 3000
