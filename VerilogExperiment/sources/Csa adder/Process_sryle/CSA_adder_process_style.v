module CSA_adder (a,b,c,d,e);
    parameter bitwidth = 16;
    input [bitwidth-1:0] a;
    input [bitwidth-1:0] b;
    input [bitwidth-1:0] c;
    output [bitwidth-1:0] d;
    output [bitwidth-1:0] e;
    wire [bitwidth-1:0]sum;
    wire [bitwidth-1:0]cin;

    assign sum = (a^b)^c;
    assign cin = (a&b)|(a&c)|(b&c);
    assign d = sum;
    assign e = cin<<1;
    
endmodule
