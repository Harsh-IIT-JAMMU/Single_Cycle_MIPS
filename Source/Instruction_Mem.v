// This module implements instruction memory that stores program instructions.
module Instruction_mem(clk,rst,A,RD);
input clk,rst;
// Address A comes from the program counter, and Read Data outputs the instruction.
input [31:0]A;
output reg [31:0]RD;
reg [31:0]ROM[0:255]; // This is a 256 word ×32-bit ROM storing instructions.
// Instructions are loaded from a file using $readmemh in hexadecimal format.
initial begin
    $readmemh("truth_table.mem",ROM);
end
// Instruction memory is combinational, so output changes immediately with address.
always@(*) begin
    if(rst)
    RD=32'b0;
    else
    RD=ROM[A[9:2]]; // We use A[9:2] because instructions are word-aligned (4 bytes), so the last 2 bits are always zero.
end
endmodule

/*
The program counter provides an address, which is used to fetch the instruction from ROM. The address is word-aligned, so we use A[9:2] to index memory
In real hardware, instruction memory can be implemented using SRAM or cache, but in this design we model it as ROM using $readmemh.
*/
