# ⌨️ _Do it yourself (DIY)_

## 🐢 Passo a passo para aplicar o mapa em GeoJSON

1. Faça o login no SAS® Viya no seu ambiente.
2. Vá até a ferramenta SAS® Studio - Develop SAS Code.
3. Abra um novo SAS Program.

	![Passo 3](/images/GJ_01.png)

4. Copie o código com os parâmetros já definidos e cole no programa.

	![Passo 4](/images/GJ_02.png)

5. Defina o nome da tabela e o local onde será disponibilizada no final do arquivo. No meu caso eu chamarei a tabela de ```MAPA``` na CASLIB ```Public```.

	![Passo 5](/images/GJ_03.png)

6. Salve o seu código.

	![Passo 6](/images/GJ_04.png)

7. Execute todo o seu código clicando em ```run```.

	![Passo 7](/images/GJ_05.png)

8. Depois do código executado sem erros, vá agora até a ferramenta SAS® Visual Analytics - Explorar e visualizar.
9. Para efeito de teste, usaremos a própria tabela que criamos, mas você pode usar na tabela de negócios. Certifique-se que a sua tabela contenha o código do município de acordo com o IBGE. e com a mesma tipagem de dados (VARCHAR).
10. Duplique a coluna ```id``` e altere a classificação para Geografia.

	![Passo 10.1](/images/GJ_06.png)

	![Passo 10.2](/images/GJ_07.png)

11. Na nova tela, coloque os mesmos parâmetros na _print_ abaixo.

	![Passo 11.1](/images/GJ_08.png)

	![Passo 11.2](/images/GJ_09.png)

	![Passo 11.3](/images/GJ_10.png)

	![Passo 11.4](/images/GJ_11.png)

12. Ao terminar todos os parâmetros, vá em *Objetos* e arraste a *Região geográfica* para a tela gráfica.

	![Passo 12](/images/GJ_12.png)

13. Em *Atribuir dados*, selecione em *Geografia* o mapa que você criou nos passos anteriores.

	![Passo 13.1](/images/GJ_13.png)

	![Passo 13.2](/images/GJ_14.png)

14. Se você executou todos os passos corretamente, você deve visualizar o mapa com as regiões plotadas.

	![Passo 14](/images/GJ_15.png)