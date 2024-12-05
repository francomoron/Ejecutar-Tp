#!/bin/bash

DIR=$1
TIME=$2
ARCHIVO_A_EJECUTAR=$3
TAMANIO_ARCHIVO=$4
DEBUG=$5

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

cd $DIR/kernel
make

# Elimino el archivo de bloqueo

echo "--------------------"
echo "COMPILE KERNEL"
echo "--------------------"

echo "----------------------"
echo "EJECUTANDO KERNEL"
echo "----------------------"

if [[ "${DEBUG}" == "true" ]]; then
	valgrind ./bin/kernel $ARCHIVO_A_EJECUTAR $TAMANIO_ARCHIVO
else
	./bin/kernel $ARCHIVO_A_EJECUTAR $TAMANIO_ARCHIVO
fi



