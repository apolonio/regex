#!/bin/bash
# Aluno: 2° SGT Santiago
# Questao 1 - Módulo 3 questao1.sh

# Removendo arquivo 
rm -rf UP.txt	

if [ -z "$1" ] || [ -n "$2" ] 
then
	echo "ERRO! Utilize  "$0"  único IP"
	exit 1
else
	#Filtrando somente os octetos que representam a rede
	NET=$( echo "$1" | cut -d "." -f1-3 )

	echo -ne "Verificando toda Rede  "$NET".0/24"
	for ((i=1;i<15;i++)) # apenas 10 IP para agilizar o teste
	do
		echo -ne "."
		
		if ping -c1 -W1 "$NET"."$i" >/dev/null 2>/dev/null 

		then
			echo ""$NET"."$i""  >> UP.txt
		fi
	done

	UP="$(cat UP.txt | grep "$NET" )"

	echo " "
	echo "Relatório de escaneamento das portas [22,80,443]" >>relatorio_scanner.txt
	echo "--------" >>relatorio_scanner.txt
	echo " " >>relatorio_scanner.txt 

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
	echo "-------------------------------" >> relatorio_scanner.txt
	echo ""
	echo “O scanner da rede $NET.0 foi concluído, o resultado foi gravado no arquivo relatorio_scanner.txt”	
	
	rm -rf UP.txt	
fi
