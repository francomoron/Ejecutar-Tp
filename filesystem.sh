#!/bin/bash

echo "------ MODULO FILESYSTEM ------"

cd /home/utnso/Desktop/tp-2024-2c-ElDebug/filesystem

make

echo "--------------------"
echo "COMPILE FILESYSTEM"
echo "--------------------"

sleep 1

echo "----------------------"
echo "EJECUTANDO FILESYSTEM"
echo "----------------------"

sleep 1

./bin/filesystem
