#!/bin/bash

# Start Celery worker in the background
celery -A core worker --beat --loglevel=info &

# Get the port from the environment variable
PORT=${PORT}

echo $PORT

# Start Django development server with the specified port
exec python manage.py runserver 0.0.0.0:$PORT