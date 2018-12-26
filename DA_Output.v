module DA_Output(clk, rst, DA_clk, DA_in, DA_out);
input clk, rst;
output DA_clk;
input signed [7:0] DA_in;
output reg [7:0] DA_out;
assign DA_clk = clk;
initial begin
DA_out <= 0;
end
always @ (posedge clk or negedge rst) begin
if(!rst)
  DA_out <= 0;
else
  DA_out <= DA_in + 8'b01111111;  //把无符号数转为有符号数
end
endmodule