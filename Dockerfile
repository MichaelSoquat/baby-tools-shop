FROM python:3.10-alpine

ENV APP_PORT=8000;

WORKDIR /app

COPY . .

WORKDIR /app/babyshop_app

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

RUN python manage.py makemigrations && \
    python manage.py migrate && \
    python manage.py collectstatic --noinput

ARG DJANGO_SUPERUSER_USERNAME
ARG DJANGO_SUPERUSER_EMAIL
ARG DJANGO_SUPERUSER_PASSWORD
RUN python manage.py createsuperuser --noinput --username $DJANGO_SUPERUSER_USERNAME --email $DJANGO_SUPERUSER_EMAIL --password $DJANGO_SUPERUSER_PASSWORD

EXPOSE ${APP_PORT}
CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:${APP_PORT}"]