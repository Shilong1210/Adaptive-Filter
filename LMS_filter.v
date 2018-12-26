module LMS_filter(clk, rst, data, ref_data, signal);
parameter step_size = 19;  //位移次数
input clk, rst;
input signed [7:0] data;  //原始输入信号
input signed [7:0] ref_data;  //参考输入信号
output signed [7:0] signal;
wire signed [19:0] h0, h1, h2, h3, h4, h5, h6, h7, h8;
wire signed [31:0] filter_out;  //FIR滤波器输出
wire signed [31-step_size:0] filter_out_int;  //移位后的结果
wire signed [7:0] error_out;  //自适应滤波器输出
fir_coef coef1 (.clk(clk), .rst(rst), .ref_data(ref_data), .step(error_out), .h0(h0), .h1(h1), .h2(h2), .h3(h3), .h4(h4), .h5(h5), .h6(h6), .h7(h7), .h8(h8));
fir_filter filter1 (.clk(clk), .rst(rst), .ref_data(ref_data), .h0(h0), .h1(h1), .h2(h2), .h3(h3), .h4(h4), .h5(h5), .h6(h6), .h7(h7), .h8(h8), .out(filter_out));
assign filter_out_int = (filter_out >> step_size);
assign error_out = data - filter_out_int;
assign signal = error_out;
endmodule
//下为滤波器系数固定为所求得最优解时的代码
//module LMS_filter(clk, rst, data, ref_data, signal);
//parameter digital_point = 10;
//input clk, rst;
//input signed [7:0] data;
//input signed [7:0] ref_data;
//output signed [7:0] signal;
//wire signed [31:0] filter_out;
//wire signed [31-digital_point:0] filter_out_int;
//wire signed [7:0] error_out;
//parameter h0=416;
//parameter h1=325;
//parameter h2=202;
//parameter h3=57;
//parameter h4=-95;
//parameter h5=-239;
//parameter h6=-362;
//parameter h7=-451;
//parameter h8=-498;
//fir_filter filter1 (.clk(clk), .rst(rst), .ref_data(ref_data), .h0(h0), .h1(h1), .h2(h2), .h3(h3), .h4(h4), .h5(h5), .h6(h6), .h7(h7), .h8(h8), .out(filter_out));
//assign filter_out_int = (filter_out >> digital_point);
//assign error_out = data - filter_out_int;
//assign signal = error_out;
//endmodule