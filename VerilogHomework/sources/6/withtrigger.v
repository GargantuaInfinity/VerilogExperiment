module vendor_withtrigger (clk, rst, inx, iny, outz, outo);
    input inx, iny, clk, rst;
    output reg outz,outo;
    reg[1:0] current_state;
    reg[1:0] next_state;
    parameter idle   = 2'b00;
    parameter coin5  = 2'b01;
    parameter coin10 = 2'b10;
    always @(posedge clk or posedge rst) begin
        if(rst) current_state <= idle;
        else    current_state <= next_state;
    end
    always @(inx or iny or current_state) begin        
        case (current_state)
            idle : begin
                if(inx)         next_state = coin5;                     
                else if(iny)    next_state = coin10;
                else            next_state = current_state;
            end
            coin5 : begin
                if(inx)         next_state = coin10;
                else if(iny)    next_state = idle;
                else            next_state = current_state;
            end
            coin10 : begin
                if(inx)         next_state = idle;
                else if(iny)    next_state = idle;
                else            next_state = current_state;
            end
            default : next_state = 2'bxx;
        endcase
    end
    always @(posedge clk or posedge rst) begin
        if (rst) {outz, outo} <= 2'b00;
        else begin
            case(current_state)
                idle : begin
                    {outz, outo} = 2'b00;
                end
                coin5 : begin
                    if(inx)         {outz, outo} = 2'b00;
                    else if (iny)   {outz, outo} = 2'b01;
                    else            {outz, outo} = 2'b00;
                end
                coin10 : begin
                    if (inx)        {outz, outo} = 2'b01;
                    else if(iny)    {outz, outo} = 2'b11;
                    else            {outz, outo} = 2'b00;
                end
                default :           {outz, outo} = 2'bxx;
            endcase
        end 
    end
endmodule