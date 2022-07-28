FROM ruby:3.0.3-alpine

ENV BUNDLE_WITHOUT production:staging:test
ENV BUNDLE_PATH /app/vendor/bundle
ENV BUNDLE_BIN /app/vendor/bundle/bin
ENV BUNDLE_DEPLOYMENT 1

ENV PATH /app/vendor/bundle/bin:$PATH

ENV RAILS_ENV development

RUN apk --update add --no-cache --virtual run-dependencies bash build-base git cmake make nodejs
RUN apk add --no-cache sqlite-dev
RUN mkdir -p /var/app

RUN gem install bundler:2.2.33

COPY Gemfile /var/app
COPY Gemfile.lock /var/app
WORKDIR /var/app

RUN bundle install
RUN gem install foreman

COPY . /var/app

EXPOSE 80
EXPOSE 3000

CMD foreman run $PROCESS_NAME
