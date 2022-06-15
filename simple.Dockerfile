FROM node:14-alpine as builder

WORKDIR /code

ADD . /code

RUN yarn && npm run build

FROM nginx:alpine
COPY --from=builder code/build /usr/share/nginx/html