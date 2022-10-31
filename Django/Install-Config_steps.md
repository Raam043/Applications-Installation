#Django applicatoion installation on Ubuntu

Release Ubuntu instance and connect into server using ssh 22

Commands to install - pythom / django
```sh
sudo apt update
sudo apt upgrade -y
sudo apt install python3-pip -y
python3 -m pip install --upgrade pip
pip install django==3.2
apt install python3.10-venv -y
```



verify the versions for confimation of installation
```sh
python3 --version
pip --version
django-admin --version
```

Make project folder and configure the App
```sh
mkdir Ramesh
cd Ramesh
python3 -m venv ramesh_env
cd ramesh_env
django-admin startproject New_Project
cd New_Project
django-admin startapp DemoApp
vi New_Project/settings.py
```
Allowed hosts ['*'] add '*' into the bracket - save & exit


python3 manage.py runserver 0.0.0.0:8000

for the results> open the new tab and paste the public IP : 8000
