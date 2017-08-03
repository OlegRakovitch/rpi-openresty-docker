FROM hypriot/rpi-alpine:3.5

ARG VERSION

RUN apk add --no-cache alpine-sdk readline-dev pcre-dev openssl-dev perl ncurses-dev && \
    curl -O https://openresty.org/download/openresty-$VERSION.tar.gz && \
    tar xzvf openresty-$VERSION.tar.gz && \
    rm openresty-$VERSION.tar.gz && \
    cd openresty-$VERSION && \
    ./configure && \
    make && \
    make install && \
    cd / && \
    rm -rf openresty-$VERSION && \
    apk del alpine-sdk

ENV PATH "/usr/local/openresty/nginx/sbin:${PATH}"

COPY nginx.conf /app/conf/nginx.conf

RUN mkdir /app/logs

ENTRYPOINT [ "nginx", "-p", "/app/", "-c", "conf/nginx.conf" ]

