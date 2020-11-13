FROM ubuntu:bionic

EXPOSE 8000/tcp

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y vim libffi-dev libssl-dev sqlite3 libjpeg-dev libopenjp2-7-dev locales cron postgresql-client gettext python3-pip
RUN pip3 install --upgrade pip

COPY ./misago/ /opt/misago

WORKDIR /opt/misago
RUN pip3 install -r requirements.txt
RUN pip3 install -r requirements-plugins.txt
