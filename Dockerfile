FROM ghcr.io/gohugoio/hugo:v0.165.0 AS builder

WORKDIR /app

COPY . .
RUN hugo build

FROM nginx:alpine

COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 80

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
