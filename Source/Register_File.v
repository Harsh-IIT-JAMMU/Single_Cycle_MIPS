// This module implements the register file of MIPS, which stores 32 registers
/*
A1 ? read address 1 (rs)
A2 ? read address 2 (rt)
A3 ? write address (rd/rt)
WD3 ? data to write
WE3 ? write enable
RD1, RD2 ? outputs
*/
// It has two read ports and one write port.
module Register_File(clk,rst,A1,A2,A3,WD3,WE3,RD1,RD2);
    input clk,rst,WE3;
    input [4:0]A1,A2,A3;
    input [31:0]WD3;
    output reg [31:0]RD1,RD2;
    reg [31:0]mem[0:31]; // This is a 32×32-bit register file
    // Write happens only on the rising edge of clock when write enable is active
    always @(posedge clk) begin
        if(WE3 && A3 != 5'd0)
            mem[A3] <= WD3;
    end
    // Read is combinational, so outputs change immediately when address changes.
    // On reset, outputs are cleared.
    always @(*) begin
        if(rst)
        begin
            RD1=32'b0;
            RD2=32'b0;
        end    
        else
        begin
            RD1=mem[A1]; // Reads two registers simultaneously using addresses A1 and A2.
            RD2=mem[A2];
            end
    end
endmodule

// Register file supports two reads and one write in the same cycle.
