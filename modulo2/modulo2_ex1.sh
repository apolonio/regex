#!/bin/bash
#Programa que compara com 5 e verifica se esta no intervalo
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)
if [ -z $1 ]
then
        echo "Utilize $0 NUM1"
        exit
elif test $1 -eq 5
then
        echo "$1  é igual a 5"
elif test $1 -lt 5
then
        echo "O $1 é menor que 5"
else
        echo "O $1 é maior que 5"
fi