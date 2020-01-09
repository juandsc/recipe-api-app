FROM python:3.7-alpine
LABEL maintainer="juansanchezc89@gmail.com"

ENV PYTHONUNBUFFERED 1

# Copy dependencies
COPY ./requirements.txt /requirements.txt

# Setup directory structure
RUN mkdir /app
WORKDIR /app
COPY ./app/ /app

RUN apk add --update --no-cache postgresql-client \
    && apk add --update --no-cache --virtual \
        .tmp-build-deps gcc libc-dev linux-headers postgresql-dev \
    && pip install -r /requirements.txt \
    && apk del .tmp-build-deps \
    && adduser -D user

USER user