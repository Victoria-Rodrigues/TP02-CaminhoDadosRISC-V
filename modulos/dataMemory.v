module dataMemory(

    input clk,
    input [63:0] address,
    input [63:0] writeData,
    input memWrite,
    input memRead,
    output [63:0] readData 
    
);

    reg [63:0] dataMemories[0:100]; // 100 é um valor arbitrario correspondente ao número máximo de linhas do arquivo

    assign readData = dataMemories[address];

    initial begin
        $readmemb("entradas/dataMemory.txt", dataMemories);
    end

    // Caso seja para atualizar a memória, ela é alterada na borda positiva do clock
    always @(posedge clk) 
      if(memWrite == 1)
          begin
              dataMemories[address] = writeData;
          end
    
      
    
    

endmodule