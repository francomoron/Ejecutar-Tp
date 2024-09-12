#!/bin/bash

echo "------ MODULO MEMORIA ------"

cd /home/utnso/Desktop/tp-2024-2c-ElDebug/memoria

make

echo "-----------------"
echo "COMPILE MEMORIA"
echo "-----------------"

sleep 1

echo "-------------------"
echo "EJECUTANDO MEMORIA"
echo "-------------------"

sleep 1

./bin/memoria

pwd
