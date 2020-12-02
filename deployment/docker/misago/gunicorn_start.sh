#!/bin/bash


export PROJECT_DIR="/home/attendances_DETI/attendances"

export DJANGO_DIR="${PROJECT_DIR}/rest"

export LOGS_DIR="/home/attendances_DETI/logs"

export GUNICORN_LOG_PATH="${LOGS_DIR}/gunicorn"

export ACCESS_LOG_FILE="${GUNICORN_LOG_PATH}/access.log"

export ERROR_LOG_FILE="${GUNICORN_LOG_PATH}/error.log"

export DEPLOYMENT_PATH="${PROJECT_DIR}/deployment/gunicorn"

export PRODUCTION=true

gunicorn ${DJANGO_WSGI_MODULE}:application --config "gunicorn.conf.py"
