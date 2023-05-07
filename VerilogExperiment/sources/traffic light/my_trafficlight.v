module light_control (hwy, cntry, car_h, car_c, clk,clear);
    input car_h, car_c, clear, clk;
    output reg[1:0] hwy, cntry;
    parameter   RED = 2'd0,
                YELLOW = 2'd1,
                GREEN = 2'd2,
                Delay_ytr = 3,
                Delay_rtg = 2;
    parameter   S0 = 3'd0,
                S1 = 3'd1,
                S2 = 3'd2,
                S3 = 3'd3,
                S4 = 3'd4,
                S5 = 3'd5;
    reg[2:0] state;
    reg[2:0] next_state;
    reg[Delay_ytr:1] ytr_delay; //yellow to red delay
    reg[Delay_rtg:1] rtg_delay; //red to green delay

    always @(posedge clk) begin
        if(clear) begin
            state <= S0;
            ytr_delay <= 0;
            rtg_delay <= 0;
        end
        else begin
            if(ytr_delay != 0) begin
                ytr_delay <= ytr_delay << 1;
            end
            else if(rtg_delay != 0) begin
                rtg_delay <= rtg_delay << 1;
            end
            else begin
                state <= next_state;
            end
        end
    end

    always @(state) begin
        case (state)
            S0: begin
                hwy = GREEN;
                cntry = RED;
            end
            S1: begin
                hwy = YELLOW;
                cntry = RED;
            end
            S2: begin
                hwy = RED;
                cntry = RED;
            end
            S3: begin
                hwy = RED;
                cntry = GREEN;
            end
            S4: begin
                hwy = RED;
                cntry = YELLOW;
            end
            S5: begin
                hwy = RED;
                cntry = RED;
            end
            default: ;
        endcase
    end

    always @(state or car_c or car_h) begin
        if(state == S0) begin
            if(car_c == 1 && car_h == 0) begin
                next_state <= S1;
            end
            else begin
                next_state <= S0;
            end
        end
        else if(state == S1) begin
            if(ytr_delay == 0) begin
                ytr_delay <= 1;
                next_state <= S2;
            end
        end
        else if(state == S2) begin
            if(rtg_delay == 0) begin
                rtg_delay <= 1;
                next_state <= S3;
            end
        end
        else if(state == S3) begin
            if(car_c == 1 && car_h == 0) begin
                next_state <= S3;
            end
            else begin
                next_state <= S4;
            end
        end
        else if(state == S4) begin
            if(ytr_delay == 0) begin
                ytr_delay <= 1;
                next_state <= S5;
            end
        end
        else if (state == S5) begin
            if(rtg_delay == 0) begin
                rtg_delay <= 1;
                next_state <= S0;
            end
        end
        else begin
            next_state <= S0;
        end
    end
endmodule
