module delay_x8_unit(clk, rst, in, out);
input	clk, rst;
input	signed [7:0] in;
output reg signed [7:0] out;
initial begin
out <= 0;
end
always @ (posedge clk or negedge rst) begin
if(!rst)
  out <= 0;
else
  out <= in;
end
endmodule