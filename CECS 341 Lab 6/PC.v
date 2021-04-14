`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2021 12:18:09 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input clock,
    input Reset,
    input [31:0] Din,
    output reg [31:0] PC_out
    );
    
    always@(posedge clock, posedge Reset)
        begin
            if(Reset)
                PC_out <= 32'b0;
            else
                PC_out <= Din ;
        end        
endmodule