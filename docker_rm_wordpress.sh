#! /bin/bash


if [ $# -eq 0 ]; then
	echo "Usage: $0 [num]";
	exit 1
else
	NUM="${1:-1}"

	docker rm wp"$NUM".mydockernet.local
	docker exec mysql mysql -u root -proot -e 'drop database wp'$NUM'db'
	rm ./nginx/wp$NUM.conf
fi

