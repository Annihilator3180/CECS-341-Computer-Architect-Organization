`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 12:56:52 PM
// Design Name: 
// Module Name: control
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


module control(
    input [31:0] A,
    input [31:0] B,
    input [5:0] Op,
    input [5:0] Func,
    output reg [3:0] ALUCntl,
    output reg RegWrite,
    output reg RegDst,
    output reg [1:0] Branch,
    output reg MemRead,
    output reg MemWrite,
    output reg MemToReg,
    output reg ALUSrc,
    output reg jump
    
    );
    
    reg signed [31:0] A_s, B_s;
    
    
    always@(*) begin
    A_s = A;
    B_s = B;
        if (Op == 6'b0) begin  //Detects R-type instruction
            RegWrite = 1'b1;   // Write back to register file
            RegDst = 1'b1;     // Inst[15:11] as write back address
            Branch = 2'b00;    // You fill in 
            MemRead = 1'b0;   // You fill in
            MemWrite = 1'b0;  // You fill in
            MemToReg = 1'b0;  // You fill in
            ALUSrc = 1'b0;    // You fill in
            jump = 1'b0;    
            
            case(Func)
            6'h20: ALUCntl = 4'b1010;    //Add signed
            6'h21: ALUCntl = 4'b0010;    //Add unsigned
            6'h22: ALUCntl = 4'b1110;    //Sub signed
            6'h23: ALUCntl = 4'b0110;    //Sub unsigned
            6'h24: ALUCntl = 4'b0000;    //AND
            6'h25: ALUCntl = 4'b0001;    //OR
            6'h26: ALUCntl = 4'b0011;    //XOR
            6'h27: ALUCntl = 4'b1100;    //NOR
            6'h2A: ALUCntl = 4'b1101;    //Set less than
            6'h2B: ALUCntl = 4'b1111;    //Set less than unsigned
  
            default: ALUCntl = 4'b0;  //default to AND
            endcase
        end
        else begin
            case(Op)
                6'h08: begin                  // Addi
                          ALUCntl  = 4'b1010; // Add ALU Control
                          RegWrite = 1'b1;    // Write back to register file
                          RegDst   = 1'b0;    // Inst[20:16] write back address
                          Branch   = 2'b00;   // No Branch Performed
                          MemRead  = 1'b0;    // No read from data memory
                          MemWrite = 1'b0;    // No write from to data memory
                          MemToReg = 1'b0;    // Write back data comes from ALU
                          ALUSrc   = 1'b1;    // Source B comes from SE immediate
                          jump     = 1'b0;
                        end
                        
                6'h09: begin                  // Addi Unsigned
                          ALUCntl  = 4'b0010; // Add ALU Control
                          RegWrite = 1'b1;    // Write back to register file
                          RegDst   = 1'b0;    // Inst[20:16] write back address
                          Branch   = 2'b00;   // No Branch Performed
                          MemRead  = 1'b0;    // No read from data memory
                          MemWrite = 1'b0;    // No write from to data memory
                          MemToReg = 1'b0;    // Write back data comes from ALU
                          ALUSrc   = 1'b1;    // Source B comes from SE immediate
                          jump     = 1'b0;
                        end
                
                6'h0C: begin                  // And Immediate
                          ALUCntl  = 4'b0000; // Add ALU Control
                          RegWrite = 1'b1;    // Write back to register file
                          RegDst   = 1'b0;    // Inst[20:16] write back address
                          Branch   = 2'b00;   // No Branch Performed
                          MemRead  = 1'b0;    // No read from data memory
                          MemWrite = 1'b0;    // No write from to data memory
                          MemToReg = 1'b0;    // Write back data comes from ALU
                          ALUSrc   = 1'b1;    // Source B comes from SE immediate
                          jump     = 1'b0;
                        end
                        
                6'h0D: begin                  // Or Immediate
                          ALUCntl  = 4'b0001; // Add ALU Control
                          RegWrite = 1'b1;    // Write back to register file
                          RegDst   = 1'b0;    // Inst[20:16] write back address
                          Branch   = 2'b00;   // No Branch Performed
                          MemRead  = 1'b0;    // No read from data memory
                          MemWrite = 1'b0;    // No write from to data memory
                          MemToReg = 1'b0;    // Write back data comes from ALU
                          ALUSrc   = 1'b1;    // Source B comes from SE immediate
                          jump     = 1'b0;
                        end        
                        
                6'h23: begin                  // Load Word
                          ALUCntl  = 4'b0010; // Add ALU Control
                          RegWrite = 1'b1;    // Write back to register file
                          RegDst   = 1'b0;    // Inst[20:16] write back address
                          Branch   = 2'b00;   // No Branch Performed
                          MemRead  = 1'b1;    // No read from data memory
                          MemWrite = 1'b0;    // No write from to data memory
                          MemToReg = 1'b1;    // Write back data comes from ALU
                          ALUSrc   = 1'b1;    // Source B comes from SE immediate
                          jump     = 1'b0;
                        end
                        
                6'h2B: begin                  // Store Word
                          ALUCntl  = 4'b0010; // Add ALU Control
                          RegWrite = 1'b0;    // Write back to register file
                          RegDst   = 1'b0;    // Inst[20:16] write back address
                          Branch   = 2'b00;   // No Branch Performed
                          MemRead  = 1'b0;    // No read from data memory
                          MemWrite = 1'b1;    // No write from to data memory
                          MemToReg = 1'b0;    // Write back data comes from ALU
                          ALUSrc   = 1'b1;    // Source B comes from SE immediate
                          jump     = 1'b0;
                        end
                        
                6'h04: begin                  // Branch On Equal
                          ALUCntl  = 4'b0010; // Add ALU Control
                          RegWrite = 1'b0;    // Write back to register file
                          RegDst   = 1'b0;    // Inst[20:16] write back address
                          Branch   = 2'b01;   // No Branch Performed
                          MemRead  = 1'b0;    // No read from data memory
                          MemWrite = 1'b0;    // No write from to data memory
                          MemToReg = 1'b0;    // Write back data comes from ALU
                          ALUSrc   = 1'b0;    // Source B comes from SE immediate //1
                          jump     = 1'b0;
                        end
                        
                6'h05: begin                 // Branch On Not Equal
                          ALUCntl  = 4'b1010;    // Add ALU Control
                          RegWrite = 1'b0;    // Write back to register file
                          RegDst   = 1'b0;    // Inst[20:16] write back address
                          Branch   = 2'b10;    // No Branch Performed
                          MemRead  = 1'b0;    // No read from data memory
                          MemWrite = 1'b0;    // No write from to data memory
                          MemToReg = 1'b0;    // Write back data comes from ALU
                          ALUSrc   = 1'b0;    // Source B comes from SE immediate
                          jump     = 1'b0;
                        end
                        
                6'h0A: begin                 // Set Less Than Immediate
                          ALUCntl  = 4'b1101;    // Add ALU Control
                          RegWrite = 1'b1;    // Write back to register file
                          RegDst   = 1'b0;    // Inst[20:16] write back address
                          Branch   = 2'b00;    // No Branch Performed
                          MemRead  = 1'b0;    // No read from data memory
                          MemWrite = 1'b0;    // No write from to data memory
                          MemToReg = 1'b0;    // Write back data comes from ALU
                          ALUSrc   = 1'b1;    // Source B comes from SE immediate
                          jump     = 1'b0;
                        end
                        
                6'h0B: begin                 // Set Less Than Immediate Unsigned
                          ALUCntl  = 4'b1111;    // Add ALU Control
                          RegWrite = 1'b1;    // Write back to register file
                          RegDst   = 1'b0;    // Inst[20:16] write back address
                          Branch   = 2'b00;    // No Branch Performed
                          MemRead  = 1'b0;    // No read from data memory
                          MemWrite = 1'b0;    // No write from to data memory
                          MemToReg = 1'b0;    // Write back data comes from ALU
                          ALUSrc   = 1'b0;    // Source B comes from SE immediate
                          jump     = 1'b0;
                        end 
                         
                6'h02: begin                  // Jump
                            ALUCntl  = 4'b0000;   // Add ALU Control
                            RegWrite = 1'b0;      // Write back to register file
                            RegDst   = 1'b0;      // Inst[20:16] write back address
                            Branch   = 2'b0;      // No Branch Performed
                            MemRead  = 1'b0;      // No read from data memory
                            MemToReg = 1'b0;      // No write from to data memory
                            MemWrite = 1'b0;      // No write from to data memory
                            ALUSrc   = 1'b0;      // Source B comes from SE immediate
                            jump     = 1'b1;      
                            
                         end         
                                                                           
                default:  begin
                          ALUCntl  = 4'bx;
                          RegWrite = 1'b0;
                          RegDst   = 1'b0;
                          Branch   = 2'b0;
                          MemRead  = 1'b0;
                          MemToReg = 1'b0;
                          MemWrite = 1'b0;
                          ALUSrc   = 1'b0;
                          
                         end
            endcase
      
        end
    end
endmodule