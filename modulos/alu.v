module alu(

    input [63:0] valor1, 
    input [63:0] valor2,
    input [3:0] ALUcontrol,
    output zero,
    output [63:0] ALUresult

);
  
    reg [63:0] ALUresult;

    always @(valor1, valor2, ALUcontrol)

      case (ALUcontrol)
          4'b0000: //AND
              begin
                ALUresult = valor1 & valor2;
              end

          4'b0001: //OR
              begin
                ALUresult = valor1 | valor2;
              end

          4'b0010: //ADD
              begin
                ALUresult = valor1 + valor2;
              end
          4'b0110: //SUB
              begin
                ALUresult = valor1 - valor2;
              end
      endcase
    
    // Verifica se o resultado da operação foi equivalente a zero
    assign zero = (ALUresult == 0);
   
endmodule
