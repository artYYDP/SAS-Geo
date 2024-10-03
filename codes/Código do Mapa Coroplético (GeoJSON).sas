/* CÓDIGO PARA CRIAÇÃO DE UM MAPA COROPLÉTICO NO SAS DE ARQUIVO GEOJSON (ONLINE) */
/* Versão: 1.4 */
/* Status: Finalizada */
/* Autor: Arthur Diego Pereira */
/* Contribuição: Geiziane Silva de Oliveira */
/*  */
/* FAVOR NÃO REMOVER OS CRÉDITOS */
/*  */

/* 1. Fazer o Download do Arquivo GeoJSON do Github */
filename mapa temp;

proc http
	url="https://github.com/artYYDP/SAS-Geo/raw/ec010701f6d63a71ddcd8fd9fe42307b7c425bed/geojson/Por%20estado/PR-41.geojson"
	method="GET"
	out=mapa;
run;

/* 2. Ler o Arquivo GeoJSON usando a Biblioteca JSON */
libname jsonlib json fileref=mapa;

/* 3. Examinar a Estrutura do GeoJSON */
proc contents data=jsonlib._all_;
run;

/* 4. Unir as tabelas */
data map_data;
    merge jsonlib.features_properties 
          jsonlib.features_geometry (keep=ordinal_features ordinal_geometry type);
    by ordinal_features;
run;

/* 5. Preparar os dados para o gráfico GMAP */
data map_data;
    merge map_data
          jsonlib.geometry_coordinates;
    by ordinal_geometry;
run;

/* 6. Preparar os dados para a Plotagem */
data plot_data (drop=element1 element2);
    set map_data;
    x = element1;
    y = element2;
    i = 1;
    output;
run;

/* 7. Adicionar sequencia */
data plot_data;
set plot_data;
seqno=_n_;
run;

/* 8. Macro para Carregar Dados no CAS e Promover a Tabela */
%macro sas_load_data_cas(incaslib=,casdata=,data=,outcaslib=, casout=);

/* 8.1. Deleta a tabela da memória */
proc casutil;
droptable incaslib = "&outcaslib." casdata = "&casdata." quiet;
run;

/* 8.2. Carrega tabela no CAS*/
proc casutil;
  load data=&data. casout="&casout." outcaslib=&outcaslib. replace;
quit;

/* 8.3. Promove a tabela (disponível para todos os usuário acesso ao servidor) */
proc casutil;
promote incaslib = "&outcaslib." casdata = "&casdata."
outcaslib = "&outcaslib." casout = "&casout.";
quit;
%mend sas_load_data_cas;
%sas_load_data_cas(incaslib=Public,casdata=MAPA,data=plot_mapa,outcaslib=Public, casout=MAPA)