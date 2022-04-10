<p align="center">
  <img width="350" height="350" alt="montador-risc-v" src="https://user-images.githubusercontent.com/81054281/162596242-55a0fdeb-4888-4cad-a8d7-25eb163fc326.png">
</p>


<h1 align="center">Trabalho prático - Organização de Computadores I</h1>

<p align="center">Versão simplificada do caminho de dados do RISC-V</p>

![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=FINALIZADOO&color=GREEN&style=for-the-badge)


## Descrição do Projeto

O presente trabalho consiste na implementação de uma versão simplificada do caminho de dados do RISC-V, o qual receberá um arquivo com instruções de 32 bits, outro com 32 registradores de 64 bits e, por fim, um arquivo com valores de memórias de dados com 64 bits cada. As entradas serão recebidas por arquivos com extensão "txt", um valor por linha, enquanto a saída é apresentada no visualizador de formas de onda GTKWave. A partir do visualizador, é possível analisar os valores dos fios e registradores dos módulos em cada ciclo de clock.


## ✔️ Técnicas e tecnologias utilizadas

- ``linguagem de descrição de hardware: Verilog``
- ``GTKWave``
- ``Icarus Verilog``

## 🔨 Funcionalidades do projeto

Para relacionar os módulos criou-se um arquivo "main.v", que inclui e conecta todos os segmentos do caminho de dados. Já o "testbench.v" basicamente inclui o módulo "main.v", define o clock e sua variação, e é o arquivo selecionado pelo comando "iverilog", do Icarus Verilog, para compilar o sistema criado.
 
