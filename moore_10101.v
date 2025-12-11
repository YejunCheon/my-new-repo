`timescale 1ns / 1ps

// Overlapping Moore sequence detector for pattern 10101
module moore_10101(
    input  clk,
    input  rst,
    input  i,
    output reg out
);

// state encoding
// 0: idle
// 1: saw 1
// 2: saw 10
// 3: saw 101
// 4: saw 1010
// 5: detected 10101
reg [2:0] state, next;

always @(posedge clk) begin
    if (rst) state <= 3'd0;
    else     state <= next;
end

always @(*) begin
    // default
    next = 3'd0;

    if (state == 3'd0) begin
        next = i ? 3'd1 : 3'd0;
    end else if (state == 3'd1) begin
        next = i ? 3'd1 : 3'd2;
    end else if (state == 3'd2) begin
        next = i ? 3'd3 : 3'd0;
    end else if (state == 3'd3) begin
        next = i ? 3'd1 : 3'd4;
    end else if (state == 3'd4) begin
        next = i ? 3'd5 : 3'd0;
    end else if (state == 3'd5) begin
        // overlap: keep last 1 or 10 depending on input
        next = i ? 3'd1 : 3'd2;
    end
end

always @(*) begin
    out = (state == 3'd5);
end

endmodule

