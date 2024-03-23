module lab1_ex4 (
	input logic [7:0] A, B,
	input logic clk, rst, EA, EB,
	output logic [15:0] P, y,
	input logic [1:0] sel,
	output logic cout1, cout2
);

wire [7:0] a, b;
wire [7:0] p1, p2;
wire [15:0] p3;

D_FF8b dff8b0 (.clk(clk), .rst(rst), .enable(EA), .data_i(A), .data_o(a));
D_FF8b dff8b1 (.clk(clk), .rst(rst), .enable(EB), .data_i(B), .data_o(b));
sum sum1(.a(a), .b(b), .sum(p1), .cout(cout1));
sub sum2(.a(a), .b(b), .sum(p2), .cout(cout2));
mul88 mul881(.a(a), .b(b), .mul(p3));

always_comb begin
unique case (sel)
	2'b00: y = p1;
	2'b01: y = p2;
	2'b10: y = p3;
	default: y = 1'b0;
endcase
end

D_FF16b dff16b0 (.clk(clk), .rst(rst), .data_i(y), .data_o(P));

endmodule