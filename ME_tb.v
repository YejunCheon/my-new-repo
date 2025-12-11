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

initial clk = 1'b0;
always #20 clk = ~clk;

initial begin
    rst = 1'b1;
    #300;
    rst = 1'b0;
end

initial begin
    i = 1'b0;
    #320;

    i = 1'b1; #40;
    i = 1'b1; #40;
    i = 1'b0; #40;
    i = 1'b1; #40;
    i = 1'b0; #80;

    i = 1'b1; #40;
    i = 1'b1;
    rst = 1'b1; #40;
    rst = 1'b0;
    i = 1'b0; #40;
    i = 1'b1; #40;

    #120;
    $finish;
end

endmodule