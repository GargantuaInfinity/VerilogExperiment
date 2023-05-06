module fadder(a,b,cin,sum,cout);
    input a,b,cin;
    output sum,cout;
    reg sum,cout;
    always@(*) begin
        case({a,b,cin})
            3'b000: {sum,cout}=2'b00;
            3'b001: {sum,cout}=2'b10;
            3'b010: {sum,cout}=2'b10;
            3'b011: {sum,cout}=2'b01;
            3'b100: {sum,cout}=2'b10;
            3'b101: {sum,cout}=2'b01;
            3'b110: {sum,cout}=2'b01;
            3'b111: {sum,cout}=2'b11;
        endcase
    end
endmodule

