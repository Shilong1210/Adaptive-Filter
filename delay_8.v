module delay_8(clk, rst, in, out);
input clk, rst;
input signed [7:0] in;
output signed [7:0] out;
wire signed [7:0] delay1_out, delay2_out, delay3_out, delay4_out, delay5_out, delay6_out, delay7_out; 
delay_unit delay1 (.clk(clk), .rst(rst), .in(in),         .out(delay1_out));
delay_unit delay2 (.clk(clk), .rst(rst), .in(delay1_out), .out(delay2_out));
delay_unit delay3 (.clk(clk), .rst(rst), .in(delay2_out), .out(delay3_out));
delay_unit delay4 (.clk(clk), .rst(rst), .in(delay3_out), .out(delay4_out));
delay_unit delay5 (.clk(clk), .rst(rst), .in(delay4_out), .out(delay5_out));
delay_unit delay6 (.clk(clk), .rst(rst), .in(delay5_out), .out(delay6_out));
delay_unit delay7 (.clk(clk), .rst(rst), .in(delay6_out), .out(delay7_out));
delay_unit delay8 (.clk(clk), .rst(rst), .in(delay7_out), .out(out));
endmodule
