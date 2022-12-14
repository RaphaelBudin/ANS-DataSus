#!/bin/bash

# Dada uma lista de códigos TUSS (de procedimentos)...
# gera arquivos que contenham apenas linhas desses procedimentos.

LISTACODIGOS=("30912016" "30918073" "30918081");
LISTA_ANOS=("2017" "2018" "2019" "2020" "2021");

for CODIGO in ${LISTACODIGOS[@]}; do
	for ANO in ${LISTA_ANOS[@]}; do
			echo "Processando código: $CODIGO do ANO $ANO";
			# Deixa apenas os cids que começam com I4 e em branco
			# xsv search $CODIGO Agregado-Geral-$ANO.csv -o $CODIGO-$ANO.csv ;
			xsv search $CODIGO Agregado-Geral-$ANO.csv >> $CODIGO.csv ;
	done
done
