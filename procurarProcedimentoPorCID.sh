#!/bin/bash
codigos_procedimentos=("30912016" "30918073" "30918081");
caminho_det="/mnt/c/DataSUS-ANS/ANS/HOSPITALAR/Agregados-DET";
echo "Iniciando script...";
ocorrencias_procedimento_por_codigo=0;
for codigo_cid in I47 I48 I49; do
    for codigo in ${codigos_procedimentos[@]}; do
        ((ocorrencias_procedimento_por_codigo=0))
        for ano in 2017; do
            echo "$codigo_cid $ano $codigo";
            #Pega a coluna de IDs de eventos dos arquivos que já foram filtrados pelo cid informado
            eventos_cid=$(awk -F ';' '{print $1}' $codigo_cid-CONS-$ano.csv);

            #Filtra os eventos que possuem duplicadas, sem mudar a ordem
            #eventos_cid_filtrados=$(echo "$eventos_cid" | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2-)
            #ou
            #Filtra os eventos que possuem duplicadas ordenando os valores
            eventos_cid_filtrados=$(echo "$eventos_cid"|tr " " "\n"|sort|uniq|tr "\n" " ");

            eventos_det=$(awk -F ';' '{print $1}' $caminho_det/$codigo-DET-$ano.csv);

            # Passa por todos os IDs de saúde
            for codigo_evento_CONS in $eventos_cid_filtrados; do
                for codigo_evento_DET in $eventos_det; do
                        if (( $codigo_evento_CONS == $codigo_evento_DET && $codigo_evento_CONS != "ID_EVENTO_ATENCAO_SAUDE"  && $codigo_evento_DET != "ID_EVENTO_ATENCAO_SAUDE" )); then
                        ((ocorrencias_procedimento_por_codigo++));
                    fi;
                done;
            done;
            echo "CID $codigo_cid - Ano $ano - Procedimento $codigo ----> $ocorrencias_procedimento_por_codigo";
        done
    done
done
echo "Script finalizado!";

