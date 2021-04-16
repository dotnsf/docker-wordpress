#! /bin/bash

docker network create my-wp-network

docker run --name mysql --network my-wp-network -e MYSQL_ROOT_PASSWORD=root -d linuxserver/mariadb

docker run --name nginx --network my-wp-network -v `pwd`/nginx:/etc/nginx/conf.d -d -p 80:80 nginx

