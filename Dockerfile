FROM ruby:2.6.3
ENV LANG C.UTF-8
WORKDIR /tmp
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt update && apt install -y \
    build-essential \
    libnss3 \
    unzip \
    nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    gem install bundler

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install --jobs=4 --no-cache


RUN mkdir -p /usr/src/app 
WORKDIR /usr/src/app

EXPOSE 3000
