FROM klakegg/hugo:alpine AS builder

WORKDIR /src
COPY . .
RUN hugo

FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
