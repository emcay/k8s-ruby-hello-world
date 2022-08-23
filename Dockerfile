FROM ruby:3.0.2-alpine3.14

WORKDIR /opt/app

ADD . /opt/app

# Appdir and dependencies
RUN mkdir -p /opt/app && \
apk add make gcc libc-dev sqlite-dev && \
gem install bundler:2.3.20 && \
bundle install

CMD ["/opt/app/bin/start.sh"]
