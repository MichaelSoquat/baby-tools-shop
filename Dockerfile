FROM python:3.10-alpine

ARG DJANGO_SUPERUSER_USERNAME
ARG DJANGO_SUPERUSER_EMAIL
ARG DJANGO_SUPERUSER_PASSWORD

ENV APP_PORT=8000;

WORKDIR /app

COPY . .

WORKDIR /app/babyshop_app

ARG DJANGO_SUPERUSER_USERNAME
ARG DJANGO_SUPERUSER_EMAIL
ARG DJANGO_SUPERUSER_PASSWORD

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

RUN python manage.py makemigrations && \
    python manage.py migrate && \
    python manage.py collectstatic --noinput && \
    python manage.py createsuperuser --noinput --username $DJANGO_SUPERUSER_USERNAME --email $DJANGO_SUPERUSER_EMAIL

ENV APP_PORT=8000

EXPOSE ${APP_PORT}
CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:${APP_PORT}"]