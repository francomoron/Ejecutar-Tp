#!/bin/bash

DIR=$1
TIME=$2
DEBUG=$3

if [ -z "$TIME" ]; then
    TIME=0
fi

clear

# Crea un archivo de bloqueo
touch /tmp/filesystem.lock

echo "-------------------"
echo "MODULO FILESYSTEM"
echo "-------------------"

cd $DIR/filesystem
make

echo "--------------------"
echo "COMPILE FILESYSTEM"
echo "--------------------"

sleep $TIME

echo "----------------------"
echo "EJECUTANDO FILESYSTEM"
echo "----------------------"

# Elimino el archivo de bloqueo
rm -f /tmp/filesystem.lock

if [[ "${DEBUG}"  == "true" ]]; then
	valgrind --leak-check=full --track-origins=yes --log-file=valgrind-filesystem.log ./bin/filesystem
else
	./bin/filesystem
fi

