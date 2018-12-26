module AD_Input(clk, rst, AD_clk, AD_in, AD_out);
input clk, rst;
output AD_clk;
input [7:0] AD_in;
output reg signed [7:0] AD_out;
assign AD_clk = clk;
initial begin
AD_out <= 0;
end
always @ (posedge clk or negedge rst) begin
if(!rst)
  AD_out <= 0;
else
  AD_out <= AD_in - 8'b01111111;  //把有符号数转为无符号数
end
endmodule