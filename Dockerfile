FROM python:3.7-alpine

ENV PYTHONBUFFERED 1

RUN apk update
    RUN apk add --virtual build-deps gcc python3-dev musl-dev 
    RUN apk add --no-cache mariadb-dev

RUN pip install mysqlclient  

RUN apk del build-deps

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY . /app

CMD ["python", "manage.py", "runserver", "0.0.0.0:9000"]