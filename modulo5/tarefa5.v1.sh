#!/bin/bash
# Módulo 5 - Funções
# Sgt Santiago
# Esse script recebe como parametro 1 arquivo.jpeg contendo mensagem criptografada e 1 arquivo
# que possui varias senhas para serem testadas
# Objetivo: Acessar a imagem descobrir a mensagem cifrada e utilizar a 
# senha para acessar o conteudo da mensagem
# Utilizacao ./questao1.sh arquivo.jpeg wordlist.txt

# Essa função será chamada dentro do Scritp
buscar_mensagem(){
        if setghide extract -sf $arquivo -p $senha -xf flag.txt
        then
                return 0
        else
                return 1
        fi
}

# Início do script
if [ -z "$1"] || [ "$#" -ne 2 ]
then
        echo "Erro! Utilize: "
        echo "$0  wordlist.txt e arquivo.jpeg"
else
        rm flag.txt 2> /dev/null
        contador="1"
        wordlist="$1" # arquivo txt recebido
        arquivo="$2" # imagem recebida 
        # Contagem das palavras dentro do arquivo
        nr_senhas=$(wc -l wordlist.txt | awk '{print $1}')

        echo "Quantidade senhas possíveis" $nr_senhas
# Início do Laço que aciona a função
while read senha
do
        # Exibindo o número e as senhas testadas até o momento
        echo "Teste de Senha Nr $contador: $senha"
        retorno_busca = $(buscar_mensagem $arquivo $senha)
        if [ "$retorno_busca" = "0" ]
        then   
                echo "A senha encontrada! A senha é: "$senha
                exit 0
        fi
# Incrementando a função para sabermos quantos testes foram executados        
contador=$["$contador"+1]
done

