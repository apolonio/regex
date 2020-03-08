#!/bin/bash
#Scritp que verifica vários IPs com base nos IPs que estao dentro do arquivo hosts.txt
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)
#Versao 1.1
#Acrescentado uma variavel que recebe um arquivo
#Utilização ./modulo3_ex2.1.sh hosts.txt

lista=$(cat hosts.txt)

#A variavel $lista nao pode estar entre aspas
#senao o for vai tratar tudo como uma variavel 
#pois ele nao consideraria as quebras de linhas entao use no for sem as aspas
for h in $lista
do
    #Tanto a saida padrao com o saída de erro esta apontando para NULL
    if ping -c1 -W2 "$h" 2> /dev/null 1>&2
    then
        echo "O host "$h" esta UP!"
    else
        echo "O host "$h" esta DOWN!"
    fi
done
