module sim_four_adder;
    reg[3:0] a, b;
    reg cin;
    wire[3:0] sum;
    wire cout;

    reg[3:0] sumtest;
    reg coutest;

    // reg[7:0] counter;
    integer seed = 2;
    four_adder u0(
        .af(a),
        .bf(b),
        .cin(cin),
        .cout(cout),
        .sum(sum)
    );
    initial begin
        a = 4'b0000;
        b = 4'b0000;
        cin = 1'b0;
        // counter = 8'b0000_0000;
        #5;
    end
    always begin
        // #1;
        // {a, b} = 8'b0000_0000;
        // counter = counter + 1;
        // #1;
        // {a, b} = counter;
        // {a, b, cin} = 0;
        // {coutest, sumtest} = 0;
        // #1;
        seed = seed + 1;
        {a, b, cin} = {$random}%512;
        {coutest, sumtest} = a + b + cin;
        #1;
    end
endmodule