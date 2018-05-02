FROM amazon/aws-eb-python:3.4.2-onbuild-3.5.1  

EXPOSE 8080  

RUN apt-get update &&\
	apt-get install -y software-properties-common vim &&\
	add-apt-repository ppa:jonathonf/python-3.6 &&\
	apt-get update &&\
	apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv &&\
	apt-get install -y git

ENV PYTHONPATH=/usr/lib/python3.6

# update pip
RUN python3.6 -m pip install pip --upgrade &&\
	python3.6 -m pip install wheel

WORKDIR /project

COPY requirements/requirements-prod.txt /project/
COPY requirements/requirements-dev.txt /project/

RUN pip install -r requirements-prod.txt

COPY portfolio_web /project/portfolio_web

ENV FLASK_APP=portfolio_web/portfolio.py

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

CMD python3.6 portfolio_web/portfolio.py