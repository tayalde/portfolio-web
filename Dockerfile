FROM ubuntu:latest  

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential

COPY . /app

WORKDIR /app

RUN pip install -r requirements/requirements-prod.txt

ENV FLASK_APP=portfolio_web/portfolio.py

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

CMD flask run