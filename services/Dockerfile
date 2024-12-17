FROM node:14-alpine AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .

# Multi stage file for Lowe image size
FROM node:14-alpine
WORKDIR /usr/src/app
COPY --from=build /usr/src/app . 
EXPOSE 3000
CMD [ "node", "app.js" ]
