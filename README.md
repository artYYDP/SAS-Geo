
![Banner](https://www.dropbox.com/scl/fi/x62viztv3tdzehb2itdxb/Banner-Repo.png?rlkey=jmp48k3tjsukxlel4ejpilnor&st=czsd5p0r&raw=1)

Um mapa coroplético é um mapa temático usado para representar dados estatísticos usando a técnica de simbologia de mapeamento de cores.<sub>[[1]](#-refer%C3%AAncia)</sub>

## Índice de Conteúdo

- [Uso no SAS Visual Analytics (VA)](#-uso-no-sas-visual-analytics-va)
- [Códigos](#%EF%B8%8F-c%C3%B3digos)
	- [GeoJSON](#%EF%B8%8F-geojson)
	- [Shapefile](#%EF%B8%8F-shapefile)
- [Faça você mesmo](#-faça-você-mesmo-diy)
- [Licença](#-licen%C3%A7a)
- [Autores](#-autores)
- [Agradecimentos](#-agradecimentos)
- [Referência](#-refer%C3%AAncia)

## 👨‍💻 Uso no SAS Visual Analytics (VA)

Esses repositório tem como função ajudar os programadores e analistas SAS a execução dos mapas de uma maneira simples e rápida, que possa ser replicada em vários projetos.

<small>[Clique aqui para visualizar o mapa de Curitiba-PR plotado](/example.json)</small>

## ⚙️ Códigos

Há duas maneiras de se fazer o uso de mapa no SAS VA:

1. Por arquivo [GeoJSON](#%EF%B8%8F-geojson)
2. Por arquivo [Shapefile](#%EF%B8%8F-shapefile)

Ambos os métodos tem suas particularidades.

> [!IMPORTANT]
> Tenha certeza que o link esteja correto. Antes de substituir qualquer mapa, certifique-se de criar um novo para testá-lo.
>

> [!CAUTION]
> Não nos responsabilizamos pelo uso indevido do código.
>

### 🗺️ GeoJSON

O GeoJSON é um formato padrão aberto projetado para representar recursos geográficos simples, juntamente com seus atributos não espaciais. É baseado na JSON (JavaScript Object Notation). Os recursos incluem pontos (portanto endereços e locais), sequências de linhas (portanto ruas, rodovias e limites), polígonos (países, províncias, terrenos) e coleções com várias partes desses tipos. <sub>[[2]](#-refer%C3%AAncia)</sub>

São arquivos mais leves em comparação aos demais, porém são limitados, pois funcionam com aquela quantidade de coordenadas e, caso você tenha que alterar alguma coordenada, possivelmente o mesmo não irá plotar corretamente no gráfico, principalmente quando a região contém Multipolígonos, como ilhas, por exemplo.

Fora esse detalhe, o formato GeoJSON é rápido e bem útil quando você tem um ambiente SAS muito limitado a importar ou exportar arquivos. O GeoJSON pode ser facilmente "coletado" via http, desde que o link seja funcional e que não altere o local.

Deixamos um repositório público disponível [aqui](https://github.com/tbrugz/geodata-br).

Segue um exemplo de uso do código no SAS. O código está todo documentado para facilitar o uso.

[Clique aqui](/codes/Código%20do%20Mapa%20Coroplético%20(GeoJSON).sas) para visualizar o código.

### 🗺️ Shapefile

O Esri Shapefile ou simplesmente shapefile é um formato popular de arquivo contendo dados geoespaciais em forma de vetor usado por Sistemas de Informações Geográficas também conhecidos como SIG. Foi desenvolvido e regulamentado pela ESRI como uma especificação aberta para interoperabilidade por dados entre os softwares de Esri e de outros fornecedores.

Shapefiles espacial descrevem geometrias: pontos, linhas, e polígonos. Entre outras coisas, essas geometrias podem representar Poços, Rios, e Lagos, respectivamente. Cada item pode ter atributos que os descrevem, por exemplo: nome, temperatura ou profundidade.<sub>[[3]](#-refer%C3%AAncia)</sub>

São arquivos mais pesados em comparação aos demais, pois podem ser extremamente detalhistas com bairros e cidades. As ilhas também ficam plotadas corretamente no gráfico.

Porém, exige mais conhecimento de detalhes técnicos sobre como o arquivo funciona.

Você pode encontrar os arquivos Shapefile diretamente no site do [IBGE](https://www.ibge.gov.br/geociencias/organizacao-do-territorio/malhas-territoriais/15774-malhas.html).

Abaixo segue um exemplo de uso do código no SAS. O código está todo documentado para facilitar o uso.

[Clique aqui](/codes/Código%20do%20Mapa%20Coroplético%20(Shapefile).sas) para visualizar o código.

## 👐🏼 Faça Você Mesmo (DIY)

- [Faça você mesmo com código GeoJSON](/diy/geojson.md)
- [Faça você mesmo com código Shapefile](/diy/shapefile.md)

## 🔑 Licença

[CC0 1.0 Universal](/LICENSE)

## 🧑‍💼 Autores

- [Arthur Diego Pereira](https://www.linkedin.com/in/arthurdiegopereira/)
- [Geiziane Silva de Oliveira](https://www.linkedin.com/in/geiziane-oliveira-0a5882110/)

## 🫂 Agradecimentos

- [Telmo Brugnara](https://github.com/tbrugz) por disponibilizar publicamente o repositório [Geodata BR - Brasil](https://github.com/tbrugz/geodata-br)

## 📗 Referência

 - [GeoJSON](https://geojson.org/)
 - [Instituto Brasileiro de Geografia e Estatística - IBGE](https://www.ibge.gov.br/geociencias/organizacao-do-territorio/malhas-territoriais/15774-malhas.html)
 - [What is a Choropleth Map and How To Create One](https://venngage.com/blog/choropleth-map/)
 - [What is a shapefile?](https://desktop.arcgis.com/en/arcmap/latest/manage-data/shapefiles/what-is-a-shapefile.htm)
