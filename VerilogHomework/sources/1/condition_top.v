module condition_top (
    input inp,en,a,b,c,d,
    input[1:0] sel,
    output outp1,outp2
    );
    likebufif u1(
        .inp(inp),
        .en(en),
        .outp(outp1)
    );
    mux41 u2(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .outp(outp2)
    );
endmodule
