// This module implements the Program Counter, which stores the address of the current instruction.
// pci is the next address, and pco is the current program counter value.
module Program_Counter(clk,rst,pci,pco);
    input clk,rst;
    input [31:0]pci; // comes from the PC selection logic, which decides between sequential, branch, and jump addresses.
    output reg [31:0]pco;
    always @(posedge clk) begin
        if(rst)
        pco<=32'b0;
        else
        pco<=pci;
    end
endmodule

// On every clock edge, if reset is active, PC becomes 0. Otherwise, it updates to the next instruction address provided by the datapath, which could be PC+4, branch target, or jump address.
