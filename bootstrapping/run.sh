#!/bin/bash

docker run --name wordpressdb -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wordpress -d mysql:5.7

docker build -t phpwithmysql:v2 .

docker run --name wordpress -P --link wordpressdb:mysql -v "$PWD/":/var/www/html phpwithmysql

# open http://192.168.99.100:32770/

# modify wp-config.php
# define('WP_HOME',$_SERVER['SERVER_ADDR']);
# define('WP_SITEURL',$_SERVER['SERVER_ADDR']);