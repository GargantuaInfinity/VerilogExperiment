module negation ();
    reg[3:0] rega, regb, regc;
    reg[3:0] nbit;
    reg log;
    initial begin
        rega=4'b1011;
        regb=4'b0000;
        regc=4'b0zx0;
    end
    initial begin
        #10 nbit=~rega;
        $display("nbit=%b",nbit);
        #20 nbit=~regb;
        $display("nbit=%b",nbit);
        #30 nbit=~regc;
        $display("nbit=%b",nbit);
        #40 log=!rega;
        $display("log=%b",log);
        #50 log=!regb;
        $display("log=%b",log);
        #60 log=!regc;
        $display("log=%b",log);
        #70 $finish;
    end
endmodule
