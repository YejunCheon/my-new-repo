`timescale 1ns / 1ps

// 2. Moore Machine Style (1클럭 지연 반응)
module moore_10101(
    input clk, rst, i,
    output reg out
);
    reg [4:0] shift_reg;

    always @(posedge clk) begin
        if (rst) begin
            shift_reg = 5'b00000;
            out = 1'b0;
        end
        else begin
            // [Moore 순서]
            // 1. 현재 저장된 값(State)으로 먼저 검사 (Check Logic based on State)
            if (shift_reg == 5'b10101) out = 1'b1;
            else out = 1'b0;

            // 2. 그 다음에 시프트하여 다음 상태 준비 (Update Next State)
            shift_reg = shift_reg << 1;
            shift_reg[0] = i;
        end
    end
endmodule