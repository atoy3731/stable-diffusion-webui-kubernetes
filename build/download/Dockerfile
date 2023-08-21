FROM bash:alpine3.15

RUN apk add parallel aria2
COPY . /docker
RUN chmod +x /docker/download.sh; chmod +x /docker/init.sh
RUN /docker/download.sh
ENTRYPOINT ["/docker/init.sh"]