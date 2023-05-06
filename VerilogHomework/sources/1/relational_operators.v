module relationals ();
    reg[3:0] rega, regb, regc;
    reg val;
    initial begin
        rega=4'b0011;
        regb=4'b1010;
        regc=4'b0x10;
    end
    initial begin
        #10 val=regc>rega;
        $display("val=%b",val);
        #20 val=regb<rega;
        $display("val=%b",val);
        #30 val=regb>=rega;
        $display("val=%b",val);
        #40 val=regb>regc;
        $display("val=%b",val);
        #50 $finish;
    end
    
endmodule
