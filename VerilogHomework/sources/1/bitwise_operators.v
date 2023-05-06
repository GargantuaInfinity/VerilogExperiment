module bitwise ();
    reg[3:0] rega, regb, regc;
    reg[1:0] regtest;
    reg[3:0] num;
    initial begin
        rega=4'b1001;
        regb=4'b1010;
        regc=4'b11x0;
        regtest=2'b11;
    end
    initial begin
        #10 num=rega & 0;
        $display("num=%b",num);
        #20 num=rega & regb;
        $display("num=%b",num);
        #30 num=rega | regb;
        $display("num=%b",num);
        #40 num=regb & regc;
        $display("num=%b",num);
        #50 num=regb | regc;
        $display("num=%b",num);
        #60 num=regtest & rega;
        $display("num=%b",num);
        #70 num=regtest | rega;
        $display("num=%b",num);
        #80 $finish;
    end
endmodule
