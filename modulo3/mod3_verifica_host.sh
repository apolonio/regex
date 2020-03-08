#!/bin/bash
#Exemplo do uso do if e do while 
#para verificar se um HOST está ativo e dispara 100 conexões na porta 80
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)
#Utilização: ./mod3_user.sh 192.168.0.1

#Captura o host e coloca na variável
host="$1"

while ping -c1 -w1 | "$host"
do  
    for i in {1..100}
    do
        head -n1 /dev/unrandom | nc -n -w 0 "$host" 80
    done
    sleep 3
done

