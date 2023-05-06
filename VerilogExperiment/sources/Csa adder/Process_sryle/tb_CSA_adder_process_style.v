module tb_CSA_adder;
parameter bitwidth = 16;
reg clk = 0;
reg [bitwidth-1:0]a,b,c;
wire [bitwidth-1:0]d,e,d1,e1;
CSA_adder tb(.a(a),.b(b),.c(c),.d(d),.e(e));

always begin
    #5;
    clk = ~clk;
end

always @(posedge clk) begin
    a <= {$random()}%16'hffff;
    b <= {$random()}%16'hffff;
    c <= {$random()}%16'hffff;
end
assign d1 = a+b+c;
assign e1 = d+e;
assign flag = ~(d1^e1);
endmodule