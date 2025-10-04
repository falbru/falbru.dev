FROM hugomods/hugo:latest AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

FROM caddy:2-alpine
COPY --from=builder /src/public /usr/share/caddy
