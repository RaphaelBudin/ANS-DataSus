#!/bin/bash
LISTA_CIDS=("I47" "I48" "I49");
for CID in ${LISTA_CIDS[@]}; do
	for ano in 2015; do
			echo "Criando arquivo com Header";
			head -n 1 0-Agregado-CONS-$ano.csv > $CID-CONS-$ano.csv;
			echo "Processando código: $CID do ano $ano";
			# Procura apenas no arquivo CONS o CID e ano especificados
			xsv search -d ';' -s 17,18,19,20 $CID Agregado-CONS-$ano.csv -o CID-$CID-CONS-$ano.csv;
	done
done

