FROM mhart/alpine-node:latest

RUN apk update && apk upgrade && \
    npm install --global speed-test && \
    \
    apk add --no-cache tini ca-certificates tzdata && \
    cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime &&\
    echo "Europe/Amsterdam" > /etc/timezone &&\
    apk del tzdata && \
        rm -rf /var/cache/apk/*

ENTRYPOINT ["/sbin/tini", "--", "speed-test", "-v"]