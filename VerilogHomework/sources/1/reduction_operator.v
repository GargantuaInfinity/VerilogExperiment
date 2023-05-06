module reduction ();
    reg val;
    reg[3:0] rega, regb;
    initial begin
        rega=4'b0100;
        regb=4'b1111;
    end
    initial begin
        #10 val=&rega;
        $display("&rega=%b",val);
        #20 val=|rega;
        $display("|rega=%b",val);
        #30 val=&regb;
        $display("&regb=%b",val);
        #40 val=|regb;
        $display("|regb=%b",val);
        #50 val=^rega;
        $display("^rega=%b",val);
        #60 val=^regb;
        $display("^regb=%b",val);
        #70 val=~|rega;
        $display("~|rega=%b",val);
        #80 val=~&rega;
        $display("~&rega=%b",val);
        #90 val=^rega&& &regb;
        $display("^rega&&&regb=%b",val);
        #100 $finish;
    end 
    
endmodule
