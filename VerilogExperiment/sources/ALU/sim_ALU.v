module sim_ALU;
    parameter size = 8;
    reg[size-1:0] a,b;
    reg cin;
    reg[5:0] sel;
    wire[size-1:0] y;
    alu alu0(
        .a(a),
        .b(b),
        .cin(cin),
        .sel(sel),
        .y(y)
    );
    initial begin
        a = 45;
        b = 34;
        cin = 1'b1;
        sel = 6'b010000;
    end
    always begin
        sel[2:0] = 3'b010;
        sel[3] = 1'b1;
        sel[5:4] = 2'b10;
        #10;
        sel[3] = 1'b0;
        #10;
        sel[2:0] = 3'b101;
        #10;
        sel[5:4] = 2'b01;
        #10;
        sel[5:4] = 2'b11;
        #10;
        sel[5:4] = 2'b00;
        #10;
        $stop;
    end
endmodule