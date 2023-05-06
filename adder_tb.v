//Testbench for fadder
module testing_fadder;
    reg a,b,cin;
    wire sum,cout;
    fadder U0(a,b,cin,sum,cout);
    initial begin
        a=0;
        b=0;
        cin=0;
        #5 cin=1;
        #5 cin=0;b=1;
        #5 cin=1;
        #5 a=1; b=0; cin=0;
        #5 cin=0;
        #5 cin=0; b=1;
        #5 cin=1;
        #10 $stop;//end sim
    end
endmodule
