module AHB_Lite_Slave(
    input HCLK,
    input HRESETn,
    input [31:0]HADDR,
    input [31:0]HWDATA,
    input HWRITE,
    input [1:0] HTRANS,

    output reg [31:0]HRDATA,
    output HREADY,
    output HRESP
);

reg [31:0] reg0;
reg [31:0] reg1;
reg [31:0] reg2;
reg [31:0] reg3;

assign HREADY =1'b1; //NO WAIT STATES

assign HRESP = 1'b0; //OKAY RESPONSE

always@(posedge HCLK or negedge HRESETn)
begin
if(!HRESETn)
begin
reg0<=32'b0;
reg1<=32'b0;
reg2<=32'b0;
reg3<=32'b0;
HRDATA<=32'b0;
end

else
begin 

if(HTRANS[1] && HWRITE)
begin

case(HADDR)

32'h00000000: reg0<=HWDATA;
32'h00000004: reg1<=HWDATA;
32'h00000008: reg2<=HWDATA;
32'h0000000C: reg3<=HWDATA;
default: ;
endcase
end

else if(HTRANS[1]&& !HWRITE)
begin
case(HADDR)

32'h00000000: HRDATA<=reg0;
32'h00000004: HRDATA<=reg1;
32'h00000008: HRDATA<=reg2;
32'h0000000C: HRDATA<=reg3;
default: HRDATA<= 32'b0;
endcase
end
end
end 
endmodule