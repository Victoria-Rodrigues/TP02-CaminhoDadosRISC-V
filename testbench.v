`include "main.v"

module testbench();
  
    reg clk = 0;

    main caminhoDeDados(clk); // Inclusão do módulo que relaciona todos os módulos do caminho de dados

    integer i;
    
    initial begin
        #0
        
        $dumpfile("testbench.vcd");
        $dumpvars(0, caminhoDeDados);

        // Os códigos abaixo são responsáveis por permitir a visualização das matrizes criadas nos módulos dataMemory e registers no GTKWave
        for(i=0; i<64; i= i+1) begin
            $dumpvars(2, caminhoDeDados.dataMem.dataMemories[i]);
        end
        
        for(i=0; i<32; i= i+1) begin
            $dumpvars(2, caminhoDeDados.regs.registradores[i]);
        end

        #500 $finish;

        
    end

    always #1 clk=~clk; // Garante a variação do clock

endmodule