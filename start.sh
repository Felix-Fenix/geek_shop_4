#!/usr/bin/env bash

export EMAIL_HOST_USER="merkava2016@bk.ru"
export EMAIL_HOST_PASSWORD="9SkY6Vrt36SFMgPsdBvU"
export DJANGO_PRODUCTION=1
export DOMAIN="http://10.8.0.46"
export CLIENT_ID="5c0bf55af4365cc1606c"
export CLIENT_SECRET="c2df30fee0eeb6251b5c1e50ca4064a932895fa9"

sudo apt update && sudo apt upgrade -y

#sudo apt --fix-broken install -y
#useradd -g www-data -m django
sudo groupadd www-data
sudo apt install git
git clone https://github.com/Felix-Fenix/geek_shop_4.git -b lesson_14

sudo chown -R fenix:www-data /home/fenix/geek_shop_4
sudo apt install -y python3-venv
python3 -m venv /home/fenix/venv
source venv/bin/activate
pip install -U pip
pip install -r /home/fenix/geek_shop_4/requirements.txt
# shellcheck disable=SC2225
sudo cp /home/fenix/geek_shop_4/gunicorn.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable gunicorn
sudo systemctl start gunicorn
sudo systemctl status gunicorn

sudo apt install -y nginx
sudo cp /home/fenix/geek_shop_4/geekshop_nginx /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/geekshop_nginx /etc/nginx/sites-enabled/geekshop_nginx
# Перезапускаем nginx
sudo systemctl restart nginx
sudo systemctl status nginx

#export DOMAIN="https://test-nginx.vpnforall.su"
python /home/fenix/geek_shop_4/manage.py migrate
reboot