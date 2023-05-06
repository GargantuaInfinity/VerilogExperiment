module adder (sum, cout, a, b, cin);
    output sum, cout;
    input a, b, cin;
    reg sum, cout;
    always @(a or b or cin) begin
        sum = a ^ b ^ cin;
        cout = (a && b) || (b && cin) || (cin && a);
    end
endmodule