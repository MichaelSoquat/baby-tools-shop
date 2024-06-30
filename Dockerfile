ARG BASE_IMAGE=python:3.10-alpine
ARG APP_PORT=8000
ARG APP_ENV=production

FROM ${BASE_IMAGE}

# Set environment variables
ENV APP_PORT=${APP_PORT}
ENV APP_ENV=${APP_ENV}

ENV DJANGO_SUPERUSER_PASSWORD=admin
ENV DJANGO_SUPERUSER_EMAIL=admin@admin.com
ENV DJANGO_SUPERUSER_USERNAME=admin

# Set working directory
WORKDIR /app

# Copy all files to the container
COPY . .

# Set working directory for the Django application
WORKDIR /app/babyshop_app

# Install dependencies
RUN pip install -r requirements.txt

# Run Django management commands
RUN python manage.py makemigrations && \
    python manage.py migrate && \
    python manage.py collectstatic --noinput

# Create superuser using environment variables
RUN sh -c "python manage.py createsuperuser --noinput --username $DJANGO_SUPERUSER_USERNAME --email $DJANGO_SUPERUSER_EMAIL"

# Expose the port
EXPOSE ${APP_PORT}

# Use a shell to run the command to enable variable substitution
CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:8000"]