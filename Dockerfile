# FROM node:alpine

# WORKDIR /usr/app

# COPY . .

# RUN apk add --no-cache git

# RUN git pull

# RUN npm install

# RUN npm run build

# EXPOSE 3000

# CMD ["node", "index.js"]

# Stage 1: Construa a aplicação Node.js
FROM node:alpine as builder

WORKDIR /usr/app

COPY . .

RUN apk add --no-cache git
RUN npm install
RUN npm run build

# Stage 2: Configuração do MySQL
FROM mysql:5.7

WORKDIR /docker-entrypoint-initdb.d

COPY mysql_config.sql .

# Stage 3: Imagem final
FROM node:alpine

WORKDIR /usr/app

COPY --from=builder /usr/app .

# Exponha a porta da aplicação
EXPOSE 3000

# CMD para iniciar a aplicação
CMD ["node", "index.js"]