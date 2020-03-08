#!/bin/bash
#Scritp que verifica vários IPs e testa todos os hosts
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)
#Forma de testar $./modulo3_ex4.sh 192.168.0.1

#testa se recebeu algum parametro
if [ -z "$1" ]
then
        echo "ERRO! Utilize:"
        echo "$0 8.8.8.8"
        exit1
else
        REDE=$(echo "$1" | cut -d\. -f1-3)
        echo "# Verificando os hosts vivos na $REDE.0/24"
        echo
fi

#Executa um ping para cada host considerando que a rede e /24
for ((i=1;i<10;i++))
do
    HOST="$REDE.$i"
    if ping -c1 -W1 "$HOST" 2> /dev/null 1>&2
    then   
        echo " O host "$HOST" está UP! "
    else   
        echo " O host "$HOST" está DOWN! "
    fi
done