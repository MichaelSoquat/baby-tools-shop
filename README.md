# E-Commerce Project For Baby Tools

### Table of contents

1. Technologies
2. Hints
3. Photos
4. Quickstart
5. Details

### TECHNOLOGIES

- Python 3.9
- Django 4.0.2
- Venv

### Hints

This section will cover some hot tips when trying to interacting with this repository:

- Settings & Configuration for Django can be found in `babyshop_app/babyshop/settings.py`
- Routing: Routing information, such as available routes can be found from any `urls.py` file in `babyshop_app` and corresponding subdirectories

### Photos

##### Home Page with login

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080815407.jpg"></img>
##### Home Page with filter
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080840305.jpg"></img>
##### Product Detail Page
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080934541.jpg"></img>

##### Home Page with no login
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080953570.jpg"></img>


##### Register Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081016022.jpg"></img>


##### Login Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081044867.jpg"></img>

### Quickstart

1. Clone the git repo with `git clone <path>`
2. Install docker with `sudo apt-get install docker-ce`
3. Restart the sockets `sudo systemctl enable docker.socket` and `sudo systemctl start docker.socket`
4. Install python: `sudo apt-get install python3 python3-pip`
5. Create an environment and activate it: `sudo apt install python3-venv` `python3 -m venv env` `source env/bin/activate`
6. Install requirements: `pip install -r requirements.txt`
7. Make migrations: `python manage.py makemigrations`
8. Migrate: `python manage.py migrate`
9. Go to `settings.py` and change `DEBUG` to `False` and enter `ALLOWED_HOSTS` LIKE `['IP_ADDRESS']`
10. Build docker image: ```
    docker build
    --build-arg DJANGO_SUPERUSER_USERNAME=<your-username> \
    --build-arg DJANGO_SUPERUSER_EMAIL=<your-username> \
    --build-arg DJANGO_SUPERUSER_PASSWORD=<your-password> \
    -t babyshop:<your-tag> .
    ```
11. Run docker: ```
    docker run -d --name babyshop \
    -p 8025:8000 \s
    -v babyshop_media:/app/babyshop_app/media \
    -v babyshop_static:/app/babyshop_app/static \
    --restart on-failure \
    babyshop:<your-tag>
    ```
12. Create a superuser in container
    ```
    docker exec -it <container-id> bash
    ```

  

### Details

1. If you have problems to install docker you can try these steps:

  ```
  Install packages: sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
  Add GPG key: curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  Add docker repo: sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  Statuscheck: sudo systemctl status docker
  ```

3. Make migrations: This command looks at the changes in your models (the structure of your database) and creates new migration files in the migrations directory. These files are used to apply changes to your database schema
4. Migrate: This command applies the migration files created by makemigrations to your database, updating the schema and ensuring it matches your models. This step is crucial for synchronizing your database with your Django application
5. Settings.py explanation: 
- Setting DEBUG to False ensures that detailed error messages are not displayed to users in a production environment, which is important for security
- The ALLOWED_HOSTS setting specifies a list of strings representing the host/domain names that your Django site can serve. This prevents HTTP Host header attacks
6. Build docker image: This command builds a Docker image named baby-tools-shop using the Dockerfile in the current directory. The --build-arg options are used to pass arguments to the Docker build process, allowing you to specify the base image (python:3.10-alpine), the application port (8000), and the environment (production)
7. Run docker:
- ```
- `-d` runs the container in detached mode, meaning it runs in the background
- `--name baby-tools-shop` gives the container a specific name
- `-p ${HOST_PORT:-8025}:${APP_PORT:-8000}` maps the host port (HOST_PORT with a default of 8025) to the container port (APP_PORT with a default of 8000)
- `-v babyshop_media:/app/babyshop_app/media \ and -v babyshop_static:/app/babyshop_app/static \` mounts a volume to the container. This is used for persistent data storage
- `-e APP_PORT=${APP_PORT:-8000}` and `-e APP_ENV=${APP_ENV:-production}` set environment variables within the container
- `--restart unless-stopped` ensures the container restarts automatically unless it is explicitly stopped
- `baby-tools-shop` specifies the image to use for the container
- ```
1. With `docker ps` you see the list of all docker containers running. With `docker stop <container-id>` you can stop the container
2. Createsuperuser:
    ```
    docker exec -it <container-id> bash

    # docker exec    - you can run commands inside your container
    # -it            - interact with the cli
    # <container-id> - container id you want to speak to
    # bash           - shell
    ```
