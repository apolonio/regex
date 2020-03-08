#!/bin/bash
#Scritp que verifica vários IPs e testa todos os hosts
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)
#Forma de testar $./modulo3_ex5_rede.sh 192.168.0.1

#testa se recebeu algum parametro
if [ -z "$1" ] 2> /dev/null
then
        echo " Use "$0" e um IP Válido"
else
        echo "# Verificando os HOSTs ativos em "$1"...!"
fi
REDE=$(echo $1 | cut -d"." -f1-3)

#Executa um ping para cada host considerando que a rede e /24
for ((i=0;i<10;i++))
do
    HOST="$REDE.$i"
    if ping -c1 -W1 "$HOST" 2>/dev/null 1>&2
    then   
        echo " O host "$HOST" está UP! " 1>hostUP.txt
    else   
        echo " O host "$HOST" está DOWN! " 1>/dev/null
    fi
done

teste =$( cat hostUP.txt | cut -d" " -f3)
for t in $teste 
do 
    echo $(nmap -p22 $t )
done