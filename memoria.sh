#!/bin/bash

DIR=$1
TIME=$2

if [ -z "$TIME" ]; then
    TIME=0
fi

clear

# Crea un archivo de bloqueo
touch /tmp/memoria.lock

echo -e "Esperando a que filesystem finalice: \n"
while [ -e /tmp/filesystem.lock ]; do
	sleep 1
	echo -n .
done
echo -e "\n"

echo "-------------------"
echo "MODULO MEMORIA"
echo "-------------------"

sleep $TIME

cd $DIR/memoria
make

echo "--------------------"
echo "COMPILE MEMORIA"
echo "--------------------"

echo "----------------------"
echo "EJECUTANDO MEMORIA"
echo "----------------------"

# Elimino el archivo de bloqueo
rm -f /tmp/memoria.lock

./bin/memoria
