#!/bin/bash

# Dada uma lista de códigos TUSS (de procedimentos)...
# gera arquivos que contenham apenas linhas desses procedimentos.

LISTACODIGOS=("30912016" "30918073" "30918081");

for codigo in ${LISTACODIGOS[@]}; do
	for ano in 2017 2018 2019 2020 2021; do
			echo "Criando arquivo com Header";
			head -n 1 0-Agregado-DET-$ano.csv > $codigo-DET-$ano.csv;
			echo "Processando código: $codigo do ano $ano";
			#O comando abaixo faz a mesma coisa que o xsv search, porém mais lento
			# awk -F ';' -v var=$codigo '$5 ~ var {print}' 0-Agregado-DET-$ano.csv >> $codigo-DET-$ano.csv;
			xsv search -d ';' $codigo Agregado-DET-$ano.csv -o $codigo-$ano.csv;
	done
done

