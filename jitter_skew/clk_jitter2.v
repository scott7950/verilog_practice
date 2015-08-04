`timescale 1ns/1ns

module clk_jitter;

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

wire clk2;
assign #($urandom() % 3) clk2 = clk;

initial begin
    #1000 $finish();
end

endmodule

