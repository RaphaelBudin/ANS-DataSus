#!/bin/bash

caminho_codigos_procurar=/home/raphael/NETSAC;
caminho=/home/raphael/NETSAC/ANS/HOSPITALAR;

#Criar diretórios $ano/AAAA/DET
for ano in 2019 2020; do
    caminho_det=$caminho/$ano/DET;

    #Remove pastas criadas anteriormente se existirem
    [ -d "$caminho_det"] && rm -r "$caminho_det/" && echo "Pasta $caminho_det removida!"

    #Cria pasta do DET
    mkdir $caminho_det;
    echo "Pasta $caminho_det criada."

    #Extrair todos os "*_DET.zip" para $ano/AAAA/DET
    echo "Extraindo todos os DET do ano $ano"
    find $caminho/$ano/ -type f -name "*_DET.zip" -exec unzip {} -d $caminho_det/ \;

    #Juntar todos os "*_DET.csv" em $ano/AAAA/DET/TODOS.csv
    echo "Juntando todos os DET do ano $ano em TODOS.csv"
    cat $caminho_det/*csv > $caminho_det/TODOS.csv;

    #Necessário para o rm não apagar o TODOS.csv
    #sleep 5

    #Remover todos os "*_DET.csv" em $ano/AAAA/DET
    echo "Removendo todos os DET.csv do ano $ano"
    find $caminho_det/ -type f -name "*_HOSP_DET.csv" -exec rm {} -rf \;

    #Renomear o "TODOS.csv" para "TODOS_DET.csv"
    echo "Renomeando TODOS.csv para TODOS_DET.csv"
    mv $caminho_det/TODOS.csv $caminho_det/TODOS_DET.csv;

    echo "Copiando 'codigos_procurar_puro.sh para pasta-alvo "
    cp $caminho/codigos_procurar_puro.sh $caminho_det/
    chmod +x $caminho_det/codigos_procurar_puro.sh

    #source $caminho_det/codigos_procurar_puro.sh
done


#Executar o "codigos_procurar.sh" para achar os DET
    #Ler lista de códigos de um arquivo

        #Cada código estará em uma linha

        #Por padrão serão extraídos os anos de 2019, 2020 e 2021 (se houver)
            #Informar os anos via argumento (do $2 em diante)

        #Por padrão será lida a coluna 5 no awk, que é a coluna COD_PROCEDIMENTO
            #Informar nome ou número da coluna a ser pesquisado via flag

    #Extrair todos os códigos para a seguinte estrutura:
        #/home/raphael/NETSAC/ENTREGA/ANS/$ano/DET/

#Realizar Combinação dos arquivos dos anos
    #Criar um Header com "Código Procedimento/ANO1/ANO2/ANO3/TOTAL"
    #Ler quantidade de ocorrências de cada COD_PROCEDIMENTO por ano
        # (contar a quantidade de linhas deve ser o suficiente)
        # Adicionar informação na última linha do arquivo de acordo com o header acima
    #Somar todos os valores dos anos na coluna /TOTAL
