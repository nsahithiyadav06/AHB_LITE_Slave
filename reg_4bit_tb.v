`timescale 1ns/1ps

module reg_4bit_tb;

reg clk;
reg reset;
reg [3:0] d;

wire  [3:0] q;

reg_4bit uut(
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);
always #5 clk=~clk;
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, reg_4bit_tb);
clk=0;
reset=1;
d=4'b0000;
#10
reset=0;
d=4'b1010;
#10;
d=4'b1100;
#10;
d=4'b0011;
#10;
reset=1;
#10;
$finish;
end
endmodule
