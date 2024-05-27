
# SAS Geo

Repositório de Arquivos destinado a uso do SAS para criação de Mapa Coroplético.

Um mapa coroplético é um mapa temático usado para representar dados estatísticos usando a técnica de simbologia de mapeamento de cores.

### Uso no SAS Visual Analytics (VA)

Esses repositório tem como função ajudar os programadores e analistas SAS a execução do Mapa Coroplético de um maneira simples e rápida, que possa ser replicada em vários projetos.

## Código
<details>
<summary>CÓDIGO PARA CRIAÇÃO DE UM MAPA COROPLÉTICO NO SAS DE ARQUIVO GEOJSON (ONLINE)</summary>
	
```sas
/* CÓDIGO PARA CRIAÇÃO DE UM MAPA COROPLÉTICO NO SAS DE ARQUIVO GEOJSON (ONLINE) */
/* Versão: 1.3 */
/* Status: Finalizada */
/* Autor: Arthur Diego Pereira */
/* Projetos utilizados: -- */
/* Contribuição: Geiziane Silva de Oliveira */
/*  */
/*  */
/*  */
/* Fazer o Download do Arquivo GeoJSON do Github */
filename mapa temp;

proc http
	url="https://raw.githubusercontent.com/artYYDP/geodata-br/master/geojson/geojs-32-mun.json"
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

## Screenshots

![Prints de Telas](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQisH2hE8VFQ-U6j6ROFEahfAEDo-8OJTs8qA&s)


## Licença

[CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/deed.en)


## Autores

- [Arthur Diego Pereira](https://www.linkedin.com/in/arthurdiegopereira/)
- [Geiziane Silva de Oliveira](https://www.linkedin.com/in/geiziane-oliveira-0a5882110/)

## Referência

 - [What is a Choropleth Map and How To Create One](https://venngage.com/blog/choropleth-map/)

