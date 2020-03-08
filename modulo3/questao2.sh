#!/bin/bash
# Aluno: 2° SGT SANTIAGO
# Questao 2 - Módulo 3 

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
		if steghide extract -sf "$image" -p ""$linha "" -xf flag.txt 
		then
			echo  -ne " A senha do "$image" é: "$linha ""
			break
		fi
	done < $wordlist #arquivo de entrada
 	echo " "
fi


