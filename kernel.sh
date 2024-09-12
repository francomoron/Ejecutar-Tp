#!/bin/bash

echo "------ MODULO KERNEL ------"

cd /home/utnso/Desktop/tp-2024-2c-ElDebug/kernel

make

echo "---------------"
echo "COMPILE KERNEL"
echo "---------------"

sleep 1

echo "---------------"
echo " EJECUTANDO KERNEL"
echo "---------------"

sleep 1

./bin/kernel
