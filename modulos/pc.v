module pc(
    input clk,
    input [63:0] novoPc,
    output [63:0] pc

);

  reg [63:0] pcReg;

  initial begin
    pcReg = 64'b0; // Inicia-se com zero, assim como as posições de um vetor
  end

  always @(posedge clk) 
    pcReg = novoPc;

  assign pc = pcReg;
    
endmodule