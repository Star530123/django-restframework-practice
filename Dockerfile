FROM python:3.7-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apk update
    RUN apk add --virtual build-deps gcc python3-dev musl-dev 
    RUN apk add --no-cache mariadb-dev

RUN pip install mysqlclient  

RUN apk del build-deps

RUN mkdir /app
WORKDIR /app

COPY ./app/requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

CMD ["python", "manage.py", "runserver", "0.0.0.0:9000"]