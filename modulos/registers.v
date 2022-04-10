module register(
    
    input clk,
    input regWrite,
    input [4:0] readRegister1,
    input [4:0] readRegister2,
    input [4:0] writeRegister,
    input [63:0] writeData,
    output [63:0] readData1,
    output [63:0] readData2

);
    
    reg [63:0] registradores[0:31]; // Temos no Risc-V, 32 registradores de 64 bits cada

    initial begin
        $readmemb("entradas/registradores.txt", registradores);
    end

    // Caso o regWrite seja 1 (indicando a atualização do vetor), o valor em questão é atualizado
    always @(posedge clk) 
        if(regWrite == 1) 
            begin
                if(writeRegister != 0) 
                    begin
                        registradores[writeRegister] = writeData;
                    end
             end

    assign readData1 = registradores[readRegister1];
    assign readData2 = registradores[readRegister2];

endmodule