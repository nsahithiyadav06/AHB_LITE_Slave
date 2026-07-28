`timescale 1ns/1ps

module mux_2x1_tb;

reg a;
reg b;
reg sel;

wire y;

//DUT
mux_2x1 uut(
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
);

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,mux_2x1_tb);
//test case 1
a=0;b=0;sel=0;
#10;
//test case 2
a=1;b=0;sel=0;
#10;
//test case 3
a=0;b=1;sel=1;
#10;
//test case 4
a=1;b=1;sel=1;
#10;
$finish;
end
endmodule