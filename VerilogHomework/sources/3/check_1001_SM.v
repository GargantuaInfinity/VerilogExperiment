module check_sm (din, clk, rst_, find_out);
    input din, clk, rst_;
    output reg find_out;
    reg[3:0] shift_d4;
    reg[3:0] shift_d4_next;
    reg[3:0] find;
    always @(posedge clk or posedge rst_) begin
        if(rst_) begin
            shift_d4 <= 0;
        end
        else begin
            shift_d4 <= shift_d4_next;
        end
    end

    always @(*) begin
        shift_d4_next = {din, shift_d4[3:1]};
        find_out = |find;
    end

    always @(posedge clk or posedge rst_) begin
        if(rst_) begin
            find <= 4'b0000;
        end
        else begin
            if(find == 4'b0000 && shift_d4 == 4'b1001) begin
                find <= 4'b1000;
            end
            else if(find != 4'b0000 && shift_d4 != 4'b1001) begin
                find <= find >> 1;
            end
            else if(find != 4'b0000 && shift_d4 == 4'b1001) begin
                find <= 4'b1000;
            end
            else if(find == 4'b0000 && shift_d4 != 4'b1001) begin
                find <= 4'b0000;
            end
        end
    end
endmodule