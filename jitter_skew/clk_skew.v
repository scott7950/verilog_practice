`timescale 1ns/1ns

module clk_skew;

reg clk;
reg rst_n;

initial begin
    rst_n = 1'b1;
    #10 rst_n = 1'b0;
    #10 rst_n = 1'b1;
end

initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
end

reg clk1;
reg clk2;
always @(posedge clk or negedge clk) begin
    clk1 <= #($urandom() % 3) clk;
    clk2 <= #($urandom() % 3) clk;
end

initial begin
    #1000 $finish();
end

endmodule


