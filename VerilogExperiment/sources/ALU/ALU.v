module alu (a, b, cin, sel, y);
    parameter size = 8;
    input[size-1:0] a, b;
    input cin;
    input[5:0] sel;
    output reg[size-1:0] y;
    reg[size-1:0] LogicUnit, ArithUnit, AluNoShift;
    reg[2:0] sel1;
    reg[1:0] sel3;
    reg sel2;
    always @(sel) begin
        sel1 <= sel[2:0];
        sel2 <= sel[3];
        sel3 <= sel[5:4];
    end
    always @(a, b, sel1) begin : LogicUnitBlock
        case (sel1)
            3'b000: LogicUnit <= a&b;
            3'b001: LogicUnit <= a&&b;
            3'b010: LogicUnit <= a|b;
            3'b011: LogicUnit <= a||b;
            3'b100: LogicUnit <= !a;
            3'b101: LogicUnit <= !b;
            3'b110: LogicUnit <= ~a;
            3'b111: LogicUnit <= ~b;
            default: LogicUnit <= 
        endcase
    end
    always @(a, b, cin, sel1) begin : ArithUnitBlock
        case (sel1)
            3'b000: ArithUnit <= a+cin;
            3'b001: ArithUnit <= b+cin;
            3'b010: ArithUnit <= a+b+cin;
            3'b011: ArithUnit <= a-b+cin;
            3'b100: ArithUnit <= a-b-cin;
            3'b101: ArithUnit <= a+b-cin;
            3'b110: ArithUnit <= a+b;
            3'b111: ArithUnit <= a-b;
            default: ArithUnit <= a;
        endcase
    end
    always @(LogicUnit, ArithUnit, sel2) begin : MUXBlock
        case (sel2)
            1'b1: AluNoShift <= LogicUnit;
            1'b0: AluNoShift <= ArithUnit;
            default: AluNoShift <= 7'bx;
        endcase
    end
    always @(sel3, AluNoShift) begin : ShifterBlock
        case (sel3)
            2'b00: y <= AluNoShift >> 1;
            2'b11: y <= AluNoShift << 1;
            default: y <= 7'bx;
        endcase
    end
endmodule