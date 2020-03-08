#!/bin/bash
#Scritp que verifica vários IPs com base em uma variavel com valores
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)
lista_de_hosts=$(cat hosts.txt)

#caso eu passa-se a variavel $lista_de_hosts com aspas duplas " os 
#valores do arquivo teriam apenas uma string
for host in $lista_de_hosts
do
    if ping -c1 -W 2 "$host" 2> /dev/null 1>&2
    then
        echo "O host "$host" esta UP!"
    else
        echo "O host "$host" esta DOWN!"
    fi
done