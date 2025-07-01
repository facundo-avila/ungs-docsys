FROM node:20

# Directorio de trabajo dentro del container
WORKDIR /app

COPY package*.json ./

RUN npm install --production=false

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start:prod"]
