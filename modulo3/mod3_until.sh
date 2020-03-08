#!/bin/bash
#Exemplo do uso do while
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)

#o parametro W tem que ser maiusculo
until ping -c1 -W1 127.0.0.1
do
         sleep 1
done

echo O host 127.0.0.1 está UP!
