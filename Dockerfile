FROM ruby:3.1.2

ARG RAILS_DIR=/task-app
WORKDIR $RAILS_DIR

RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  mariadb-client \
  default-mysql-client \
  cron \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

ENV RAILS_LOG_TO_STDOUT true

RUN echo $PWD
COPY . .

RUN bundle config --global frozen 1
RUN gem install bundler:2.4.17
RUN bundle config set --local without 'development test' && bundle install

RUN yarn install
#RUN yarn build
RUN yarn build:css #for some reason, yarn build:css is not being called from asset:precompile, but yarn build is
RUN bundle exec rake assets:precompile --trace

ENV PATH="${PATH}:/home/ruby/.local/bin"

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
