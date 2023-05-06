module sim_wallace;
    reg[7:0] ina,inb;
    wire [15:0] result_out;
    signed_multi U0(
        .ina(ina),
        .inb(inb),
        .result_out(result_out)
    );
    initial begin
        ina = 8'b0000_0000;
        inb = 8'b0000_0000;
    end
    always begin
        {ina, inb} = {ina, inb} +1;
        #1;
        if({ina, inb} == 16'b1111_1111_1111_1111) begin
            $stop;
        end
    end
endmodule