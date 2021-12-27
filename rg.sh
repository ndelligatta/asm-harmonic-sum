#!/bin/bash
## =============================================== ##
## Nolan Delligatta                                ##
## CPSC 240-03                                     ##
## ndelligatta@csu.fullerton.edu                   ##
## Harmonic Sum Calculator                         ##
## =============================================== ##

rm *.o
rm *.out

echo "Welcome to the bash script"

echo "Assemble harmonic.asm"
nasm -f elf64 -l harmonic.lis -o harmonic.o harmonic.asm -g -gdwarf

echo "Compile the C++ main functions"
gcc -c -Wall -o statistics.o -m64 -no-pie -fno-pie statistics.c -g
g++ -c -g -m64 -Wall -no-pie -o isfloat.o isfloat.cpp -std=c++17 
g++ -c -g -m64 -Wall -no-pie -o reciprocal_sum.o reciprocal_sum.cpp -std=c++17

echo "Link 2 object files"
gcc -m64 statistics.o harmonic.o isfloat.o reciprocal_sum.o -fno-pie -no-pie -o my.out -g

gdb ./my.out