### ANS-DataSus ###
Repositório para tratamento de dados da ANS e DataSUS

Os dados são obtidos no servidor FTP dos respectivos órgãos, em formato CSV.
A extração e tratamento dos dados é feito via AWK, XSV e scripts linux (bash scripting).

**O que o projeto tem:**
- Utilitário XSV para pesquisa em dados .csv (pode ser feito com AWK também)
- Join entre planilhas CONS por ano e no geral (2015-2021)
- Join entre planilhas DET por ano e no geral (2015-2021)
- Join entre DET e CONS, chamado GERAL (chave: ID da consulta, cada procedimento DET copia as colunas do CONS que o gerou)
- Procura consultas que contenham o CID informado
- Procura procedimentos por Código TUSS
- Procura procedimentos por Código TUSS com o CID informado na consulta geradora
- Procura procedimentos por Código TUSS e *sem* o CID informado na consulta geradora
- Gera arquivos .csv com as consultas acima

**Habilidades aplicadas:**
- Bash Scripting
- AWK (deprecado)
- XSV e operações de banco de dados (join, select, search etc etc)
- Arquivos CSV grandes
