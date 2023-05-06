module equal_operator();
    reg[1:0] a;
    reg[1:0] b;
    initial begin
        a=2'b1x;
        b=2'b1x;
    end
    initial begin
        if(a==b) begin
            $display("a is equal to b");
        end
        else begin
            $display("a is not equal to b");
        end
        if(a===b) begin
            $display("a is identical to b");
        end
        else begin
            $display("a is not identical to b");
        end
    end
endmodule
