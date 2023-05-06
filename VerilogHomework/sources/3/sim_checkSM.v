module sim_checkSM;
    reg din, clk, rst_;
    wire result;
    reg[7:0] mem_8b;
    check_sm U0(
        .din(din),
        .clk(clk),
        .rst_(rst_),
        .find_out(result)
    );
    initial begin
        din = 0;
        clk = 0;
        rst_ = 1;
        #1;
        rst_ = 0;
        mem_8b = 8'b1001_0001;
        //mem_8b = 8'b1001_0100;
        forever begin
            clk = ~clk;
            #1;
        end 
    end
    always begin
        din <= mem_8b[0];
        mem_8b <= {mem_8b[0],mem_8b[7:1]};
        #2;
    end
endmodule