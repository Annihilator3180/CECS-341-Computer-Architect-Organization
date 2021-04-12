`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2021 12:05:09 PM
// Design Name: 
// Module Name: Circuit2_tb
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


module Circuit2_tb();

    // Inputs of the UUT
    // Always declared as "reg"
    reg A_tb; //1 bit wide
    reg B_tb;
    
    // Outputs of UUT
    wire F2_tb;
    
    // Testbench Internal Signals
    integer i; //32 bits
    
    // instantiate uut
     Circuit2 uut(.A(A_tb), .B(B_tb), .F2(F2_tb));
     
     
     initial begin
        $timeformat(-9, 1, " ns", 9);
        $display(" ");
        $display("CECS 341 Lab Circuit 2 Testbench ");
        $display(" ");
        
        // Define Test Cases
        for(i=0; i < 4; i = i + 1) begin
            {A_tb, B_tb} = i; //2 bits total // 2 bit concantenation //{A_tb, B_tb} = i[31];
            #5 $display("time=%t A=%0b B=%0b || F2=%0b", $time, A_tb, B_tb, F2_tb);
        end
        $finish; 
     end
endmodule