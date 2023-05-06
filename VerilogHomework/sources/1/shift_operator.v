module shift ();
    reg[9:0] num, num1;
    reg[7:0] rega, regb;
    initial begin//初始化
        num=10'b00_0000_0000;
        num1=10'b00_0000_0000;
        rega=8'b0000_1100;
        regb=8'b0000_0000;
    end
    initial begin
        #10 num=rega<<5;
        #10 regb=rega<<5;
        $display("num=%b   regb=%b",num,regb);
        #20 num=rega>>3;
        #20 regb=rega>>3;
        $display("num=%b   regb=%b",num,regb);
        #30 num=10'b11_1111_0000;
        $display("num=%b",num);
        #40 rega=num<<2;
        #40 num1=num<<2;
        $display("rega=%b   num1=%b",rega,num1);
        #50 rega=num>>2;
        #50 num1=num>>2;
        $display("rega=%b   num1=%b",rega,num1);
        #60 $finish;
    end
endmodule
