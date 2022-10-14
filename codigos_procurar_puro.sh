#!/bin/bash

#Lista de Códigos DET para procurar no TOTAL_DET.csv
# --- FAZER LEITURA EM ARQUIVO, UM CÓDIGO POR LINHA, LENDO DE ARQUIVO INFORMADO VIA FLAG ---
LISTACODIGOS=("10103023" "10103031" "10103023" "10103031" "20103107" "20201036" "20201044" "20202016" "20202024" "31303315" "31303323" "31309038" "31309097" "31309127" "31309135" "31309151" "41401670" "40501124");
ano=2019

for codigo in ${LISTACODIGOS[@]}; do
		echo "Criando arquivo com Header"
		head -n 1 TODOS_DET.csv > $ano-$codigo.csv;
		echo "Processando código: $codigo";
		awk -F ';' -v var=$codigo '$5 ~ var {print}' TODOS_DET.csv >> $ano-$codigo.csv;
done

