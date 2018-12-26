module clk_divided(clk, rst, clk_out);
input clk, rst;
output reg clk_out;
parameter N = 5000;
reg [15:0] cnt;
initial begin
cnt <= 16'b0;
clk_out <= 0;
end
always @ (posedge clk or negedge rst) begin
if (!rst) begin
  cnt <= 16'b0;
  clk_out <= 0;
end
else if(cnt == N/2-1) begin
  cnt <= 16'b0;
  clk_out <= ~clk_out;
end
else
  cnt <= cnt + 1'b1;
end
endmodule