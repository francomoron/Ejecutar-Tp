#!/bin/bash

DIR=$1

cd $DIR/filesystem 
make clean
rm -f filesystem.log

cd $DIR/memoria
make clean
rm -f memoria.log

cd $DIR/cpu
make clean
rm -f cpu.log

cd $DIR/kernel
make clean
rm -f kernel.log

cd $DIR/utils
make clean
rm -dr obj
