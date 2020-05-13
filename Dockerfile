#build stage
FROM node:alpine as builder
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . .
RUN npm run build 

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

