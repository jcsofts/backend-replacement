FROM python:3.6-stretch

RUN groupadd app && useradd -m app -g app -s /bin/bash
WORKDIR /usr/src/app

RUN apt-get update && \ 
  apt-get install -y gcc python3-dev build-essential libffi-dev postgresql && \
  apt-get install -y libstdc++



COPY ./requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get -y autoclean

COPY . /usr/src/app
RUN chown -R app:app /usr/src/app

USER app
ENV PYTHONUNBUFFERED=1
EXPOSE 8080
