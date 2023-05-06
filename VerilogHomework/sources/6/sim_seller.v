module sim_seller;
    reg[1:0] inx, iny, clk, rst;
    wire[1:0] outz, outo;
    vendor_notrigger seller0(
        .inx(inx[0]),
        .iny(iny[0]),
        .clk(clk[0]),
        .rst(rst[0]),
        .outz(outz[0]),
        .outo(outo[0])
    );
    vendor_withtrigger seller1(
        .inx(inx[1]),
        .iny(iny[1]),
        .clk(clk[1]),
        .rst(rst[1]),
        .outz(outz[1]),
        .outo(outo[1])
    );
    //1为withtrigger,0为notrigger
    initial begin
        clk = 2'b00;
        inx = 2'b00;
        iny = 2'b00;
        rst = 2'b11;
        #25;
        clk = 2'b11;
        #25;
        rst = 2'b00;
        clk = 2'b00;
        forever begin
            clk = ~clk;
            #10;
        end
    end
    always begin
        #100;
        inx = 2'b11;
        #20;
        inx = 2'b00;
        #100;
        iny = 2'b11;
        #20;
        iny = 2'b00;
        #100;

        iny = 2'b11;
        #20;
        iny = 2'b00;
        #100;
        iny = 2'b11;
        #20;
        iny = 2'b00;
        #100;



        $stop;

    end

    
endmodule