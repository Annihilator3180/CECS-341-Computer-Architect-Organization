`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2021 09:53:54 PM
// Design Name: 
// Module Name: adder_2bit
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


module adder_2bit(
    input [1:0] A,
    input [1:0] B,
    output [2:0] Sum_out
    );
    
    wire Carry_0, Carry_1, Sum_0, Sum_1;
    localparam ZERO = 1'b0;
    
    assign Sum_out = {Carry_1, Sum_1, Sum_0};
    
    FA
        FA_0(.A(A[0]), .B(B[0]), .c_in(ZERO), .c_out(Carry_0), .sum(Sum_0)),
        FA_1(.A(A[1]), .B(B[0]), .c_in(Carry_0), .c_out(Carry_1), .sum(Sum_1));        

endmodule
