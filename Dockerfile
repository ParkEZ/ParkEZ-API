FROM ruby:2.4-alpine

RUN apk add --update --no-cache \
  yarn \
  gosu \
  bash \
  curl \
  openssl \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  python \
  perl \
  git \
  tzdata \
  --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
  --repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
  && addgroup parkez \
  && adduser -s /bin/bash -D -G parkez parkez
RUN wget https://github.com/jwilder/dockerize/releases/download/v0.2.0/dockerize-linux-amd64-v0.2.0.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.2.0.tar.gz
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD . /app
RUN bundle config build.nokogiri --use-system-libraries \
&& bundle config git.allow_insecure true \
&& bundle install

EXPOSE 3000

CMD ["gosu", "parkez", "dockerize", "-wait", "tcp://db:5432", "bundle", "exec", "rails", "s"]
