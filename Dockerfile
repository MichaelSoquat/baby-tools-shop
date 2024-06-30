ARG BASE_IMAGE=python:3.10-alpine
ARG APP_PORT=8000
ARG APP_ENV=production

FROM ${BASE_IMAGE}

ENV APP_PORT=${APP_PORT}
ENV APP_ENV=${APP_ENV}

ENV DJANGO_SUPERUSER_PASSWORD=admin
ENV DJANGO_SUPERUSER_EMAIL=admin@admin.com
ENV DJANGO_SUPERUSER_USERNAME=admin

WORKDIR /app

COPY . .

WORKDIR /app/babyshop_app

RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py createsuperuser \
    --noinput \
    --username $DJANGO_SUPERUSER_USERNAME \
    --email $DJANGO_SUPERUSER_EMAIL

EXPOSE ${APP_PORT}

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
