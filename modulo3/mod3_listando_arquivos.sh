#!/bin/bash
#Processa arquivos se forem do tipo PNG
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)
#Utilização: ./mod3_user.sh sgtsantiago

for arquivo in $(find /tmp -type f 2> /dev/null)    
do
    if file "$arquivo"| grep PNG >& /dev/null
    then
    #basename trata o caminho do arquivo
        echo "Arquivo : $(basename "$arquivo")"
        exitftool "$arquivo" | grep Software
    else
        continue
    fi

done

