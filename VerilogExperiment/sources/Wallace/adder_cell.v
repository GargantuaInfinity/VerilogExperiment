module adder_cell(a,b,cin,s,cout);
	input wire a,b,cin;
	output reg s,cout;
    always @(*) begin
        {cout,s} = a + b + cin;
    end
endmodule
