#!/bin/bash

# Dado uma lista de procedimentos TUSS...
# e dado uma lista de CIDs...
# verifica quais registros geraram procedimentos TUSS sem gerar os CIDs informados

LISTA_PROCEDIMENTOS=("30912016" "30918073" "30918081");
LISTA_ANOS=("2017" "2018" "2019" "2020" "2021" );
LISTA_CID=("I47" "I48" "I49");

for PROCEDIMENTO in ${LISTA_PROCEDIMENTOS[@]}; do
    for CID in ${LISTA_CID[@]}; do
        for ANO in ${LISTA_ANOS[@]}; do
            # 1 -> ID_EVENTO_ATENCAO_SAUDE
            # 17 a 20 -> CIDs 1 a 4
            # 29 -> Código do procedimento
            xsv select 1,17,18,19,20,29 Agregado-GERAL-$ANO.csv | xsv search $CID | xsv search $PROCEDIMENTO -o CID-$CID-$PROCEDIMENTO-$ANO.csv;

            echo "Arquivo CID-$CID-$PROCEDIMENTO-$ANO.csv criado.";
        done
    done
done