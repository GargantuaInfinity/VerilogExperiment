module replicate;
    reg[3:0] rega;
    reg[1:0] regb, regc;
    reg[7:0] bus;
    initial begin
        rega=4'b1001;
        regb=2'b11;
        regc=2'b00;
    end
    initial begin
        #10 bus={4{regb}};
        $display("bus=%b",bus);
        #20 bus={{2{regb}},{2{regc}}};
        $display("bus=%b",bus);
        #30 bus={{4{rega[1]}},rega};
        $display("bus=%b",bus);
    end
endmodule