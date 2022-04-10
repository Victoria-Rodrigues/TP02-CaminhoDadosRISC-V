module shiftLeft(
    input [63:0] imm,
    output [63:0] saida
);

assign saida = {imm<<1};

endmodule