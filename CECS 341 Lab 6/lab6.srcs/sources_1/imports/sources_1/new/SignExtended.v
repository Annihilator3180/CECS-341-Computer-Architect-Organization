`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 12:28:00 PM
// Design Name: 
// Module Name: SignExtended
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


module SignExtended(
    input [15:0] Inst,
    output  [31:0] InstOut
    );
    
    assign InstOut = {{16{Inst[15]}}, Inst[15:0]}; 
    
endmodule
