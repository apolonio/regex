#!/bin/bash
#Scritp que testa o horário e informa a saudação
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)

horario=`date +%H`

if [ "$horario" -ge 0 -a "$horario" -lt 11 ] 
then
    echo "Bom dia!" 
elif [ "$horario" -ge 11 -a "$horario" -lt 18 ]
then    
    echo "Boa tarde!"
elif [ "$horario" -ge 18 -a "$horario" -lt 24 ]
then
    echo "Boa noite!"
fi
