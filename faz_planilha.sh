#!/bin/bash

ano=2019
while getopts 'ac:d' OPTION; do
	case "$OPTION" in
		a)
			ano="$OPTARG"
			echo "O ano  é: $OPTARG"
			;;
		c)
			codigo="$OPTARG"
			echo "Os valores são: $OPTARG"
			;;
		d)
			descricao="OPTARG"
			echo "Descrição: $OPTARG"
			;;
		?)
			echo "Opção inválida!"
			exit 1
			;;
	esac
done

[ ! -f "Planilha.csv"] && "Codigo; Descrição; $ano" > Planilha.csv

arquivo=$ano-$codigo.csv
xsv=/home/raphael/Downloads/Instaladores/xsv
contagem=$xsv count pwd/$arquivo
linha="$Codigo;$Descricao;$contagem"
