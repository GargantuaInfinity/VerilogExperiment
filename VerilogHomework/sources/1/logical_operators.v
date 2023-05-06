module logical();
    reg ans;
    reg[3:0] rega, regb, regc, regd;
    initial begin
        rega=4'b0011;
        regb=4'b10xz;
        regc=4'b0z0x;
        regd=4'b0zz0;
    end
    initial begin
        #10 ans=rega && 0;
        $display("ans=%b",ans);
        #20 ans=rega || 0;
        $display("ans=%b",ans);
        #30 ans=rega && regc;
        $display("ans=%b",ans);
        #40 ans=regc || rega;
        $display("ans=%b",ans);
        #50 ans=regb || 0;
        $display("ans=%b",ans);
        #60 ans=regc || 0;
        $display("ans=%b",ans);
        #70 ans=regd && rega;
        $display("ans=%b",ans);
        #80 $finish;
    end

endmodule
