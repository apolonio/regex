#!/bin/bash
# C G Ciber Sgt 2020
# Aluno: 2° SGT SANTIAGO
# Instrutor: 2º Sgt Mnt Com Marcio Souza
# Data: 2020
#
# Módulo 3 - Estruturas de repetição
# 2. Vamos criar uma ferramenta de bruteforce para esteganografia. Então crie um script que:
# • Receba dois parâmetros: wordlist e arquivo.jpg. Sendo o primeiro parâmetro a wordlist que
# 	vai ser utilizada e o segundo o arquivo a ser testado;
# • Para cada linha da lista de palavras, teste se é possível extrair o arquivo esteganografado;
# • Implemente um contador de repetições do laço e imprima na tela o respectivo número;
# 	(Dica: Crie uma variável com valor 1 fora da estrutura do laço e dentro do laço incremente
# 	a variável a cada iteração)
# • Quando encontrar a senha, encerre o laço e imprima na tela a senha encontrada;

if [ -z "$1" ] || [ -z "$2" ] # -z VERIFICA se a variável $1 está vazia
then
	echo "ERRO! Utilize "$0" wordlist e  arquivo.jpeg"
	exit 0
else

	rm -rf flag.txt #Apago o arquivo caso ele exista na pasta
	wordlist=$1
	cont=1
	lista="$wordlist"
	image=$2
	while read linha
	do	
	echo -ne ""$cont" ";
	cont=$(( $cont + 1 ))
		if steghide extract -sf "$image" -p ""$linha "" -xf flag.txt 2> /dev/null
		then
			echo  -ne " A senha do "$image" é: "$linha ""
			break
		fi
	done < $wordlist #arquivo de entrada
 	echo " "
fi
