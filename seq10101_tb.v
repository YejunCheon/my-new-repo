`timescale 1ns / 1ps

module tb_seq_detector;

    reg clk, rst, i;
    wire out_mealy;
    wire out_moore;

    // Mealy 인스턴스
    mealy_10101 u_mealy (
        .clk(clk), .rst(rst), .i(i), .out(out_mealy)
    );

    // Moore 인스턴스
    moore_10101 u_moore (
        .clk(clk), .rst(rst), .i(i), .out(out_moore)
    );

    // Clock Generation (Period: 40ns)
    initial clk = 1'b0;
    always #20 clk = ~clk;
    initial begin
        rst = 1'b1; #200;
        rst = 1'b0; 
        $finish;
    end


    initial begin
        i = 1'b0;

        i = 1'b1; #40; // 1
        i = 1'b0; #40; // 0
        i = 1'b1; #40; // 1
        i = 1'b0; #40; // 0
        i = 1'b1; #40; // 1 

        i = 1'b0; 
        
        // Sequence 입력 시작: Target 10101 overlapping
        // 입력 패턴: 1 0 1 0 1 0 1 (총 2번 감지되어야 함)
        
        // 1. 첫 번째 패턴 시작
        i = 1'b1; #40; // 1
        i = 1'b0; #40; // 0
        i = 1'b1; #40; // 1
        i = 1'b0; #40; // 0
        i = 1'b1; #40; // 1 -> Mealy는 여기서 High, Moore는 다음 클럭에 High

        // 2. Overlapping 테스트 (마지막 1을 재사용하여 0, 1 추가)
        i = 1'b0; #40; // 0
        i = 1'b1; #40; // 1 -> Mealy는 여기서 High (두 번째 감지)

        // 3. 패턴 깨기
        i = 1'b0; #40;
        i = 1'b0; #40;

        #100;
        $finish;
    end

endmodule