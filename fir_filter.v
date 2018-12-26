module fir_filter(clk, rst, ref_data, h0, h1, h2, h3, h4, h5, h6, h7, h8, out);
input clk, rst;
input signed [7:0] ref_data;
input signed [19:0] h0, h1, h2, h3, h4, h5, h6, h7, h8;
output signed [31:0] out;
reg signed [7:0] sample1, sample2, sample3, sample4, sample5, sample6, sample7, sample8;
assign out = h0*ref_data+h1*sample1+h2*sample2+h3*sample3+h4*sample4+h5*sample5+h6*sample6+h7*sample7+h8*sample8;  //公式(5-1)
initial begin
sample1 <= 0;
sample2 <= 0;
sample3 <= 0;
sample4 <= 0;
sample5 <= 0;
sample6 <= 0;
sample7 <= 0;
sample8 <= 0;
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
end
end
endmodule
  