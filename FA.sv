module FA (
	input logic a, b, cin,
	output logic sum, cout
);

assign sum = a^b^cin;
assign cout = a&b | b&cin | cin&a;

endmodule : FA