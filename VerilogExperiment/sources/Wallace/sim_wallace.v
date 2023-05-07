module sim_wallace;
    reg[7:0] ina,inb;
    wire [15:0] result_out;
    Wallace U0(
        .ina(ina),
        .inb(inb),
        .result_out(result_out)
    );
    initial begin
        ina = 8'b0000_0000;
        inb = 8'b0000_0000;
    end
    always begin
        ina = {$random} % 255;
        inb = {$random} % 255;
        #1;
    end
endmodule