`include "A5_Q1_gcd.v"

module testbench();

reg[7:0] u,v;
wire[7:0] outp;

gcd x(u,v,outp);

initial begin
    u = 100; v= 20;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 10; v= 20;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 76; v= 64;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 10; v= 11;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 99; v= 99;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 1; v= 20;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 0; v= 64;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 0; v= 0;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 10; v= 0;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 127; v= 255;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 100; v= 35;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 1; v= 1;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 98; v= 8;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 100; v= 18;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);
    u = 9; v= 8;
    #5 $display(" gcd of %d and %d is %d",u,v,outp);

    
    $finish;


end


endmodule