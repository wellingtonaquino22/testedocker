# FROM node:alpine

# WORKDIR /usr/app

# COPY . .

# RUN apk add --no-cache git

# RUN git pull

# RUN npm install

# RUN npm run build

# EXPOSE 3000

# CMD ["node", "index.js"]

# FROM node:alpine

# WORKDIR /usr/app

# COPY . .

# RUN apk add --no-cache git

# RUN git pull

# RUN npm install

# RUN npm run build

# EXPOSE 3000

# CMD ["node", "index.js"]

FROM node:alpine

WORKDIR /usr/app

# Copie o código da aplicação
COPY . .

# Instale as dependências e faça o build
RUN apk add --no-cache git
RUN git pull
RUN npm install
RUN npm run build

# Instale o MySQL e configure
RUN apk add --no-cache mysql mysql-client
COPY mysql_config.sql /docker-entrypoint-initdb.d/

# Exponha a porta da aplicação
EXPOSE 3000

# CMD para iniciar a aplicação
CMD ["node", "index.js"] 