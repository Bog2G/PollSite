FROM ruby:3.1.3

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
    build-essential \
    nodejs \
    yarn
ADD . /poll_site
WORKDIR /poll_site
RUN bundle install

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true

EXPOSE 3000
CMD ["bash"]
