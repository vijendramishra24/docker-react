FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build : all stuff that is requred

FROM nginx
COPY --from=builder /app/build usr/share/nginx/html
#efault command of nginx is "start"