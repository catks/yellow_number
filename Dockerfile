FROM ruby:2.5.1-alpine3.7

ENV BUILD_PACKAGES tzdata linux-headers build-base libffi libffi-dev gcc libc-dev make

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/*

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

VOLUME /bundle

WORKDIR /usr/src/app

RUN gem install bundler

COPY Gemfile Gemfile.lock ./

# RUN bundle config build.ffi --use-system-libraries

RUN bundle install

COPY . .

CMD bundle exec bin/yellow_number
