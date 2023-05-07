module Wallace(ina,inb,result_out);
	input   [7:0]  ina,inb;
	output reg [15:0] result_out;
	reg     [7:0]  p[7:0];
	integer i,j;
	always @(*) begin
		for(i = 0;i <= 7;i = i + 1) begin
			for(j = 0;j <= 7;j = j + 1) begin
				p[i][j] = ina[i]&inb[j];
			end
		end
	end
	wire [2:0] s1[12:1];
	wire [2:0] c1[13:2]; 
	parameter zero = 1'b0;
	//第一层
	adder_cell fa1_01_0(p[1][0],p[0][1],zero,s1[1][0],c1[2][0]);     //s[1]即为result_out[1]
	adder_cell fa1_02_0(p[2][0],p[0][2],p[1][1],s1[2][0],c1[3][0]);     
	adder_cell fa1_03_0(p[3][0],p[2][1],p[1][2],s1[3][0],c1[4][0]);  //p[0][3]    
	adder_cell fa1_04_0(p[4][0],p[3][1],p[2][2],s1[4][0],c1[5][0]);
	adder_cell fa1_04_1(p[1][3],p[0][4],zero,   s1[4][1],c1[5][1]);
	adder_cell fa1_05_0(p[5][0],p[4][1],p[3][2],s1[5][0],c1[6][0]);
	adder_cell fa1_05_1(p[2][3],p[1][4],p[0][5],s1[5][1],c1[6][1]);
	adder_cell fa1_06_0(p[6][0],p[5][1],p[4][2],s1[6][0],c1[7][0]);
	adder_cell fa1_06_1(p[3][3],p[2][4],p[1][5],s1[6][1],c1[7][1]);  //p[0][6]
	adder_cell fa1_07_0(p[7][0],p[6][1],p[5][2],s1[7][0],c1[8][0]);
	adder_cell fa1_07_1(p[4][3],p[3][4],p[2][5],s1[7][1],c1[8][1]);
	adder_cell fa1_07_2(p[1][6],p[0][7],zero,   s1[7][2],c1[8][2]);
	adder_cell fa1_08_0(p[7][1],p[6][2],p[5][3],s1[8][0],c1[9][0]);
	adder_cell fa1_08_1(p[4][4],p[3][5],p[2][6],s1[8][1],c1[9][1]);  //p[1][7]
	adder_cell fa1_09_0(p[7][2],p[6][3],p[5][4],s1[9][0],c1[10][0]);
	adder_cell fa1_09_1(p[4][5],p[3][6],p[2][7],s1[9][1],c1[10][1]);	
	adder_cell fa1_10_0(p[7][3],p[6][4],p[5][5],s1[10][0],c1[11][0]);
	adder_cell fa1_10_1(p[4][6],p[3][7],zero,   s1[10][1],c1[11][1]);
	adder_cell fa1_11_0(p[7][4],p[6][5],p[5][6],s1[11][0],c1[12][0]);//p[4][7]
	adder_cell fa1_12_0(p[7][5],p[6][6],p[5][7],s1[12][0],c1[13][0]);
	//第二层
	wire [1:0] s2[13:2];
	wire [1:0] c2[14:3];
	adder_cell fa2_02_0(s1[2][0],c1[2][0],zero,    s2[2][0],c2[3][0]);
	adder_cell fa2_03_0(s1[3][0],p[0][3], c1[3][0],s2[3][0],c2[4][0]);
	adder_cell fa2_04_0(s1[4][0],s1[4][1],c1[4][0],s2[4][0],c2[5][0]); //c1[5][1]
	adder_cell fa2_05_0(s1[5][0],s1[5][1],c1[5][0],s2[5][0],c2[6][0]);
	adder_cell fa2_06_0(s1[6][0],s1[6][1],p[0][6], s2[6][0],c2[7][0]);
	adder_cell fa2_06_1(c1[6][0],c1[6][1],zero,    s2[6][1],c2[7][1]);
	adder_cell fa2_07_0(s1[7][0],s1[7][1],s1[7][2],s2[7][0],c2[8][0]);
	adder_cell fa2_07_1(c1[7][0],c1[7][1],zero,    s2[7][1],c2[8][1]);
	adder_cell fa2_08_0(s1[8][0],s1[8][1],p[1][7], s2[8][0],c2[9][0]);
	adder_cell fa2_08_1(c1[8][0],c1[8][1],c1[8][2],s2[8][1],c2[9][1]);
	adder_cell fa2_09_0(s1[9][0],s1[9][1],c1[9][0],s2[9][0],c2[10][0]);//c1[9][1]
	adder_cell fa2_10_0(s1[10][0],s1[10][1],c1[10][0],s2[10][0],c2[11][0]);//c1[10][1]
	adder_cell fa2_11_0(s1[11][0],p[4][7],c1[11][0],  s2[11][0],c2[12][0]);//c1[11][1]
	adder_cell fa2_12_0(s1[12][0],c1[12][0],zero,     s2[12][0],c2[13][0]);
	adder_cell fa2_13_0(c1[13][0],p[6][7],p[7][6],    s2[13][0],c2[14][0]);
	//第三层
	wire [11:3] s3;
	wire [12:4] c3;
	adder_cell fa3_03_0(zero,c2[3][0],s2[3][0],s3[3],c3[4]);
	adder_cell fa3_04_0(zero,c2[4][0],s2[4][0],s3[4],c3[5]);
	adder_cell fa3_05_0(s2[5][0],c1[5][1],c2[5][0],s3[5],c3[6]);
	adder_cell fa3_06_0(s2[6][0],s2[6][1],c2[6][0],s3[6],c3[7]);
	adder_cell fa3_07_0(s2[7][0],s2[7][1],c2[7][0],s3[7],c3[8]);//c2[7][1]
	adder_cell fa3_08_0(s2[8][0],s2[8][1],c2[8][0],s3[8],c3[9]);//c2[8][1]
	adder_cell fa3_09_0(s2[9][0],c1[9][1],c2[9][0],s3[9],c3[10]);//c2[9][1]
	adder_cell fa3_10_0(s2[10][0],c1[10][1],c2[10][0],s3[10],c3[11]);
	adder_cell fa3_11_0(s2[11][0],c1[11][1],c2[11][0],s3[11],c3[12]);
	//第四层
	wire [14:4] s4;
	wire [15:5] c4;
	adder_cell fa4_04_0(zero,s3[4],c3[4],s4[4],c4[5]);
	adder_cell fa4_05_0(zero,s3[5],c3[5],s4[5],c4[6]);
	adder_cell fa4_06_0(zero,s3[6],c3[6],s4[6],c4[7]);
	adder_cell fa4_07_0(c2[7][1],s3[7],c3[7],s4[7],c4[8]);
	adder_cell fa4_08_0(c2[8][1],s3[8],c3[8],s4[8],c4[9]);
	adder_cell fa4_09_0(c2[9][1],s3[9],c3[9],s4[9],c4[10]);
	adder_cell fa4_10_0(zero,s3[10],c3[10],s4[10],c4[11]);
	adder_cell fa4_11_0(zero,s3[11],c3[11],s4[11],c4[12]);
	adder_cell fa4_12_0(c2[12][0],s2[12][0],c3[12],s4[12],c4[13]);
	adder_cell fa4_13_0(zero,s2[13][0],c2[13][0],s4[13],c4[14]);
	adder_cell fa4_14_0(p[7][7],c2[14][0],zero,s4[14],c4[15]);

	always @(*) begin
		result_out[0] = p[0][0];
		result_out[1] = s1[1][0];
		result_out[2] = s2[2][0];
		result_out[3] = s3[3];
		result_out[4] = s4[4];
		result_out[15:5] = {zero,s4[14:5]} + c4[15:5];
	end	
	
endmodule
