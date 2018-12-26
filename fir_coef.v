module fir_coef(clk, rst, ref_data, step, h0, h1, h2, h3, h4, h5, h6, h7, h8);
input clk, rst;
input signed [7:0] ref_data;
input signed [7:0] step;
output reg signed [19:0] h0, h1, h2, h3, h4, h5, h6, h7, h8;
reg signed [7:0] sample1, sample2, sample3, sample4, sample5, sample6, sample7, sample8;
initial begin
sample1 <= 0;
sample2 <= 0;
sample3 <= 0;
sample4 <= 0;
sample5 <= 0;
sample6 <= 0;
sample7 <= 0;
sample8 <= 0;
h0 <= 0;
h1 <= 0;
h2 <= 0;
h3 <= 0;
h4 <= 0;
h5 <= 0;
h6 <= 0;
h7 <= 0;
h8 <= 0;
end
always @ (posedge clk or negedge rst) begin
if(!rst) begin
  sample1 <= 0;
  sample2 <= 0;
  sample3 <= 0;
  sample4 <= 0;
  sample5 <= 0;
  sample6 <= 0;
  sample7 <= 0;
  sample8 <= 0;
  h0 <= 0;
  h1 <= 0;
  h2 <= 0;
  h3 <= 0;
  h4 <= 0;
  h5 <= 0;
  h6 <= 0;
  h7 <= 0;
  h8 <= 0;
end
else begin
  sample1 <= ref_data;  //移位寄存器
  sample2 <= sample1;
  sample3 <= sample2;
  sample4 <= sample3;
  sample5 <= sample4;
  sample6 <= sample5;
  sample7 <= sample6;
  sample8 <= sample7;
  h0 = h0 + step * ref_data;  //公式（5-2）
  h1 = h1 + step * sample1;
  h2 = h2 + step * sample2;
  h3 = h3 + step * sample3;
  h4 = h4 + step * sample4;
  h5 = h5 + step * sample5;
  h6 = h6 + step * sample6;
  h7 = h7 + step * sample7;
  h8 = h8 + step * sample8;
end
end
endmodule
