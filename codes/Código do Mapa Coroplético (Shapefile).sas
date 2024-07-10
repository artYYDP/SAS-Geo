/* CÓDIGO PARA CRIAÇÃO DE UM MAPA COROPLÉTICO NO SAS DE ARQUIVO SHAPEFILE */
/* Versão: 3.6 */
/* Status: Finalizado */
/* Autor: Geiziane Silva de Oliveira */
/* Contribuição: Arthur Diego Pereira */
/*  */
/* FAVOR NÃO REMOVER OS CRÉDITOS */
/*  */

/* 1. Inicia a sessão CAS */
cas minhasessao sessopts=(caslib=public locale="pt_BR");

/* 2. Lista todas as CASLIB */
caslib _all_ list;
caslib _all_ assign;
options casdatalimit=all;

/* 3. Define macros para os caminhos e nomes dos arquivos */
%let filepath=/CASLIB_XYZ; /* Substituir pela CASLIB que tem o arquivo shapefile  */
%let shapename=BR_Municipios_2022.shp; /* Substituir pelo nome do arquivo shapefile  */
%let outcaslib=Public;
%let outcasdata=SAS_MAP; /* Substituir pelo nome do seu mapa  */

/* 4. Remove a tabela CAS existente, se houver */
proc casutil;
droptable incaslib = "&outcaslib." casdata = "&outcasdata." quiet;
run;

/* 5. Examina o conteúdo do Shapefile */
%SHPCNTNT(SHAPEFILEPATH=&filepath.&shapename.); /* Analise o nome da coluna com o identificador único de cidade. Nesse caso é o CD_MUN */

/* 6. Importa o Shapefile para a tabela CAS */
%SHPIMPRT(shapefilepath=&filepath.&shapename.,
	id=CD_MUN, /* Coloque aqui o id da etapa anterior (CD_MUN) */
	outtable=&outcasdata.,
	cashost=&_CASHOST_.,
	casport=&_CASPORT_.,
	caslib='Public',
	reduce=1); /* A opção reduce=1 é utilizada para reduzir a complexidade dos dados geográficos importados */

/* 7. Reconecta à sessão CAS */
options sessref=minhasessao;
cas minhasessao reconnect;

/* 8. Filtra e prepara os dados */
data &outcaslib..&outcasdata._ (copies=0);
	/* Usamos o segment=1 para filtrar somente polígonos */
	/* Usamos o density>4 para filtrar a densidade de detalhes nos mapas */
	set &outcaslib..&outcasdata. (where = (segment=1 and density<4
	/* Caso necessário selecionar somente o estado, modifique a UF */
	and sigla_uf='SP'
	));
run;

/* 9. Remove a tabela temporária e promove a tabela final */
proc casutil;
droptable incaslib = "&outcaslib." casdata = "&outcasdata." quiet;
run;

proc casutil;
promote incaslib = "&outcaslib." casdata = "&outcasdata._" outcaslib= "&outcaslib" casout="&outcasdata";
run;