#!/bin/bash
# C G Ciber Sgt 2019
# Aluno: 2° SGT BRENO
# Instrutor: 2º Sgt Mnt Com Marcio Souza
# Data: 112000MAR2019
#
# Módulo 3 - Estruturas de repetição
# 1. Crie um scanner de rede chamado “scanner.sh”, seu script deve atender os requisitos
# 	abaixo:
# • Receba como único parâmetro um endereço IP . Se não for recebido nenhum parâmetro ou
# 	mais de um parâmetro, seu script deve interromper a execução e mostrar uma mensagem de
# 	utilização. Ex: “Utilize scanner.sh IP”;
# • Extraia o endereço de rede do parâmetro IP recebido, considerando que se trata de uma rede
# 	24. Ex: “Se recebido o IP 177.8.80.203, a rede seria 177.8.80.0”;
# • Teste todos os hosts da rede, verificando quais hosts estão UP, armazene essa lista de hosts UP;
# • Para cada host UP, deve ser verificado se as portas 22, 80 e 443 estão abertas;
# • Para cada host UP, seu script deve escrever no arquivo relatorio_scanner.txt o IP do host,
# 	seguido do status das portas escaneadas.
# • Ao final da execução, seu script deve imprimir a mensagem: “O scanner da rede $REDE foi
# 	concluído, o resultado foi gravado no arquivo relatorio_scanner.txt”
# OBS: Utilize o laço for e while para resolver a questão. Utilize a estrutura while read VAR para
# 	iterar a lista de hosts UP.


rm -rf UP.txt	# Remove arquivo antigo
#rm -rf relatorio_scanner.txt	# Remove arquivo antigo
if [ -z "$1" ] || [ -n "$2" ] # -z pergunta pergunta se a variável é nula e -n não nula
then
	echo "ERRO! Utilize "$0" IP (Apenas 1 IP por vez)"
	exit 1
else
	REDE=$(echo "$1" | cut -d "." -f1-3)
	echo -ne "Escaneando Rede "$REDE".0/24"
	for ((i=100;i<110;i++)) # apenas 10 IP para agilizar o teste
	do

		echo -ne "."
		if ping -c1 -W1 "$REDE"."$i" >/dev/null 2>/dev/null #1>&2 
		then
			echo ""$REDE"."$i"" >> UP.txt
		fi
	done
	UP="$(cat UP.txt | grep "$REDE")"
	echo " "
	echo "Relatório de escaneamento de portas (22, 80, 443)" >> relatorio_scanner.txt
	echo "Data do Escaneamento: "$(date)"">> relatorio_scanner.txt
	echo "#####################################################" >> relatorio_scanner.txt
	echo " " >> relatorio_scanner.txt
	while read linha
	do
		echo "$linha" >>relatorio_scanner.txt
		if nc -z -w1 "$linha" 22
		then
			echo "Port 22: open" >>relatorio_scanner.txt
		else
			echo "Port 22: closed" >>relatorio_scanner.txt
		fi
		if nc -z -w1 "$linha" 80
		then
			echo "Port 80: open" >>relatorio_scanner.txt
		else
			echo "Port 80: closed" >>relatorio_scanner.txt
		fi		
		if nc -z -w1 "$linha" 443
		then
			echo "Port 443: open" >>relatorio_scanner.txt
		else
			echo "Port 443: closed" >>relatorio_scanner.txt
		fi
		echo "" >> relatorio_scanner.txt
	done < UP.txt
	echo "#####################################################" >> relatorio_scanner.txt
	echo ""
	echo “O scanner da rede $REDE.0 foi concluído, o resultado foi gravado no arquivo relatorio_scanner.txt”	
	rm -rf UP.txt	# Remove arquivo não mais necessário
fi
