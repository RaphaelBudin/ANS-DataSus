#!/bin/bash

# Dada uma lista de códigos TUSS (de procedimentos)...
# gera arquivos que contenham apenas linhas desses procedimentos.

LISTACODIGOS=("30912016" "30918073" "30918081");
LISTA_ANOS=("2017" "2018" "2019" "2020" "2021");
LISTA_CID=("I47" "I48" "I49");

for CODIGO in ${LISTACODIGOS[@]}; do
	for ANO in ${LISTA_ANOS[@]}; do
		for CID in ${LISTA_CID[@]}; do
			# echo "Criando arquivo com Header";
			# head -n 1 0-Agregado-DET-$ANO.csv > $CODIGO-DET-$ANO.csv;
			echo "Processando código: $CODIGO do ANO $ANO";
			xsv search -d ',' "$CID" Agregado-Geral-$ANO.csv | xsv search $CODIGO -o $CID-$CODIGO-$ANO.csv;
		done
	done
done

