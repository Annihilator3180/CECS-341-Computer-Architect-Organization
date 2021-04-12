`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2021 01:08:27 PM
// Design Name: 
// Module Name: Circuit2
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


module Circuit2(
    input A,
    input B,
    output F2
    );
    
    
    //bitwise and: &
    //bitwise or: |
    //bitwise negation: ~
    //F2 = (A'+b) & (A + B')
    
    assign F2 = (~A | B) & (A | ~B);
    
//    always@(A, B) begin
//        case({A,B})
//            2'b00: F2 = 1'b1;
//            2'b01: F2 = 1'b0;
//            2'b10: F2 = 1'b0;
//            2'b11: F2 = 1'b1;
//        endcase

//    end
    
endmodule
