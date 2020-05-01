#add tag builder
FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#resulting folder is /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

#default command for nginx container starts nginx automatically

