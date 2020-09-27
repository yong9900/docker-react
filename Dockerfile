FROM node:alpine as builds

WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builds /app/build /usr/share/nginx/html

