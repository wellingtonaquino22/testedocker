FROM node:alpine

WORKDIR /usr/app

COPY . .

RUN apk add --no-cache git

RUN git pull

RUN npm install

RUN npm run build

EXPOSE 3000

CMD ["node", "index.js"]

