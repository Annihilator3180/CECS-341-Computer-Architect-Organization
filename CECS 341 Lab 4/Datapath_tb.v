`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 12:07:29 PM
// Design Name: 
// Module Name: Datapath_tb
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


module Datapath_tb();

    //Declare inputs to UUT (as reg)
    reg clock;
    reg Reset;
    
    // Declare output of uut (as wires)
    wire Dout;
    
    // Testbench specific
    integer i;
    
    // UUT instantiation
    Datapath uut(
        .clock(clock),
        .Reset(Reset),
        .Dout(Dout)
    );  
    
     // clock generation logic
     always
        #10 clock = ~clock;
    
     initial begin
        clock = 0;
        Reset = 0;
      end
                 
     task Dump_RegFile; begin
        $timeformat(-9,1, " ns", 9);
        for(i=0; i<32; i=i+1) begin
            @(posedge clock)
            $display("t=%t  rf[%0d]:  %h",
                      $time, i, uut.rf.regArray[i]);
        end   
     end
     endtask         
                         
     initial begin
        $readmemh("regfile.dat",uut.rf.regArray);
        $readmemh("imem.dat", uut.im.imem);    
        
        Reset = 1;
        #20 $display("t=t%t Dout=%h", $time, Dout);
        for(i = 0; i < 10; i=i+1)begin
            Reset = 0;
            #20 $display("t=t%t Dout=%h", $time, Dout);
        end      
        Dump_RegFile;
        $finish;
       
     end     
endmodule