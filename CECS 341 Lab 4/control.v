`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 12:56:52 PM
// Design Name: 
// Module Name: control
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


module control(
    input [31:0] A,
    input [31:0] B,
    input [5:0] Op,
    input [5:0] Func,
    output reg RegWrite,
    output reg [3:0] ALUCntl
    );
    
    reg signed [31:0] A_s, B_s;
    
    
    always@(*) begin
    A_s = A;
    B_s = B;
        if (Op == 6'b0) begin
            RegWrite = 1'b1;
            case(Func)
            6'h20: ALUCntl = 4'b1010;    //Add signed
            6'h21: ALUCntl = 4'b0010;    //Add unsigned
            6'h22: ALUCntl = 4'b1110;    //Sub signed
            6'h23: ALUCntl = 4'b0110;    //Sub unsigned
            6'h24: ALUCntl = 4'b0000;    //AND
            6'h25: ALUCntl = 4'b0001;    //OR
            6'h26: ALUCntl = 4'b0011;    //XOR
            6'h27: ALUCntl = 4'b1100;    //NOR
            6'h2A: ALUCntl = 4'b1101;    //Set less than
            6'h2B: ALUCntl = 4'b1111;    //Set less than unsigned
  
            default: ALUCntl = 4'bxxxx;  //default to AND
            endcase
        end
        else begin
            RegWrite = 1'b0;
            ALUCntl = 4'bxxxx;
        end
    end
endmodule