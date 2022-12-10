#!/bin/bash

#Junta as planilhas de consulta com as de procedimentos para facilitar a análise de dados

LISTA_ANOS=("2017" "2018" "2019" "2020" "2021" )
for ANO in ${LISTA_ANOS[@]}; do
    xsv join -d ';' --full 1 Agregado-CONS-$ANO.csv 1 Agregado-DET-$ANO.csv -o Agregado-GERAL-$ANO.csv;
done