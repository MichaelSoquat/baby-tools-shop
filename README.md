# E-Commerce Project For Baby Tools

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

Clone the git repo with `git clone <path>`
Install docker with `sudo apt-get install docker-ce`

Restart the sockets `sudo systemctl enable docker.socket`
`sudo systemctl start docker.socket`
Install python: sudo apt-get install python3 python3-pip
sudo apt install python3-venv
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser

docker build --build-arg BASE_IMAGE=python:3.10-alpine --build-arg APP_PORT=8000 --build-arg APP_ENV=production -t baby-tools-shop .
docker run -it --rm -p 8025:8000 baby-tools-shop
docker run -d --name baby-tools-shop -p ${HOST_PORT:-8025}:${APP_PORT:-8000} -v baby-tools-shop-data:/app -e APP_PORT=${APP_PORT:-8000} -e APP_ENV=${APP_ENV:-production} --restart unless-stopped baby-tools-shop

Move to directory with cd baby-tools-shop
With ls -la you see all files







Install packages: sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
Add GPG key: curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
Add docker repo: sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
Statuscheck: sudo systemctl status docker


