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
    wire [31:0] Dout;
    
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
             
//     task Dump_RegFile; begin
//        $timeformat(-9,1, " ns", 9);
//        for(i=0; i<32; i=i+1) begin
//            @(posedge clock)
//            $display("t=%t  rf[%0d]:  %h",
//                      $time, i, uut.rf.regArray[i]);
//        end   
//     end
//     endtask
        
        task Dump_DataMem; 
        begin
        $timeformat(-9, 1, " ns", 9);
        $display(" "); 
        $display("********************************************************************************************");
        $display(" C E C S  3 4 1  L A B  6  T E S T B E N C H ");
        $display("********************************************************************************************");
        $display(" "); 
        $display("Initial Values:");
        for(i = 0; i < 17; i = i + 4) begin
            @(posedge clock)
            $display("t = %t DataAddress = [%0d]: %h%h%h%h", $time, i, uut.dm.dmem[i], uut.dm.dmem[i + 1], uut.dm.dmem[i + 2], uut.dm.dmem[i + 3]);
            end
        $display(" ");     
        $display("Final Values:");
        for(i = 20; i < 33; i = i + 4) begin
            @(posedge clock)
            $display("t = %t DataAddress = [%0d]: %h%h%h%h", $time, i, uut.dm.dmem[i], uut.dm.dmem[i + 1], uut.dm.dmem[i + 2], uut.dm.dmem[i + 3]);
            end
        end
    endtask
      
                       
     initial begin
        $readmemh("imem.dat", uut.im.imem); 
        $readmemh("DataMem.dat", uut.dm.dmem);   
        clock = 0;
        Reset = 1;
        #20 
        Reset = 0;
        #920
//        Reset = 1;
 
//        Dump_RegFile;
        Dump_DataMem;
        $finish;
       
     end     
endmodule 