module concatenation;
    reg[7:0] rega, regb, regc, regd;
    reg[7:0] new;
    initial begin
        rega=8'b0000_0011;
        regb=8'b0000_0100;
        regc=8'b0001_1000;
        regd=8'b1110_0000;
    end
    initial begin
        #10 new={regc[4:3],regd[7:5],regb[2],rega[1:0]};
        $display("new=%b",new);
        #20 $finish;
    end
endmodule