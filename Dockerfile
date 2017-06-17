FROM ruby:2.4-alpine

ENV APP_HOME /usr/src/app

EXPOSE 3000

RUN set -ex \
  && apk add --no-cache libpq nodejs bash postgresql-dev \
  && apk del .builddeps

WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
ADD Gemfile.lock $APP_HOME//Gemfile.lock
RUN bundle install
ADD . $APP_HOME

# CMD ["bundle", "exec", "rails", "server","--port", "80"]
