#! /bin/bash


if [ $# -eq 0 ]; then
	echo "Usage: $0 [num] [servername]";
	exit 1
else
	NUM="${1:-1}"
	PORT=`expr $NUM \+ 8080`
	SERVERNAME="wp$NUM.mydockernet.local"
    if [ $# -gt 1 ]; then
		SERVERNAME="${2}"
    fi

	mkdir ./www/"$SERVERNAME"

	docker run --name "$SERVERNAME" --network my-wp-network -v `pwd`/www/"$SERVERNAME":/var/www/html --link mysql:mysql -e WORDPRESS_DB_HOST=mysql:3306 -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=root -e WORDPRESS_DB_NAME=wp"$NUM"db -d -p "$PORT":80 wordpress

	echo "server{ listen 80; server_name $SERVERNAME; location / { proxy_pass http://$SERVERNAME; proxy_redirect default; } }" > ./nginx/wp"$NUM".conf

	docker restart nginx
fi

