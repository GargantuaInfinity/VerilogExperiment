module csa_adder(a,b,c,s,cout,sum);
    input [15:0] a;
    input [15:0] b;
    input [15:0] c;
    output [15:0] s;
    output [15:0] cout;
    output [16:0] sum;
    reg [16:0] sum;
    one_bit_csa U0(a[0], b[0], c[0], s[0], cout[0]);
    one_bit_csa U1(a[1], b[1], c[1], s[1], cout[1]);
    one_bit_csa U2(a[2], b[2], c[2], s[2], cout[2]);
    one_bit_csa U3(a[3], b[3], c[3], s[3], cout[3]);
    one_bit_csa U4(a[4], b[4], c[4], s[4], cout[4]);
    one_bit_csa U5(a[5], b[5], c[5], s[5], cout[5]);
    one_bit_csa U6(a[6], b[6], c[6], s[6], cout[6]);
    one_bit_csa U7(a[7], b[7], c[7], s[7], cout[7]);
    one_bit_csa U8(a[8], b[8], c[8], s[8], cout[8]);
    one_bit_csa U9(a[9], b[9], c[9], s[9], cout[9]);
    one_bit_csa U10(a[10], b[10], c[10], s[10], cout[10]);
    one_bit_csa U11(a[11], b[11], c[11], s[11], cout[11]);
    one_bit_csa U12(a[12], b[12], c[12], s[12], cout[12]);
    one_bit_csa U13(a[13], b[13], c[13], s[13], cout[13]);
    one_bit_csa U14(a[14], b[14], c[14], s[14], cout[14]);
    one_bit_csa U15(a[15], b[15], c[15], s[15], cout[15]);
    always@(*)
        sum = s + 2 * cout;
endmodule
