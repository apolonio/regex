#!/bin/bash
#Exemplo do uso do if e do while 
#para verificar se um host esta respondendo na porta 22
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)
#Utilização: ./mod3_netcat_host.sh 192.168.0.1

#Captura o host e coloca na variável
host="$1"

while true
do  
    if nc -n -w 1 "$host" 22
    then
        echo "Conectado no $host na porta 22"
        break
    else
        sleep 2
    fi
done


