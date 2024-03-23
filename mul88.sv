module mul88(
	input logic [7:0] a, b,
	input logic cin,
	output logic [15:0] mul
);

wire [7:0] sum1, sum2, sum3, sum4, sum5, sum6, sum7;
wire [7:0] carry;

//layer0
and (mul[0], a[0], b[0]);

//1st
FA8b layer1 (
	.sum(sum1),
	.cin(1'b0),
	.a0(a[1] & b[0]),
	.a1(a[2] & b[0]),
	.a2(a[3] & b[0]),
	.a3(a[4] & b[0]),
	.a4(a[5] & b[0]),
	.a5(a[6] & b[0]),
	.a6(a[7] & b[0]),
	.a7(1'b0),
	.cout(carry[0]),
	.b0(a[0] & b[1]),
	.b1(a[1] & b[1]),
	.b2(a[1] & b[1]),
	.b3(a[3] & b[1]),
	.b4(a[4] & b[1]),
	.b5(a[5] & b[1]),
	.b6(a[6] & b[1]),
	.b7(a[7] & b[1])
);

//2nd
FA8b layer2 (
	.sum(sum2),
	.cin(1'b0),
	.a0(sum1[1]),
	.a1(sum1[2]),
	.a2(sum1[3]),
	.a3(sum1[4]),
	.a4(sum1[5]),
	.a5(sum1[6]),
	.a6(sum1[7]),
	.a7(carry[0]),
	.cout(carry[1]),
	.b0(a[0] & b[2]),
	.b1(a[1] & b[2]),
	.b2(a[1] & b[2]),
	.b3(a[3] & b[2]),
	.b4(a[4] & b[2]),
	.b5(a[5] & b[2]),
	.b6(a[6] & b[2]),
	.b7(a[7] & b[2])
);

//3rd
FA8b layer3 (
	.sum(sum3),
	.cin(1'b0),
	.a0(sum2[1]),
	.a1(sum2[2]),
	.a2(sum2[3]),
	.a3(sum2[4]),
	.a4(sum2[5]),
	.a5(sum2[6]),
	.a6(sum2[7]),
	.a7(carry[1]),
	.cout(carry[2]),
	.b0(a[0] & b[3]),
	.b1(a[1] & b[3]),
	.b2(a[1] & b[3]),
	.b3(a[3] & b[3]),
	.b4(a[4] & b[3]),
	.b5(a[5] & b[3]),
	.b6(a[6] & b[3]),
	.b7(a[7] & b[3])
);	

//4th
FA8b layer4 (
	.sum(sum4),
	.cin(1'b0),
	.a0(sum3[1]),
	.a1(sum3[2]),
	.a2(sum3[3]),
	.a3(sum3[4]),
	.a4(sum3[5]),
	.a5(sum3[6]),
	.a6(sum3[7]),
	.a7(carry[2]),
	.cout(carry[3]),
	.b0(a[0] & b[4]),
	.b1(a[1] & b[4]),
	.b2(a[1] & b[4]),
	.b3(a[3] & b[4]),
	.b4(a[4] & b[4]),
	.b5(a[5] & b[4]),
	.b6(a[6] & b[4]),
	.b7(a[7] & b[4])
);		

//5th
FA8b layer5 (
	.sum(sum5),
	.cin(1'b0),
	.a0(sum4[1]),
	.a1(sum4[2]),
	.a2(sum4[3]),
	.a3(sum4[4]),
	.a4(sum4[5]),
	.a5(sum4[6]),
	.a6(sum4[7]),
	.a7(carry[3]),
	.cout(carry[4]),
	.b0(a[0] & b[5]),
	.b1(a[1] & b[5]),
	.b2(a[1] & b[5]),
	.b3(a[3] & b[5]),
	.b4(a[4] & b[5]),
	.b5(a[5] & b[5]),
	.b6(a[6] & b[5]),
	.b7(a[7] & b[5])
);	

//6th
FA8b layer6 (
	.sum(sum6),
	.cin(1'b0),
	.a0(sum5[1]),
	.a1(sum5[2]),
	.a2(sum5[3]),
	.a3(sum5[4]),
	.a4(sum5[5]),
	.a5(sum5[6]),
	.a6(sum5[7]),
	.a7(carry[4]),
	.cout(carry[5]),
	.b0(a[0] & b[6]),
	.b1(a[1] & b[6]),
	.b2(a[1] & b[6]),
	.b3(a[3] & b[6]),
	.b4(a[4] & b[6]),
	.b5(a[5] & b[6]),
	.b6(a[6] & b[6]),
	.b7(a[7] & b[6])
);

//7th
FA8b layer7 (
	.sum(sum7),
	.cin(1'b0),
	.a0(sum6[1]),
	.a1(sum6[2]),
	.a2(sum6[3]),
	.a3(sum6[4]),
	.a4(sum6[5]),
	.a5(sum6[6]),
	.a6(sum6[7]),
	.a7(carry[5]),
	.cout(mul[15]),
	.b0(a[0] & b[7]),
	.b1(a[1] & b[7]),
	.b2(a[1] & b[7]),
	.b3(a[3] & b[7]),
	.b4(a[4] & b[7]),
	.b5(a[5] & b[7]),
	.b6(a[6] & b[7]),
	.b7(a[7] & b[7])
);

assign mul[1] =  sum1[0];
assign mul[2] =  sum2[0];
assign mul[3] =  sum3[0];
assign mul[4] =  sum4[0];
assign mul[5] =  sum5[0];
assign mul[6] =  sum6[0];
assign mul[7] =  sum7[0];
assign mul[8] =  sum7[1];
assign mul[9] =  sum7[2];
assign mul[10] =  sum7[3];
assign mul[11] =  sum7[4];
assign mul[12] =  sum7[5];
assign mul[13] =  sum7[6];
assign mul[14] =  sum7[7];

endmodule