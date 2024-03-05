#!/bin/sh
#
# check if docker is running
if ! (docker ps >/dev/null 2>&1)
then
        echo "docker daemon not running, will exit here!"
        exit
fi
echo "Preparing folder init and creating ./init/initdb.sql"
mkdir ./init >/dev/null 2>&1
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgresql > ./init/initdb.sql
chmod -R 777 ./init
echo "done"