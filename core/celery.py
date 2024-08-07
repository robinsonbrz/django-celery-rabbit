import os
from celery import Celery
from celery.schedules import crontab


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'core.settings')

app = Celery('core')

app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()

# Schedule the task to run every minute
app.conf.beat_schedule = {
    'my_periodic_task': {
        'task':  'agendadas.tasks.hello',
        'schedule': 5.0, # Every 5 seconds
    },
}