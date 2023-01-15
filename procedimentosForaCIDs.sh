#!/bin/bash

# Dado uma lista de procedimentos TUSS...
# e dado uma lista de CIDs...
# verifica quais registros geraram procedimentos TUSS sem gerar os CIDs informados

LISTA_PROCEDIMENTOS=("30912016" "30918073" "30918081");
LISTA_ANOS=("2017" "2018" "2019" "2020" "2021" );

CID1="I47";
CID2="I48";
CID3="I49";

for PROCEDIMENTO in ${LISTA_PROCEDIMENTOS[@]}; do
    for ANO in ${LISTA_ANOS[@]}; do
        if [[ -f "SEM_CID-$PROCEDIMENTO-$ANO.csv" ]]; then
            echo "Arquivo SEM_CID-$PROCEDIMENTO-$ANO.csv já existe. Pulando...";
            echo "Número de Linhas: " >> SEM_CID_GERAL.txt;
            wc -l SEM_CID-$PROCEDIMENTO-$ANO.csv >> SEM_CID_GERAL.txt ;
            continue;
        fi
        # 1 -> ID_EVENTO_ATENCAO_SAUDE
        # 17 a 20 -> CIDs 1 a 4
        # 29 -> Código do procedimento
        xsv select 1,17,18,19,20,29 Agregado-GERAL-$ANO.csv | xsv search -v "$CID1|$CID2|$CID3" | xsv search $PROCEDIMENTO -o SEM_CID-$PROCEDIMENTO-$ANO.csv;

        echo "Arquivo SEM_CID-$PROCEDIMENTO-$ANO.csv criado.";
    done
done