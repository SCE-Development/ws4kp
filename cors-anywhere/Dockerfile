
FROM node:14.10.0-alpine

WORKDIR /app

COPY package.json ./

RUN npm install --production

COPY ./server.js .

EXPOSE 80

CMD [ "node", "./server.js" ]
