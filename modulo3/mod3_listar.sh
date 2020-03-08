#!/bin/bash
#Exemplo do uso do while
#Autor: Apolonio Santiago Junior (apolocomputacao@gmail.com)

lista_emails_origem = "$(cat mbox.txt | grep -i From:)"

while read linha
do
    # Usando cut para pegar somente o segundo campo que seria o email 
    # usando delimitador " "
    echo "$linha"| grep "^From\:"| cut -d " " -f2
done < mbox.txt