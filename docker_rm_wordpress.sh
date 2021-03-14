#! /bin/bash


if [ $# -eq 0 ]; then
	echo "Usage: $0 [num] [servername]";
	exit 1
else
	NUM="${1:-1}"
	SERVERNAME="wp$NUM.mydockernet.local"
    if [ $# -gt 1 ]; then
		SERVERNAME="${2}"
    fi

        docker stop "$SERVERNAME"
	docker rm "$SERVERNAME"
	docker exec mysql mysql -u root -proot -e 'drop database wp'$NUM'db'
	sudo rm ./nginx/wp$NUM.conf
	sudo rm -rf ./www/"$SERVERNAME"
fi

