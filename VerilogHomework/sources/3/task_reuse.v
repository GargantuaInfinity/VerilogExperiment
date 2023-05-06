module top;
    integer result;
    function automatic integer factorial(input[31:0] oper);
        integer i;
        begin
            if(oper>=2)
                factorial = oper*factorial(oper-1);
            else 
                factorial=1;
        end
    endfunction
    initial begin
        result = factorial(4);
        $display("factorial of 4 is %d",result);
    end
endmodule