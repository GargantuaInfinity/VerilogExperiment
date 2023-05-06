module sim_mytrafficlight;
    reg car_h, car_c, clear, clk;
    wire[1:0] hwy, cntry;
    light_control U0(
        .hwy(hwy),
        .cntry(cntry),
        .car_c(car_c),
        .car_h(car_h),
        .clk(clk),
        .clear(clear)
    );
    initial begin
        {car_h, car_c, clk, clear} = 4'b0001;
        #10;
        clk = 1'b1;
        #1;
        clear = 1'b0;
        forever begin
            clk = ~clk;
            #1;
        end
    end
    always begin
        {car_c, car_h} = 2'b10;
        #100;
        {car_c, car_h} = 2'b00;
        #100;
        {car_c, car_h} = 2'b01;
        #100;
        {car_c, car_h} = 2'b11;
        #100;
        {car_c, car_h} = 2'b10;
        #100;
        {car_c, car_h} = 2'b11;
        #100;
        {car_c, car_h} = 2'b10;
        #100;
        {car_c, car_h} = 2'b00;
        #100;
        $stop;
    end


    
endmodule