module FA8b (
	input logic [0:0] a0, a1, a2, a3, a4, a5, a6, a7,
	input logic [0:0] b0, b1, b2, b3, b4, b5, b6, b7,
	input logic cin,
	output logic [7:0] sum, cout,
	output logic [8:0] total
);

logic [7:0] carry;

FA FA0 (.sum(sum[0]), .a(a0), .b(b0^cin), .cin(cin), .cout(carry[0]));
FA FA1 (.sum(sum[1]), .a(a1), .b(b1^cin), .cin(carry[0]), .cout(carry[1]));
FA FA2 (.sum(sum[2]), .a(a2), .b(b2^cin), .cin(carry[1]), .cout(carry[2]));
FA FA3 (.sum(sum[3]), .a(a3), .b(b3^cin), .cin(carry[2]), .cout(carry[3]));
FA FA4 (.sum(sum[4]), .a(a4), .b(b4^cin), .cin(carry[3]), .cout(carry[4]));
FA FA5 (.sum(sum[5]), .a(a5), .b(b5^cin), .cin(carry[4]), .cout(carry[5]));
FA FA6 (.sum(sum[6]), .a(a6), .b(b6^cin), .cin(carry[5]), .cout(carry[6]));
FA FA7 (.sum(sum[7]), .a(a7), .b(b7^cin), .cin(carry[6]), .cout(cout));

assign total = {cout, sum[7:0]};

endmodule : FA8b