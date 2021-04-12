`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2021 05:30:45 PM
// Design Name: 
// Module Name: Circuit1
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


module Circuit1(
    input A,
    input B,
    input C,
    output F1
    );
    assign F1 = (A & B) | (~A & C) | (A & ~B & ~C); 
    
    
//    always@(A, B, C) begin
//        case({A,B,C})
//            3'b000: F1 = 1'b0;
//            3'b001: F1 = 1'b1;
//            3'b010: F1 = 1'b0;
//            3'b011: F1 = 1'b1;
//            3'b100: F1 = 1'b1;
//            3'b101: F1 = 1'b0;
//            3'b110: F1 = 1'b1;
//            3'b111: F1 = 1'b1;
//        endcase

//    end
    
    
endmodule
