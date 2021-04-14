`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2021 12:18:57 PM
// Design Name: 
// Module Name: PC_Add
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


module PC_Add(
    input [31:0] Din,
    output [31:0] PC_Add_out
    );
    
    assign PC_Add_out = Din + 32'b0100;
    
endmodule
