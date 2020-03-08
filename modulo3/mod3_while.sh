#!/bin/bash
#Exemplo do uso do while
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)

i="0"
while [ "$i" -le 5 ]
do
         echo $i
        i=$(($i+1))
done
