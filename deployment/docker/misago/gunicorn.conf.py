import os
import multiprocessing

# https://docs.gunicorn.org/en/latest/settings.html#settings

# Variables
HOME = os.environ.get("HOME")
USER = os.environ.get("USER")
DJANGO_WSGI_MODULE = os.environ.get("DJANGO_WSGI_MODULE", "devproject.wsgi")
DJANGO_SETTINGS_MODULE = os.environ.get("DJANGO_SETTINGS_MODULE", "devproject.settings")
NAME = os.environ.get("NAME", "Misago")  #
PROJECT_DIR = os.environ.get("PROJECT_DIR", f"{HOME}/Desktop/attendances")
DJANGO_DIR = os.environ.get("DJANGO_DIR", f"{PROJECT_DIR}/rest")
SOCK_FILE = os.environ.get("SOCK_FILE", f"{HOME}/misago/run/gunicorn.sock")
PYTHON_PATH = os.environ.get("PYTHONPATH")

# Config File
wsgi_app = f"{DJANGO_WSGI_MODULE}:application"

# Debugging
reload = os.environ.get("RELOAD", False)

# Logging
accesslog = os.environ.get("ACCESS_LOG_FILE", "-")
errorlog = os.environ.get("ERROR_LOG_FILE", "-")
loglevel = os.environ.get("LOG_LEVEL", "debug")

# Server Mechanics
preload_app = os.environ.get("PRELOAD_APP", True)
daemon = os.environ.get("DAEMON", True)
# user = os.environ.get("USER", USER)
# group = user
pythonpath = f"{DJANGO_DIR}:{PYTHON_PATH}"

# Server Socket
bind = f"unix:{SOCK_FILE}"

# Worker Processes
workers = multiprocessing.cpu_count() * 2
worker_class = os.environ.get("WORKER_CLASS", "sync")
threads = multiprocessing.cpu_count() * 2
worker_connections = int(os.environ.get("WORKER_CONNECTIONS", "1000"))


def when_ready(_):
    print("Server is ready")
