module four_adder (af, bf, cin, sum, cout);
    input[3:0] af, bf;
    input cin;
    output[3:0] sum;
    output cout;
    wire[2:0] insider_net;

    adder add0(
        .a(af[0]),
        .b(bf[0]),
        .cin(cin),
        .cout(insider_net[0]),
        .sum(sum[0])
    );

    adder add1(
        .a(af[1]),
        .b(bf[1]),
        .cin(insider_net[0]),
        .cout(insider_net[1]),
        .sum(sum[1])
    );

    adder add2(
        .a(af[2]),
        .b(bf[2]),
        .cin(insider_net[1]),
        .cout(insider_net[2]),
        .sum(sum[2])
    );

    adder add3(
        .a(af[3]),
        .b(bf[3]),
        .cin(insider_net[2]),
        .cout(cout),
        .sum(sum[3])
    );
    
endmodule