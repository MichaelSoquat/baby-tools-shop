ARG BASE_IMAGE=python:3.10-alpine
ARG APP_PORT=8000
ARG APP_ENV=production

FROM ${BASE_IMAGE}

ENV APP_PORT=${APP_PORT}
ENV APP_ENV=${APP_ENV}

WORKDIR /app

COPY . .

# Go to django app directory
WORKDIR /app/babyshop_app

RUN pip install -r requirements.txt

EXPOSE ${APP_PORT}

CMD ["sh", "-c", "python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:${APP_PORT}"]
