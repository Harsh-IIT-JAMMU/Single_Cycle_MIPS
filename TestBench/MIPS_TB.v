module MIPS_tb();

reg clk, rst;

Single_Cycle_MIPS s1(.clk(clk), .rst(rst));

// Clock generation
initial begin
    clk = 0;
    forever #1 clk = ~clk;
end

// Dump all signals (VERY IMPORTANT)
initial begin
    $dumpfile("mips.vcd");
    $dumpvars(0, MIPS_tb);   // dump everything inside TB + DUT
end

// Monitor key signals (PRINTS IN CONSOLE)
initial begin
    $monitor("Time=%0t | PC=%h | Instr=%h | ALUResult=%h | Result=%h | RegWrite=%b | MemWrite=%b",
              $time,
              s1.pco,
              s1.Instr,
              s1.ALUResult,
              s1.Result,
              s1.RegWrite,
              s1.MemWrite);
end

// Stimulus
initial begin
    $readmemh("Instruction_Mem.mem", s1.im.ROM);
    $readmemh("Register_File.mem", s1.rf.mem);
    $readmemh("Data_Mem.mem", s1.dm.mem);

    rst = 1;
    @(negedge clk);
    rst = 0;

    repeat(30) @(negedge clk);   // increased cycles

    $finish;
end

endmodule
