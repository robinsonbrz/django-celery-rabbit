#!/bin/bash

# Start Celery worker in the background
celery -A core worker --beat --loglevel=info &

# Start Django development server
exec python manage.py runserver 0.0.0.0:8000