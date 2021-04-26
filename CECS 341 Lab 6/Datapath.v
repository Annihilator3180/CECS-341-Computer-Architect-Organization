`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 12:10:06 PM
// Design Name: 
// Module Name: Datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Datapath(
    input clock,
    input Reset,
    output [31:0] Dout
    );
    
    wire [31:0] Sign_Extend_Out, Shift_Left_Out, Branch_PC_Add_Out, PC_Add_Out, PC_Out, ALU_Out, DataMem_Out, Inst, S, T ; 
    wire [3:0] ALUCntl;
    wire RegWrite, RegDst, MemRead, MemWrite, MemToReg, ALUSrc, N, Z, C, V;
    wire [1:0] Branch;
   
    
    // Output Wires for muxes
    wire [4:0] RegDst_Mux;   // Control RegDST MUX
    wire Branch_Select;
    wire [31:0] Branch_Mux;  // Adder MUX
    wire [31:0] PC_Out_Mux;  // MUX FOR ALU
    wire [31:0] MemToReg_Mux; // Data Memory MUX
    
    // Second Adder
    wire [31:0] sign_OUT;
    wire [31:0] shift_OUT;
    wire [31:0] adder2_OUT;
    
    // Create logic for muxes
    assign RegDst_Mux = (RegDst == 1'b1) ? Inst[15:11] : Inst[20:16];
    assign Branch_Select = (Branch[0] & Z) | ((~Z) & Branch[1]);
    assign Branch_Mux =(Branch_Select == 1'b1) ? adder2_OUT : PC_Add_Out;
    assign MemToReg_Mux = (MemToReg == 1'b1) ? DataMem_Out : ALU_Out;
    assign PC_Out_Mux = ALUSrc ? sign_OUT : T;
    
    // WIRE FOR LAB 6
    wire [31:0] jumpAddr;
    wire jump;
    
    // MUX FOR LAB 6
    wire [31:0] Jump_Mux;
    
     // ASSIGN NEW WIRE FROM LAB 6
    assign jumpAddr = {PC_Add_Out[31:28], Inst[25:0] << 2, 2'b0};
    
    // NEW MUX FROM LAB 6
    assign Jump_Mux = (jump) ? jumpAddr : Branch_Mux;
    
    PC pc (
          .Din(Jump_Mux),
          .Reset(Reset),
          .clock(clock),
          .PC_out(PC_Out)
   );
   
   PC_Add pcadd (
   
                .Din(PC_Out),
                .PC_Add_out(PC_Add_Out)
   );
   
   PC_AddTwo pcadd2(.PC_in(PC_Add_Out),
                  .instruction(shift_OUT),
                  .PC_out(adder2_OUT));
 
   Instruction_Memory im(
                 .Addr(PC_Out), 
                 .Inst_out(Inst)                      
    );   
    
    control cntl(
                 .Op(Inst[31:26]),
                 .Func(Inst[5:0]),
                 .RegWrite(RegWrite),
                 .ALUCntl(ALUCntl),
                 .RegDst(RegDst),
                 .Branch(Branch),
                 .MemRead(MemRead),
                 .MemWrite(MemWrite),
                 .ALUSrc(ALUSrc),
                 .MemToReg(MemToReg),
                 .jump(jump)
                 
    );    
        
    ALU ALUpath (
                .A(S),
                .B(PC_Out_Mux),
                .ALUCntl(ALUCntl),
                .ALUout(ALU_Out),    //ALUOut
                .N(N),             //Negative
                .Z(Z),             //zero
                .C(C),             //Carryout
                .V(V)              //Overflow
   ); 
 
    regfile32 rf(
                .clk(clock), 
                .reset(Reset),
                .D_En(RegWrite),
                .D_Addr(RegDst_Mux),
                .S_Addr(Inst[25:21]),
                .T_Addr(Inst[20:16]),
                .D(MemToReg_Mux),
                .S(S), //rs
                .T(T)  //rt
    );     
    assign Dout = ALU_Out;     
 
    ShiftLeftTwo sl2(
                 .Inst(sign_OUT),
                 .InstOut(shift_OUT)); 
        
    SignExtended se(
                .Inst(Inst[15:0]), 
                .InstOut(sign_OUT)

    );   
    
    DataMem dm(
                .clk(clock),
                .mem_wr(MemWrite),
                .mem_rd(MemRead),
                .addr(ALU_Out),
                .wr_data(T),
                .rd_data(DataMem_Out)   
                           
    );    
    
    
    ShiftLeftTwo_2 sl3(
                .Inst(Inst[25:0]),
                .jumpAddr(jumpAddr)
                
    );            
endmodule        