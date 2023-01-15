#!/bin/bash

# Dada uma lista de códigos TUSS (de procedimentos)...
# gera arquivos que contenham apenas linhas desses procedimentos.

LISTACODIGOS=("30912016" "30918073" "30918081");
LISTA_ANOS=("2017" "2018" "2019" "2020" "2021");

for CODIGO in ${LISTACODIGOS[@]}; do
	for ANO in ${LISTA_ANOS[@]}; do
			echo "Processando código: $CODIGO do ANO $ANO";
			# Gera um arquivo que tem todos os anos do procedimento informado
			xsv search $CODIGO Agregado-Geral-$ANO.csv >> $CODIGO.csv ;
	done
done
