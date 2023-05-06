module one_bit_csa(a, b, c, s, cout);
    input a, b, c;
    output s, cout;
    reg s,cout;
    always@(*) begin
        s <= a ^ b ^ c;
        cout <= (a & b) | ((a ^ b) & c);
    end
endmodule