#!/bin/bash

DIR=$1
TIME=$2
DEBUG=$3

if [ -z "$TIME" ]; then
    TIME=0
fi

clear

# Crea un archivo de bloqueo
touch /tmp/cpu.lock

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

echo "-------------------"
echo "MODULO CPU"
echo "-------------------"

sleep $TIME

cd $DIR/cpu
make

echo "--------------------"
echo "COMPILE CPU"
echo "--------------------"

echo "----------------------"
echo "EJECUTANDO CPU"
echo "----------------------"

# Elimino el archivo de bloqueo
rm -f /tmp/cpu.lock

if [[ "${DEBUG}" == "true" ]]; then
	valgrind --leak-check=full --track-origins=yes --log-file=valgrind-cpu.log ./bin/cpu
else
	./bin/cpu
fi

