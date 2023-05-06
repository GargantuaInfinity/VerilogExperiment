module likebufif (
    input inp,
    input en,
    output outp
    );
    assign outp=(en==1) ? inp : 'bz;
endmodule

module mux41 (
    input a,b,c,d,
    input[1:0] sel,
    output outp
    );
    assign outp=sel==2'b00 ? a :
                sel==2'b01 ? b :
                sel==2'b10 ? c : d;
endmodule
