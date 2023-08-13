FROM ruby:3.2.2-alpine

ARG WORKDIR
ARG RUNTIME_PACKAGES="nodejs tzdata postgresql-dev postgresql git"
ARG DEV_PACKAGES="build-base curl-dev"

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

WORKDIR ${HOME}

COPY Gemfile* ./

RUN apk add --no-cache ${RUNTIME_PACKAGES} \
    # nokogiri requires gcompat for compatibility reasons on Alpine
    gcompat \
    # Using virtual package for temporary development packages
    && apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} \
    && bundle install -j4 \
    && apk del build-dependencies

COPY . .
