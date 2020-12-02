FROM python:3.7

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y vim libffi-dev libssl-dev sqlite3 libjpeg-dev libopenjp2-7-dev locales cron postgresql-client gettext python3-pip
RUN pip3 install --upgrade pip

ADD ./misago/ /opt/misago
WORKDIR /opt/misago

RUN pip3 install -r requirements.txt
RUN pip3 install -r requirements-plugins.txt

EXPOSE 8000

ADD ./deployment/docker/misago/entrypoint.sh ./
ADD ./deployment/docker/misago/gunicorn.conf.py ./

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]