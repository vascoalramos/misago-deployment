import os
import multiprocessing

# https://docs.gunicorn.org/en/latest/settings.html#settings

# Variables
DJANGO_WSGI_MODULE = os.environ.get("DJANGO_WSGI_MODULE")
DJANGO_SETTINGS_MODULE = os.environ.get("DJANGO_SETTINGS_MODULE")

# Config File
wsgi_app = f"{DJANGO_WSGI_MODULE}:application"

# Debugging
reload = os.environ.get("RELOAD", False)

# Logging
access_log_format = "Host:%(h)s %(l)s Username:%(u)s DateOfRequest:%(t)s Method:%(m)s Status:%(s)s URL:%(U)s ReponseLength:%(B)s Agent:%(a)s  ResponseHeader:%({server-timing}o)s"
accesslog = os.environ.get("ACCESS_LOG_FILE", "-")
errorlog = os.environ.get("ERROR_LOG_FILE", "-")
loglevel = os.environ.get("LOG_LEVEL", "debug")

# Server Socket
bind = "0.0.0.0:80"

# Worker Processes
workers = multiprocessing.cpu_count() * 2 + 1
worker_class = os.environ.get("WORKER_CLASS", "sync")
threads = multiprocessing.cpu_count() * 2 + 1
worker_connections = int(os.environ.get("WORKER_CONNECTIONS", "1000"))


def when_ready(_):
    print("Server is ready")
