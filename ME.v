`timescale 1ns / 1ps


module mearly_seq_detector(
    input clk, input rst, input i,
    output out
    );

reg out;
reg[3:0] seq;

always @(posedge clk) begin
    if(reset) begin
        seq <= 4'b0000;
        out <= 1'b0;
    end

    else begin
        seq[3] = seq[2];
        seq[2] = seq[1];
        seq[1] = seq[0];
        seq[0] = i;
        if(seq == 4'b1101) out = 1'b1;
        else out = 1'b0;
    end
end

endmodule