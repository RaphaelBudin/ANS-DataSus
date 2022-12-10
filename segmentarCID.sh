#!/bin/bash

#Faz pesquisas do código CID e suas subdivisões

LISTA_CID=("I47" "I48" "I49");
# for i in 0 1 2 3 4 5 6 7 8 9; do
# 	LISTA_CID+=("$codigo_cid$i");
# done

# ANOS=("2017");
ANOS=("2017" "2018" "2019" "2020");

for CID in ${LISTA_CID[@]}; do
	LISTA_CID=($CID);
	for i in 0 1 2 3 4 5 6 7 8 9; do
		LISTA_CID+=("$CID$i");
	done
	for ano in ${ANOS[@]}; do
			# ocorrencias=$(awk -F ';' -v var=$CID '$17 == var || $18 == var || $19 == var || $20 == var {print}' $codigo_cid-CONS-$ano.csv | wc -l);
			ocorrencias=$(xsv search -d ';' -s 17,18,19,20 "$CID" $codigo_cid-CONS-$ano.csv | wc -l);
			if (( $ocorrencias > 0 )) ;then
				echo "CID $CID Ano $ano: $ocorrencias";
				echo "";
				echo $CID-$ANO >> segmentosCID-$CID-$ano;
				echo "" >> segmentosCID-$CID-$ano;
			fi
	done
done

