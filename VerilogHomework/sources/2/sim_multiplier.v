module sim_multiplier;
    reg [7:0] op_a1, op_a2;
    reg [7:0] op_b1, op_b2;
    wire[15:1] result1, result2;
    multiplier_for u0(
        .op_a(op_a1),
        .op_b(op_b1),
        .result(result1)
    );
    multiplier_repeat u1(
        .op_a(op_a2),
        .op_b(op_b2),
        .result(result2)
    );
    initial begin
        op_a1=8'b0000_0000;
        op_a2=8'b0000_0000;
        op_b1=8'b0000_0000;
        op_b2=8'b0000_0000;
        #10;
    end
    always begin
        op_a1=2;
        op_a2=2;
        op_b1=3;
        op_b2=3;
        #10;
        $display("result1=%d",result1);
        $display("result2=%d",result2);
        op_a1=4;
        op_a2=4;
        op_b1=6;
        op_b2=6;
        #10;
        $display("result1=%d",result1);
        $display("result2=%d",result2);
        op_a1=3;
        op_a2=3;
        op_b1=3;
        op_b2=3;
        #10;
        $display("result1=%d",result1);
        $display("result2=%d",result2);
        $stop;
    end



endmodule