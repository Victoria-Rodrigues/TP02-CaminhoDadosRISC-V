module instruMemory(
  
    input [63:0] posicao_nova, // Recebe o PC, que corresponde à quatro vezes a posição do vetor
    output [31:0] instrucao 
    
);

    reg [31:0] memoria[0:150]; // Aqui definiu-se o número máximo de instruções como 150 (Pode ser alterado!)

    initial begin
        $readmemb("entradas/instrucao.txt", memoria);
    end
    
    assign instrucao = memoria[posicao_nova/4]; // Divide-se por 4 para acessar a posição correta da memória
    
endmodule