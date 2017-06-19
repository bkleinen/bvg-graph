FROM ruby:2.4.1-alpine

ENV APP_HOME /usr/src/app

EXPOSE 3000

# from https://github.com/alim/alpine-rails
ENV BUILD_PACKAGES="curl-dev ruby-dev build-base bash" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev postgresql-dev" \
    RUBY_PACKAGES="ruby-json yaml nodejs"

# Update and install base packages and nokogiri gem that requires a
# native compilation
RUN apk update && \
    apk upgrade && \
    apk add --update\
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*


WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
ADD Gemfile.lock $APP_HOME/Gemfile.lock

RUN bundle config build.nokogiri --use-system-libraries && \
    bundle install && \
    bundle exec rails assets:precompile && \
    bundle clean
ADD . $APP_HOME
# CMD ["bundle", "exec", "rails", "server","--port", "80"]
