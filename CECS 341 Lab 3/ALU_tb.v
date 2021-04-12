`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2021 04:23:49 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();

    //inputs to UUT
    reg [31:0] A_tb;
    reg [31:0] B_tb;
    reg [3:0] ALUCntl_tb;
    
    // Output of UUT
    wire [31:0] ALUout_tb;  // ALUOut
    wire N_tb;              // Negative
    wire C_tb;              // Carryout
    wire V_tb;              // Overflow
    wire Z_tb;              // Zero
    
    //Testbench specific variables
    integer i;
    
    //instantiate UUT
    ALU uut(
        .A(A_tb),
        .B(B_tb),
        .ALUCntl(ALUCntl_tb),
        .ALUout(ALUout_tb),
        .N(N_tb),
        .C(C_tb),
        .V(V_tb),
        .Z(Z_tb)
        );
        
//        initial begin
//            $timeformat(-9, 1, " ns", 9);
//            $display(" "); 
//            $display("********************************************************************************************");
//            $display("   A L U   T e s t b e n c h   ");
//            $display("********************************************************************************************");
//            $display(" "); 
             
//             for(i=0; i<100; i=i+1) begin
//                       {A_tb,B_tb,ALUCntl_tb} = i; 
//                       #5;
//                       $display("time=%t  A=%2b  B=%2b  ALUCntl=%b ||  ALUout=%b N=%3b C=%3b V=%3b Z=%3b",
//                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, N_tb,C_tb,V_tb,Z_tb);
//                   end
//                   $finish;
//               end
            initial begin
                $timeformat(-9, 1, " ns", 9);
                $display(" "); 
                $display("********************************************************************************************");
                $display("   A L U   T e s t b e n c h   ");
                $display("********************************************************************************************");
                $display(" "); 
                
                // Test Case 1
                $display(" T E S T  C A S E  1 ");
                A_tb = 32'hf0f0_3c3c; B_tb = 32'hbf0f_f5f5; ALUCntl_tb = 4'b0000;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
                $display(" ");
                
                // Test Case 2
                $display(" T E S T  C A S E  2 ");
                A_tb = 32'hf0f0_3c3c; B_tb = 32'hbf0f_f5f5; ALUCntl_tb = 4'b0001;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
                $display(" ");
                
                // Test Case 3
                $display(" T E S T  C A S E  3 ");
                A_tb = 32'hf0f0_3c3c; B_tb = 32'hbf0f_f5f5; ALUCntl_tb = 4'b0011;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
                $display(" ");
                
                //Test Case 4
                $display(" T E S T  C A S E  4 ");
                A_tb = 32'h0000_0001; B_tb = 32'hffff_ffff; ALUCntl_tb = 4'b0010;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
                $display(" ");
                
                // Test Case 5
                $display(" T E S T  C A S E  5 ");
                A_tb = 32'h6389_754f; B_tb = 32'had56_24e6; ALUCntl_tb = 4'b0010;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
                $display(" ");
                                
                // Test Case 6
                $display(" T E S T  C A S E  6 ");
                A_tb = 32'h0000_0001; B_tb = 32'hffff_ffff; ALUCntl_tb = 4'b0010;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);           
                $display(" ");
                
                // Test Case 7
                $display(" T E S T  C A S E  7 ");
                A_tb = 32'h6389_754f; B_tb = 32'had56_24e6; ALUCntl_tb = 4'b0010;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
                $display(" ");
                               
                // Test Case 8
                $display(" T E S T  C A S E  8 ");
                A_tb = 32'hffff_ffff; B_tb = 32'hffff_ffff; ALUCntl_tb = 4'b0010;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
                $display(" ");
                
                // Test Case 9
                $display(" T E S T  C A S E  9 ");
                A_tb = 32'h0000_0000; B_tb = 32'h0000_0001; ALUCntl_tb = 4'b0110;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
                $display(" ");
                
                // Test Case 10
                $display(" T E S T  C A S E  10 ");
                A_tb = 32'hf968_4783; B_tb = 32'hf998_d562; ALUCntl_tb = 4'b0110;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
                $display(" ");
                
                // Test Case 11
                $display(" T E S T  C A S E  11 ");
                A_tb = 32'hf0f0_3c3c; B_tb = 32'hbf0f_f5f5; ALUCntl_tb = 4'b1100;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
                $display(" ");
                
                // Test Case 12
                $display(" T E S T  C A S E  12 ");
                A_tb = 32'h89bc_de34; B_tb = 32'hc53b_d687; ALUCntl_tb = 4'b0111;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
                $display(" ");
                
                // Test Case 13
                $display(" T E S T  C A S E  13 ");
                A_tb = 32'hf0f0_3c3c; B_tb = 32'hbf0f_f5f5; ALUCntl_tb = 4'b1101;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
                $display(" ");
                       
               // Test Case 14
               $display(" T E S T  C A S E  14 ");
               A_tb = 32'hf0f0_3c3c; B_tb = 32'hbf0f_f5f5; ALUCntl_tb = 4'b1111;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);      
                $display(" ");
                
              // Test Case 15
              $display(" T E S T  C A S E  15 ");
              A_tb = 32'hf0f0_3c3c; B_tb = 32'hbf0f_f5f5; ALUCntl_tb = 4'b1010;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb); 
                $display(" ");
                
              // Test Case 16  
              $display(" T E S T  C A S E  16 ");
              A_tb = 32'hf0f0_3c3c; B_tb = 32'hbf0f_f5f5; ALUCntl_tb = 4'b1110;
                #5 $display("time=%t  A=%h  B=%h  ALUCntl=%4b ||  ALUout=%h Z=%1b V=%1b C=%1b N=%1b",
                       $time, A_tb, B_tb, ALUCntl_tb, ALUout_tb, Z_tb, V_tb, C_tb, N_tb);
              $display(" ");
    
                end

endmodule
