#!/bin/bash

#LISTA_ANOS=("2015" "2016" "2017" "2018" "2019" "2020" "2021" );

echo "Juntando 2015 com 2016";
xsv join --full 1 Agregado-GERAL-2015.csv 1 Agregado-GERAL-2016.csv -o temp1.csv;
echo "Feito!";

echo "Juntando com 2017";
xsv join --full 1 Agregado-GERAL-2017.csv 1 temp1.csv -o temp2.csv;
echo "Feito!";

echo "Juntando com 2018";
xsv join --full 1 Agregado-GERAL-2018.csv 1 temp2.csv -o temp1.csv;
echo "Feito!";

echo "Juntando com 2019";
xsv join --full 1 Agregado-GERAL-2019.csv 1 temp1.csv -o temp2.csv;
echo "Feito!";

echo "Juntando 2020";
xsv join --full 1 Agregado-GERAL-2020.csv 1 temp2.csv -o temp1.csv;
echo "Feito!";

echo "Juntando 2021";
xsv join --full 1 Agregado-GERAL-2021.csv 1 temp1.csv -o Agregado-GERAL-2015-2021;
echo "Feito!";

echo "Deletando arquivos temporários...";
rm temp1.csv temp2.csv;
echo "Feito!";
