# FROM node:alpine

# WORKDIR /usr/app

# COPY . .

# RUN apk add --no-cache git

# RUN git pull

# RUN npm install

# RUN npm run build

# EXPOSE 3000

# CMD ["node", "index.js"]

# Use uma imagem leve do Node.js como base
FROM node:alpine

# Defina o diretório de trabalho dentro da imagem
WORKDIR /usr/app

# Copie o código da aplicação para o diretório de trabalho
COPY . .

# Instale as dependências e faça o build da aplicação
RUN apk add --no-cache git
RUN npm install
RUN npm run build

# Use uma imagem MySQL existente
FROM mysql:latest

# Copie o arquivo de configuração para a inicialização do banco de dados
COPY mysql_config.sql /docker-entrypoint-initdb.d/

# Exponha a porta da aplicação (se necessário)
EXPOSE 3000

# Retorne ao diretório de trabalho da aplicação
WORKDIR /usr/app

# CMD para iniciar a aplicação
CMD ["node", "index.js"]