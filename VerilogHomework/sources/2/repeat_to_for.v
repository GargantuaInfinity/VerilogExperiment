module multiplier_for (
    result,
    op_a,
    op_b
);
    parameter size = 8;
    input[size:1] op_a, op_b;
    output[2*size:1] result;
    reg[2*size:1] shift_opa;
    reg[2*size:1] result;
    reg[size:1] shift_opb;
    reg[3:0] temp_for;
    always @(op_a or op_b) begin
        result = 0;
        shift_opa = op_a;
        shift_opb = op_b;
        temp_for = 4'b0000;
        for(temp_for=0; temp_for<size; temp_for=temp_for+1) begin
            if(shift_opb[1]) result = result + shift_opa;
            shift_opa = shift_opa << 1;
            shift_opb = shift_opb >> 1;
        end
    end
endmodule