from celery import shared_task

import datetime



@shared_task
def hello():
    now = datetime.datetime.now()
    current_time_str = now.strftime('%Y-%m-%d %H:%M:%S')
    print(current_time_str)
    with open('example.txt', 'a') as file:
        file.write(f'Current Date and Time: {current_time_str}\n')
