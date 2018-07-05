FROM ruby:2.4.4

RUN apt-get update && \
    apt-get install -y build-essential nodejs

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

ENV RAILS_ENV production
COPY . .

ENTRYPOINT ["rake"]