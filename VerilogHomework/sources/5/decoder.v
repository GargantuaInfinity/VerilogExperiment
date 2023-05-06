module decoder47 (outa, inp);
    input[3:0] inp;
    output reg[7:1] outa;
    always @(inp) begin
        case (inp)
            4'b0000: outa <=7'b1000000; //0
            4'b0001: outa <=7'b1111001; //1
            4'b0010: outa <=7'b0100100; //2
            4'b0011: outa <=7'b0110000; //3
            4'b0100: outa <=7'b0011001; //4
            4'b0101: outa <=7'b0010010; //5
            4'b0110: outa <=7'b0000010; //6
            4'b0111: outa <=7'b1111000; //7
            4'b1000: outa <=7'b0000000; //8
            4'b1001: outa <=7'b0010000; //9
            4'b1010: outa <=7'b0001000; //a
            4'b1011: outa <=7'b0000011; //b
            4'b1100: outa <=7'b0100111; //c
            4'b1101: outa <=7'b0100001; //d
            4'b1110: outa <=7'b0000110; //e
            4'b1111: outa <=7'b0001110; //f
        endcase
    end
    
endmodule