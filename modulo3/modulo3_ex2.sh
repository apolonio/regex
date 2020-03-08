#!/bin/bash
#Scritp que verifica vários IPs com base nos IPs que estao dentro do arquivo hosts.txt
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)
#Versao 1.0

for host in $(cat hosts.txt)
do
    #Tanto a saida padrao com o saída de erro esta apontando para NULL
    if ping -c1 -W2 "$host" 2> /dev/null 1>&2
    then
        echo "O host "$host" esta UP!"
    else
        echo "O host "$host" esta DOWN!"
    fi
done
