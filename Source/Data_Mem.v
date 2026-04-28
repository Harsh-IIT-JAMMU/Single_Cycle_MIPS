// This module implements data memory used for load and store instructions.
module Data_Mem(clk,rst,WE,A,WD,RD);
/*
WE ? Write Enable
A ? address
WD ? write data
RD ? read data
*/
input clk,rst,WE;
input [31:0]A,WD;
output reg [31:0]RD;
// his is a 256×32-bit memory array
reg [31:0]mem[0:255];
//Write operation is synchronous and happens on the positive clock edge
always@(posedge clk) begin
    if(WE)
    mem[A[7:0]]<=WD;
end
// Read operation is combinational, so data is available immediately.
always@(*) begin
    if(rst)
    RD=32'b0;
    else
    RD=mem[A[7:0]];
end
endmodule

// Data memory writes on clock edge but reads instantly
