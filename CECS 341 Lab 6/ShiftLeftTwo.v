`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 12:28:25 PM
// Design Name: 
// Module Name: ShiftLeftTwo
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


module ShiftLeftTwo(
    input [31:0] Inst, 
    output [31:0] InstOut
);

    assign InstOut = Inst << 2;
    
endmodule


