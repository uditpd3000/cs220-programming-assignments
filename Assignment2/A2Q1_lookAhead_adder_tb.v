`include "A2Q1_lookAhead_adder.v"

module lookAhead_adder_tb();

reg [7:0] a,b; //to store 8-bit inputs in registers
reg cin; // to store carry input
wire [7:0] sum; //for 8-bit sum output
wire cout; // for final carry out

lookAhead_adder f(a,b,cin,cout,sum);

initial begin
    //taking 15 test cases with #5 delay
    a=1;b=1;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=9;b= 9;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=56;b=9;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=78;b=90;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=1;b=99;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=2;b=67;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=3;b=9;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=4;b=9;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=5;b=9;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=6;b=9;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=7;b=9;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=9;b=9;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=180;b=89;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=8;b=92;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=67;b=9;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
      a=228;b=219;cin=0; #5; $display("a=%d b=%d sum=%d cout=%d", a,b,sum,cout);
end
endmodule