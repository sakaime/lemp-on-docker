#!/bin/bash

echo $(ip route | awk 'NR==1 {print $3}') host.docker.internal >> /etc/hosts

php-fpm -F -R