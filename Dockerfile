FROM python:3.7-alpine
LABEL maintainer="juansanchezc89@gmail.com"

ENV PYTHONUNBUFFERED 1

# Copy dependencies
COPY ./requirements.txt /requirements.txt

# Setup directory structure
RUN mkdir /app
WORKDIR /app
COPY ./app/ /app

RUN pip install -r /requirements.txt \
    && adduser -D user

USER user