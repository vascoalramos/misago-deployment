import os
import multiprocessing

# https://docs.gunicorn.org/en/latest/settings.html#settings

# Variables
NAME = os.environ.get("NAME")
DJANGO_WSGI_MODULE = os.environ.get("DJANGO_WSGI_MODULE")
DJANGO_SETTINGS_MODULE = os.environ.get("DJANGO_SETTINGS_MODULE")

# Config File
wsgi_app = f"{DJANGO_WSGI_MODULE}:application"

# Debugging
reload = os.environ.get("RELOAD", False)

# Logging
accesslog = os.environ.get("ACCESS_LOG_FILE", "-")
errorlog = os.environ.get("ERROR_LOG_FILE", "-")
loglevel = os.environ.get("LOG_LEVEL", "debug")

# Server Socket
bind = "0.0.0.0:8000"

# Worker Processes
workers = multiprocessing.cpu_count() * 2
worker_class = os.environ.get("WORKER_CLASS", "sync")
threads = multiprocessing.cpu_count() * 2
worker_connections = int(os.environ.get("WORKER_CONNECTIONS"))


def when_ready(_):
    print("Server is ready")
