#!/bin/bash

cd /home/utnso/Desktop/tp-2024-2c-ElDebug/filesystem 
make clean
rm -f filesystem.log

cd /home/utnso/Desktop/tp-2024-2c-ElDebug/memoria
make clean
rm -f memoria.log

cd /home/utnso/Desktop/tp-2024-2c-ElDebug/cpu
make clean
rm -f cpu.log

cd /home/utnso/Desktop/tp-2024-2c-ElDebug/kernel
make clean
rm -f kernel.log

cd /home/utnso/Desktop/tp-2024-2c-ElDebug/utils
make clean
rm -dr obj
