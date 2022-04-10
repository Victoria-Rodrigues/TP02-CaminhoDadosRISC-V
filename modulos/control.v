module control(

    input [6:0] entrada,
    output ALUSrc,
    output MemtoReg,
    output RegWrite,
    output MemRead,
    output MemWrite,
    output Branch,
    output [1:0] ALUOp

);
    // parametros para os estados
    parameter opcodeRType = 7'b0110011; 
    parameter opcodeLd = 7'b0000011;
    parameter opcodeSd = 7'b0100011;
    parameter opcodeBeq = 7'b1100011; // Consideramos o opcode do BEQ como este. Ressalta-se pois no livro há 2 opções

    reg ALUSrc;
    reg MemtoReg;
    reg RegWrite;
    reg MemRead;
    reg MemWrite;
    reg Branch;
    reg [1:0] ALUOp;


    always @(entrada)

      case (entrada)
          opcodeRType:
              begin
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite =1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10; 
                
              end

          opcodeLd:
              begin
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 1;
                MemRead = 1;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b00;
              end

          opcodeSd:
              begin
                ALUSrc = 1;
                MemtoReg = 0; //dont care
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 1;
                Branch = 0;
                ALUOp = 2'b00;
              end
          opcodeBeq:
              begin
                ALUSrc = 0;
                MemtoReg = 0; //dont care
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 1;
                ALUOp = 2'b01;
              end
      endcase
    
endmodule
