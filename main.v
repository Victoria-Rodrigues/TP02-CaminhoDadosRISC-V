`include "modulos/control.v"
`include "modulos/immediate.v"
`include "modulos/alucontrol.v"
`include "modulos/mux.v"
`include "modulos/alu.v"
`include "modulos/instruMemory.v"
`include "modulos/registers.v"
`include "modulos/shiftLeft.v"
`include "modulos/add.v"
`include "modulos/pc.v"
`include "modulos/dataMemory.v"

module main(input clk);

    // INSTRUCTION MEMORY
    wire [31:0] instrucao;

    // CONTROL
    wire ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    wire [1:0] ALUOp;

    // IMMEDIATE
    wire [63:0] imediatoExtendido;

    // ALUCONTROL
    wire [3:0] ALUcontrol;

    // REGISTERS
    wire [63:0] ReadData1, ReadData2;

    // MUX
    wire [63:0] muxOutRegImm, muxOutPc, muxOutDataMemory;

    //ALU
    wire Zero;
    wire [63:0] ALUresult;

    //ADD
    wire [63:0] pcMais4Out, pcMaisImmOut;
    wire seletorPc;
    assign seletorPc = Branch & Zero;
    
    //PC
    wire [63:0] pc;

    //DATA MEMORY
    wire [63:0] ReadData;
    wire [63:0] dataMemories [0:100];

    //SHIFT LEFT
    wire [63:0] imediatoDeslocado;



    //CONECTANDO OS MÓDULOS

    pc pcLigado(clk, muxOutPc, pc);

    instruMemory instructionMemory(pc, instrucao); 

    control ctrl(instrucao[6:0], ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
    
    register regs(clk, RegWrite, instrucao[19:15], instrucao[24:20], instrucao[11:7], muxOutDataMemory, ReadData1, ReadData2);

    immediate imm(instrucao, imediatoExtendido);

    mux muxRegImm(ReadData2, imediatoExtendido, ALUSrc, muxOutRegImm);

    alucontrol aluctrl(instrucao, ALUOp, ALUcontrol);
    
    alu aluModule(ReadData1, muxOutRegImm, ALUcontrol, Zero, ALUresult);

    dataMemory dataMem(clk, ALUresult, ReadData2, MemWrite, MemRead, ReadData);

    mux muxDataMemory(ALUresult, ReadData, MemtoReg, muxOutDataMemory);

    add pcMais4(pc, 64'd4, pcMais4Out); // O verilog converte pra binario este valor inteiro
    shiftLeft shiftLeftImm(imediatoExtendido, imediatoDeslocado);
    add pcMaisImm(pc, imediatoDeslocado, pcMaisImmOut);
    mux muxPc(pcMais4Out, pcMaisImmOut, seletorPc, muxOutPc);
    


endmodule
