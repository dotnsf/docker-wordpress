#! /bin/bash


if [ $# -eq 0 ]; then
	echo "Usage: $0 [num]";
	exit 1
else
	NUM="${1:-1}"

	docker rm wordpress"$NUM"
	docker exec mysql mysql -u root -proot -e 'drop database wp'$NUM'db'
fi

