FROM node:14-alpine

WORKDIR /code

ADD . /code

RUN yarn && npm run build

CMD npm serve -s build

EXPOSE 3000