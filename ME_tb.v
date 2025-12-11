`timescale 1ns / 1ps

module ME_tb;

reg clk, rst, i;
wire out;

mearly_seq_detector dut (
    .clk(clk),
    .rst(rst),
    .i(i),
    .out(out)
);

// 40ns clock period
initial clk = 1'b0;
always #20 clk = ~clk;

// Hold reset high for a long cycle, then release
initial begin
    rst = 1'b1;
    #300;
    rst = 1'b0;
end

// Drive input with fixed period; includes 1101 sequence
initial begin
    i = 1'b0; #200;       // align with reset release
    i = 1'b1; #80;        // bit 1
    i = 1'b1; #80;        // bit 1
    i = 1'b0; #80;        // bit 0
    i = 1'b1; #80;        // bit 1 -> should trigger detect
    i = 1'b0; #80;
    i = 1'b0; #80;
    i = 1'b1; #80;
    i = 1'b1; #80;
    i = 1'b0; #80;
    i = 1'b1; #80;
    #200;
    $finish;
end

endmodule