module sim_comdition;
    reg inp,en,a,b,c,d;
    reg[1:0] sel;
    wire outp1,outp2;
    condition_top u0(inp,en,a,b,c,d,sel,outp1,outp2);
    initial begin
        {inp,en,a,b,c,d}=6'b00_0000;
        sel=2'b00;
    end
    always begin
        {inp,en,a,b,c,d,sel[0],sel[1]}={inp,en,a,b,c,d,sel[0],sel[1]}+1;
        #10;
    end
endmodule
