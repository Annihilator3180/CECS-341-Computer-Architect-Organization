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
    
    wire [31:0] PC_to_PCAdd, PCAdd_to_PC, PC_to_IMem, IMem_out, ALU_to_RF, RF_to_ALU_S, RF_to_ALU_T ; 
    wire [3:0] Cntl_to_ALU;
    wire Cntl_to_RF, ALU_N, ALU_Z, ALU_C, ALU_V;
 
    PC pc (
          .Din(PCAdd_to_PC),
          .Reset(Reset),
          .clock(clock),
          .PC_out(PC_to_IMem)
   );
   
   PC_Add pcadd (
   
                .Din(PC_to_IMem),
                .PC_Add_out(PCAdd_to_PC)
   );
 
   Instruction_Memory im(
                         .Addr(PC_to_IMem), 
                         .Inst_out(IMem_out)                      
    );   
    
    control cntl(
                 .Op(IMem_out[31:26]),
                 .Func(IMem_out[5:0]),
                 .RegWrite(Cntl_to_RF),
                 .ALUCntl(Cntl_to_ALU)
    );    
        
    ALU ALUpath (
                .A(RF_to_ALU_S),
                .B(RF_to_ALU_T),
                .ALUCntl(Cntl_to_ALU),
                .ALUout(ALU_to_RF),    //ALUOut
                .N(ALU_N),             //Negative
                .Z(ALU_Z),             //zero
                .C(ALU_C),             //Carryout
                .V(ALU_V)              //Overflow
   ); 
 
    regfile32 rf(
                .clk(clock), 
                .reset(Reset),
                .D_En(Cntl_to_RF),
                .D_Addr(IMem_out[15:11]),
                .S_Addr(IMem_out[25:21]),
                .T_Addr(IMem_out[20:16]),
                .D(ALU_to_RF),
                .S(RF_to_ALU_S), //rs
                .T(RF_to_ALU_T)  //rt
    );     
    assign Dout = ALU_to_RF;   
endmodule        