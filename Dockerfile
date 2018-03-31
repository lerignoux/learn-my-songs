FROM ruby:alpine

MAINTAINER Erignoux Laurent <lerignoux@gmail.com>

RUN apk add --update build-base sqlite-dev nodejs tzdata && rm -rf /var/cache/apk/*

RUN gem install bundler

# First copy the bundle files and install gems to aid caching of this layer
WORKDIR /app
COPY Gemfile* /app/
RUN bundle install

WORKDIR /app

COPY . /app

ENTRYPOINT "./entrypoint.sh"
