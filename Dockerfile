FROM node:alpinr as builder
WORKDIR '/app'
COPY package.json
RUN npm install
COPY . .
RUN npm run builde

FROM nginx
COPY --from=builder /app/build /usr/share/nginx