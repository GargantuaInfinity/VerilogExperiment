module expand_sign_size;
    reg[3:0] a,b;
    reg[15:0] c;
    initial begin
        a=-1;
        b=8;
        c=8;
        #10 b=b+a;
        #10 c=c+a;
        $display("b=%b",b);
        $display("c=%b",c);
        #10 $finish;
    end
endmodule
