module alucontrol(

    input [31:0] instrucao,
    input [1:0] ALUOp,
    output [3:0] ALUcontrol

);

    reg [3:0] ALUctrl;

    // funct3 e funct7 são utilizadas para diferenciar instruções com o mesmo ALUOp
    wire [2:0] funct3 = {instrucao[14:12]};
    wire [6:0] funct7 = {instrucao[31:25]};

    initial begin
      ALUctrl = 4'b0000; // Inicializado com zero pra evitar "dont cares"
    end

    always @(*)

      case (ALUOp)
          2'b00:
              begin
                ALUctrl = 4'b0010;
              end

          2'b01:
              begin
                ALUctrl = 4'b0110;
              end

          2'b10:
              begin
                if (funct3 == 3'b111)
                  begin
                    ALUctrl = 4'b0000;
                  end 
                else if (funct3 == 3'b110)
                  begin
                    ALUctrl = 4'b0001;
                  end 
                else if (funct3 == 3'b000) 
                  begin
                    if (funct7 == 7'b0000000)
                      begin
                        ALUctrl = 4'b0010;
                      end
                    else
                      begin
                        ALUctrl = 4'b0110;
                      end
                  end
                  
              end
      endcase

  assign ALUcontrol = {ALUctrl[3:0]};

endmodule
