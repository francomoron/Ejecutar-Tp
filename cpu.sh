#!/bin/bash

echo "------ MODULO CPU ------"

cd /home/utnso/Desktop/tp-2024-2c-ElDebug/cpu

make

echo "------------"
echo "COMPILE CPU"
echo "------------"

sleep 1

echo "----------------"
echo "EJECUTANDO CPU"
echo "----------------"

sleep 1

./bin/cpu
