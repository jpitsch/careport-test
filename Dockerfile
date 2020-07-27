FROM ruby:2.6.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y \
  nodejs \
  yarn \
  postgresql-client \
  vim

RUN mkdir /app
WORKDIR /app

RUN gem install bundler:2.1.4
COPY Gemfile Gemfile.lock /app/
RUN bundle install --jobs=4

COPY . /app

COPY yarn.lock package.json /app/
RUN yarn install --pure-lockfile

RUN useradd -m app \
  && chown -R app /app \
  && chown -R app /usr/local/bundle

USER app
