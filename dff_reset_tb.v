`timescale 1ns/1ps

module dff_reset_tb;

reg clk;
reg reset;
reg d;

wire q;

dff_reset uut(
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

always #5 clk=~clk;
initial 
begin
$dumpfile("dump.vcd");
$dumpvars(0,dff_reset_tb);
clk=0;
reset=1;
d=0;
#10;
reset=0;
d=1;
#10;
d=0;
#10;
d=1;
#10
reset=1;
#10;
$finish;
end
endmodule