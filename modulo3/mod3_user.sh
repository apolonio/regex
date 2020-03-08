#!/bin/bash
#Exemplo do uso do if e do while para verificar se um usuário está logado no PC
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)
#Utilização: ./mod3_user.sh sgtsantiago

#Captura o para
usuario="$1"

if who | fgrep "$usuario" >& /dev/null
then
    while who | fgrep "$usuario" >& /dev/null
    do  
        sleep 30 # A cada 30s verifica se o usuário está logado
    done
    echo "Desligue seu PC! Senão vai perder a carona!"  
    exit 0 # Sair do laço com sucesso (status 0)!
else
    echo "O Usuário "$usuario" não está logado!"
    exit 1
fi

