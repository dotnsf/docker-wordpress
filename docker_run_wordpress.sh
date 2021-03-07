#! /bin/bash


if [ $# -eq 0 ]; then
	echo "Usage: $0 [num]";
	exit 1
else
	NUM="${1:-1}"
	PORT=`expr $NUM \+ 8080`

	docker run --name wordpress"$NUM" --link mysql:mysql -e WORDPRESS_DB_HOST=mysql:3306 -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=root -e WORDPRESS_DB_NAME=wp"$NUM"db -d -p "$PORT":80 wordpress
fi

