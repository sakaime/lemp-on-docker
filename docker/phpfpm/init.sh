#!/bin/bash

echo $(ip route | awk 'NR==1 {print $3}') host.docker.internal | sudo tee -a /etc/hosts
sudo rm sudo 2> /dev/null

php-fpm -F -R