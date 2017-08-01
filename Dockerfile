FROM alpine:latest
RUN apk add --update --no-cache                \
    python3 docker inotify-tools               \
    bash py-pip git openssh                     &&\
    pip install 'docker-compose==1.8.0'
ENTRYPOINT ["/builder/builder"]
