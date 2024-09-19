#!/bin/bash

TIME=$1

if [ -z "$TIME" ]; then
    TIME=0
fi

clear

# Crea un archivo de bloqueo
touch /tmp/filesystem.lock

echo "-------------------"
echo "MODULO FILESYSTEM"
echo "-------------------"

cd /home/utnso/Desktop/tp-2024-2c-ElDebug/filesystem
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

./bin/filesystem
