#add tag builder
FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#resulting folder is /app/build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

#default command for nginx container starts nginx automatically

