module tb_csa_adder;
    reg [15:0] a, b, c;
    wire [15:0] s, cout;
    wire [16:0] sum;
    csa_adder U0(a,b,c,s,cout,sum);
    initial begin
        a = 16'b0000_0000_0000_0000;
        b = 16'b0000_0000_0000_0000;
        c = 16'b0000_0000_0000_0000;
        #10000 $stop;
    end
    always #20 begin
        a = {$random} % 65535;
        b = {$random} % 65535;
        c = {$random} % 65535;
    end
endmodule
