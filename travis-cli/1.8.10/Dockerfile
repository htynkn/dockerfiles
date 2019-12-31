FROM ruby:alpine
RUN apk add --no-cache build-base git && \
    gem install travis -v 1.8.10 --no-rdoc --no-ri && \
    apk del build-base