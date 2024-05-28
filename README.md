
# 🎯 SAS Geo

Repositório de Arquivos destinado a uso do SAS para criação de Mapa Coroplético.

Um mapa coroplético é um mapa temático usado para representar dados estatísticos usando a técnica de simbologia de mapeamento de cores.[[1]](#-refer%C3%AAncia)

### 👨‍💻 Uso no SAS Visual Analytics (VA)

Esses repositório tem como função ajudar os programadores e analistas SAS a execução do Mapa Coroplético de um maneira simples e rápida, que possa ser replicada em vários projetos.

## ⚙️ Códigos

Há duas maneiras de se fazer um Mapa Coroplético no SAS VA:
	
 1. Arquivo [GeoJSON](#%EF%B8%8F-geojson)
 2. Arquivo [Shapefile](#%EF%B8%8F-shapefile)

Ambos os métodos tem suas particularidades.

### 🗺️ GeoJSON

O GeoJSON é um formato padrão aberto projetado para representar recursos geográficos simples, juntamente com seus atributos não espaciais. É baseado na JSON (JavaScript Object Notation). Os recursos incluem pontos (portanto endereços e locais), sequências de linhas (portanto ruas, rodovias e limites), polígonos (países, províncias, terrenos) e coleções com várias partes desses tipos. [[2]](#-refer%C3%AAncia)

São arquivos mais leves em comparação aos demais, porém são limitados, pois funcionam com aquela quantidade de coordenadas e, caso você tenha que alterar alguma coordenada, possivelmente o mesmo não irá plotar corretamente no gráfico, principalmente quando a região contém Multipolígonos, como ilhas, por exemplo.

Fora esse detalhe, o formato GeoJSON é rápido e bem útil quando você tem um ambiente SAS muito limitado a importar ou exportar arquivos. O GeoJSON pode ser facilmente "coletado" via http, desde que o link seja funcional e que não altere o local.

Deixamos uma lista disponível [aqui](https://github.com/artYYDP/SAS-Geo/tree/ec010701f6d63a71ddcd8fd9fe42307b7c425bed/geojson).

Abaixo segue um exemplo de uso do código no SAS. O código está todo documentado para facilitar o uso.

<details>
<summary>Clique aqui para visualizar o código</summary>
	
```sas
/* CÓDIGO PARA CRIAÇÃO DE UM MAPA COROPLÉTICO NO SAS DE ARQUIVO GEOJSON (ONLINE) */
/* Versão: 1.3 */
/* Status: Finalizada */
/* Autor: Arthur Diego Pereira */
/* Contribuição: Geiziane Silva de Oliveira */
/*  */
/* NÃO RETIRE OS CRÉDITOS POR FAVOR */
/*  */
/* Fazer o Download do Arquivo GeoJSON do Github */
filename mapa temp;

proc http
	url="https://github.com/artYYDP/SAS-Geo/raw/ec010701f6d63a71ddcd8fd9fe42307b7c425bed/geojson/Por%20estado/PR-41.geojson"
	method="GET"
	out=mapa;
run;

/* Ler o Arquivo GeoJSON usando a Biblioteca JSON */
libname jsonlib json fileref=mapa;

/* Examinar a Estrutura do GeoJSON */
proc contents data=jsonlib._all_;
run;

/* Unir as tabelas */
data map_data;
    merge jsonlib.features_properties 
          jsonlib.features_geometry (keep=ordinal_features ordinal_geometry type);
    by ordinal_features;
run;

/* Preparar os dados para o gráfico GMAP */
data map_data;
    merge map_data
          jsonlib.geometry_coordinates;
    by ordinal_geometry;
run;

/* Preparar os dados para a Plotagem */
data plot_data (drop=element1 element2);
    set map_data;
    x = element1;
    y = element2;
    i = 1;
    output;
run;

/* Plotar o gráfico */
proc gmap data=plot_data map=plot_data;
    id name;
    choro name / nolegend levels=1;
run;

/* Adicionar sequencia */
data plot_data;
set plot_data;
seqno=_n_;
run;

%macro sas_load_data_cas(incaslib=,casdata=,data=,outcaslib=, casout=);
/* Deleta a tabela da memória */
proc casutil;
droptable incaslib = "&outcaslib." casdata = "&casdata." quiet;
run;

/* Carrega tabela no CAS*/
proc casutil;
  load data=&data. casout="&casout." outcaslib=&outcaslib. replace;
quit;

/* Salva uma copia da tabela na memória [OPCIONAL]  */
/* proc casutil ; */
/* save  casdata = "&casdata." incaslib = "&incaslib." replace */
/* casout="&casout..sashdat" outcaslib="&outcaslib."; */
/* quit; */

/* Promove a tabela (disponível para todos os usuário acesso ao servidor) */
proc casutil;
promote incaslib = "&outcaslib." casdata = "&casdata."
outcaslib = "&outcaslib." casout = "&casout.";
quit;
%mend sas_load_data_cas;
%sas_load_data_cas(incaslib=Public,casdata=MAPA_ES,data=geo.regions_shapefile,outcaslib=Public, casout=MAPA_ES)
```
</details>

### 🗺️ Shapefile

O Esri Shapefile ou simplesmente shapefile é um formato popular de arquivo contendo dados geoespaciais em forma de vetor usado por Sistemas de Informações Geográficas também conhecidos como SIG. Foi desenvolvido e regulamentado pela ESRI como uma especificação aberta para interoperabilidade por dados entre os softwares de Esri e de outros fornecedores.

Shapefiles espacial descrevem geometrias: pontos, linhas, e polígonos. Entre outras coisas, essas geometrias podem representar Poços, Rios, e Lagos, respectivamente. Cada item pode ter atributos que os descrevem, por exemplo: nome, temperatura ou profundidade.[[3]](#-refer%C3%AAncia)

São arquivos mais pesados em comparação aos demais, pois podem ser extremamente detalhistas com bairros e cidades. As ilhas também ficam plotadas corretamente no gráfico.

Porém, exige mais conhecimento de detalhes técnicos sobre como o arquivo funciona.

Deixamos uma lista disponível [aqui](https://github.com/artYYDP/SAS-Geo/tree/ec010701f6d63a71ddcd8fd9fe42307b7c425bed/shapefiles).

Abaixo segue um exemplo de uso do código no SAS. O código está todo documentado para facilitar o uso.

<details>
<summary>Clique aqui para visualizar o código</summary>
	
```sas
/* Em construção */
```
</details>

## 📷 Screenshots

![Prints de Telas](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQisH2hE8VFQ-U6j6ROFEahfAEDo-8OJTs8qA&s)


## 🔑 Licença

[CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/deed.en)


## 🧑‍💼 Autores

- [Arthur Diego Pereira](https://www.linkedin.com/in/arthurdiegopereira/)
- [Geiziane Silva de Oliveira](https://www.linkedin.com/in/geiziane-oliveira-0a5882110/)

## 📗 Referência

 - [What is a Choropleth Map and How To Create One](https://venngage.com/blog/choropleth-map/)
 - [GeoJSON](https://geojson.org/)
 - [What is a shapefile?](https://desktop.arcgis.com/en/arcmap/latest/manage-data/shapefiles/what-is-a-shapefile.htm)

