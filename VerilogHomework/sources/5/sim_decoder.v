module sim_decoder;
    reg[3:0] inp;
    wire[7:1] outa;
    decoder47  decoder47_0(outa, inp);
    initial begin
        inp = 4'b0000;
    end
    always begin
        inp = inp + 1;
        #5;
        if(inp == 4'b0000) $stop;
    end
endmodule