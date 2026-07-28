`timescale 1ns/1ps

module AHB_Lite_Slave_tb;

reg HCLK;
reg HRESETn;
reg [31:0] HADDR;
reg [31:0] HWDATA;
reg HWRITE;
reg [1:0] HTRANS;

wire [31:0] HRDATA;
wire HREADY;
wire HRESP;

AHB_Lite_Slave uut(
    .HCLK(HCLK),
    .HRESETn(HRESETn),
    .HADDR(HADDR),
    .HWDATA(HWDATA),
    .HWRITE(HWRITE),
    .HTRANS(HTRANS),
    .HRDATA(HRDATA),
    .HREADY(HREADY),
    .HRESP(HRESP)
);

always #5 HCLK = ~HCLK;

initial
begin

    $dumpfile("dump.vcd");
    $dumpvars(0, AHB_Lite_Slave_tb);

    // Initialize
    HCLK = 0;
    HRESETn = 0;
    HADDR = 0;
    HWDATA = 0;
    HWRITE = 0;
    HTRANS = 2'b00;

    #10;
    HRESETn = 1;

    #10;
    HWRITE = 1;
    HTRANS = 2'b10;
    HADDR  = 32'h00000000;
    HWDATA = 32'h11111111;

    #10;
    HADDR  = 32'h00000004;
    HWDATA = 32'h22222222;

    #10;
    HADDR  = 32'h00000008;
    HWDATA = 32'h33333333;

    #10;
    HADDR  = 32'h0000000C;
    HWDATA = 32'h44444444;

 
    #10;
    HWRITE = 0;
    HADDR  = 32'h00000000;

    #10;
    HADDR  = 32'h00000004;

    #10;
    HADDR  = 32'h00000008;

    #10;
    HADDR  = 32'h0000000C;

    #20;

    $finish;

end

endmodule