# ⌨️ _Do it yourself (DIY)_

## 🐢 Passo a passo para aplicar o mapa em Shapefile

<details>

<summary>Clique aqui para visualizar o passo a passo</summary>

1. Antes, certifique-se que colocou os dados do Shapefile em uma CASLIB específica. Geralmente você terá que pedir para um Administrador SAS para fazer isso.

	![Passo 1](/images/SH_01.png)

2. Depois, com o caminho do arquivo em mãos, faça o login no SAS® Viya no seu ambiente.
3. Vá até a ferramenta SAS® Studio - Develop SAS Code.
4. Abra um novo SAS Program.
5. Copie e cole o código e altere os parâmetros de acordo com o que você deseja. Nesse caso, faremos um mapa do Estado do Rio de Janeiro.

	![Passo 5](/images/SH_02.png)

	![Passo 5](/images/SH_03.png)

6. Salve o seu código, caso ache necessário. Depois, execute o código clicando em ```run```.

	![Passo 6](/images/SH_04.png)

7. Depois do código executado sem erros, vá agora até a ferramenta SAS® Visual Analytics - Explorar e visualizar.
8. Para efeito de teste, usaremos a própria tabela que criamos, mas você pode usar na tabela de negócios. Certifique-se que a sua tabela contenha o código do município de acordo com o IBGE.
9. Crie um novo relatório e vá em adicionar dados. Selecione a tabela criada final. No nosso caso, usaremos ```SAS_MAP_RJ```.

	![Passo 9](/images/SH_05.png)

10. Duplique a coluna ```CD_MUN``` e altere a classificação para Geografia.

	![Passo 10](/images/SH_06.png)

11. Na nova tela, coloque os mesmos parâmetros na _print_ abaixo.

	![Passo 11.1](/images/SH_07.png)

	![Passo 11.2](/images/SH_08.png)

	![Passo 11.3](/images/SH_09.png)

	![Passo 11.4](/images/SH_10.png)

12. Veja que, se aparecer a área corretamente protada no mapa, significa que você seguiu os passos corretamente. Agora, vá em *Objetos* e arraste a *Região geográfica* para a tela gráfica.

	![Passo 12](/images/GJ_12.png)

13. Em *Atribuir dados*, selecione em *Geografia* o mapa que você criou nos passos anteriores.

	![Passo 13.1](/images/GJ_13.png)

	![Passo 13.2](/images/SH_11.png)

14. Se você executou todos os passos corretamente, você deve visualizar o mapa com as regiões plotadas.

	![Passo 14](/images/SH_12.png)

15. Você pode alterar o _Design_ do mapa como quiser. Abaixo um Exemplo de Como você pode colocar.

	![Passo 15](/images/SH_13.png)

</details>