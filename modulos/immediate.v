module immediate(

    input [31:0] instrucao,
    output [63:0] imediatoExtendido

);
    parameter opcodeRType = 7'b0110011; 
    parameter opcodeLd = 7'b0000011;
    parameter opcodeSd = 7'b0100011;
    parameter opcodeBeq = 7'b1100011;

    reg [11:0] imediatoExt;

    wire [6:0] opcode = {instrucao[6:0]};

    always @(*)

      case (opcode)
          opcodeRType:
              begin
                // Como o R Type não tem imediato, colocamos zero, por padrão. Não fará diferença pois não será utilizado
                imediatoExt = 12'b000000000000;
              end

          opcodeLd:
              begin
                imediatoExt = {instrucao[31:20]};
              end

           opcodeSd:
              begin
                imediatoExt = {instrucao[31:25], instrucao[11:7]};
              end
          opcodeBeq:
              begin
                imediatoExt = {instrucao[31], instrucao[7], instrucao[30:25], instrucao[11:8]};
              end
      endcase
    
    // Código para extender o imediato. Primeiramente repete-se 52 vezes o bit de sinal e depois concatena-se com o restante do imediato
    assign imediatoExtendido = {{52{imediatoExt[11]}}, {imediatoExt[11:0]}};

endmodule
