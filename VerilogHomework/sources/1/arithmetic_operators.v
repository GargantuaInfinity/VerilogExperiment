module arithops();
    parameter five = 5;
    integer ans,in1;
    reg[3:0] rega, regb, num;
initial begin
    ans=0;
    num=0;
    rega = 3;
    regb = 4'b1010;
    in1=-3;
end
initial begin
    #10 ans=five*in1;
    $display("ans=%d",ans);
    #20 ans=(in1+5)/2;
    $display("ans=%d",ans);
    #30 ans=five/in1;
    $display("ans=%d",ans);
    #40 num=rega+regb;
    $display("num=%b",num);
    #50 num=rega+1;
    $display("num=%b",num);
    #60 num=in1;
    $display("num=%b",num);
    #70 num=regb%rega;
    $display("num=%b",num);
    #80 $finish;
end
endmodule

//fork join 并行
//begin end 顺序执行