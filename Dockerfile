FROM node:alpine as builder

WORKDIR /usr/apps/frontend

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/apps/frontend/build /usr/share/nginx/html
