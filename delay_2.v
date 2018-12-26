module delay_2(clk, rst, in, out);
input clk, rst;
input signed [17:0] in;
output signed [17:0] out;
wire signed [17:0] delay1_out; 
delay_x18_unit delay1 (.clk(clk), .rst(rst), .in(in),         .out(delay1_out));
delay_x18_unit delay2 (.clk(clk), .rst(rst), .in(delay1_out), .out(out));
endmodule
