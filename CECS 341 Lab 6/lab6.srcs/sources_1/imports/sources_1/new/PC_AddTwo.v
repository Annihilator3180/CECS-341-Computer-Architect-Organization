`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 04:45:19 PM
// Design Name: 
// Module Name: PC_AddTwo
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


module PC_AddTwo(
    input [31:0] PC_in, 
    input [31:0] instruction, 
    output [31:0] PC_out
    );
    
    assign PC_out = PC_in + instruction;
    
endmodule
