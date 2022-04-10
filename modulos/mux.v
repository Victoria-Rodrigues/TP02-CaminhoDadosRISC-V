module mux(

    input [63:0] entrada1,
    input [63:0] entrada2,
    input seletor,
    output [63:0] muxOut

);

    reg [63:0] muxOut;

    always @(entrada1, entrada2, seletor)
        case (seletor) // De acordo com o seletor, define-se qual será a saída do módulo
            1'b0:
              muxOut = entrada1;
            1'b1:
              muxOut = entrada2;
        endcase
        

endmodule
