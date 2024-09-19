#!/bin/bash

TIME=$1

if [ -z "$TIME" ]; then
    TIME=0
fi

clear

echo -e "Esperando a que filesystem finalice: \n"
while [ -e /tmp/filesystem.lock ]; do
        sleep 1
        echo -n .
done

echo -e "\n"

echo -e "Esperando a que memoria finalice: \n"
while [ -e /tmp/memoria.lock ]; do
        sleep 1
        echo -n .
done

echo -e "\n"

echo -e "Esperando a que cpu finalice: \n"
while [ -e /tmp/cpu.lock ]; do
	sleep 1
	echo -n .
done

echo -e "\n"

echo "-------------------"
echo "MODULO KERNEL"
echo "-------------------"

sleep $TIME

cd /home/utnso/Desktop/tp-2024-2c-ElDebug/kernel
make

# Elimino el archivo de bloqueo

echo "--------------------"
echo "COMPILE KERNEL"
echo "--------------------"

echo "----------------------"
echo "EJECUTANDO KERNEL"
echo "----------------------"

./bin/kernel
