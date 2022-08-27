#!/usr/bin/env bash


sudo apt update && sudo apt upgrade -y
sudo apt-get install python3-dev -y

sudo apt --fix-broken install -y
useradd -g www-data -m django

sudo apt install git
git clone https://github.com/Felix-Fenix/geek_shop_4.git

