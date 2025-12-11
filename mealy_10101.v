`timescale 1ns / 1ps

// 1. Mealy Machine Style (입력 즉시 반응)
module mealy_10101(
    input clk, rst, i,
    output reg out
);
    reg [4:0] shift_reg; // 10101은 5비트이므로 5비트 레지스터 필요

    always @(posedge clk) begin
        if (rst) begin
            shift_reg = 5'b00000;
            out = 1'b0;
        end
        else begin
            // [Mealy 순서]
            // 1. 먼저 입력을 받아서 시프트 (Update State with Input)
            shift_reg = shift_reg << 1;
            shift_reg[0] = i;

            // 2. 업데이트된 값으로 패턴 검사 (Check Logic)
            if (shift_reg == 5'b10101) out = 1'b1;
            else out = 1'b0;
        end
    end
endmodule
