#!/bin/bash
# Questao2 - Modulo 2 - Verificar se é Par ou Impar
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)

if [ -z $1 ]
then
        echo "Utilize $0 NUM1"
        exit
elif test $1 -eq 0
then
        echo "O $1  é PAR"
else
        echo "O $1 é ÍMPAR"
fi
