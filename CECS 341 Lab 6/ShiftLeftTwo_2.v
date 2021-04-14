`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2021 11:05:41 AM
// Design Name: 
// Module Name: ShiftLeftTwo_2
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

//fix code

module ShiftLeftTwo_2(
    input [25:0] Inst, 
    output [31:0] jumpAddr
);

    assign jumpAddr = Inst << 2;

endmodule
