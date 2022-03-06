`include "A4Q2_eightBit_adder.v"

module B8_Adder();
    reg [7:0]a,b; //storing two integers in 8bits for operation
    reg opcode,cin;//inputs for operation as addition or subtraction, carry input as per the operation
    wire [7:0]sum; //storung the result so obtained
    wire cout,overflow; // carryo out, the result is overflow or not

    eightBit_adder g(a,b,cin,opcode,sum,cout,overflow); //calling the function for 8 bit addition/sbtraction

    initial begin
      a=0;b=5;opcode=0; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=0;b=-5;opcode=1; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=10;b=5;opcode=0; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=10;b=5;opcode=1; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=1;b=1;opcode=1; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=2;b=5;opcode=1; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=-3;b=5;opcode=0; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=-3;b=5;opcode=1; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=100;b=-100;opcode=1; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=7;b=5;opcode=1; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=2;b=1;opcode=1; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=6;b=5;opcode=1; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=7;b=7;opcode=1; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=6;b=-1;opcode=0; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
      a=-120;b=-120;opcode=0; #5; $display("a=%b opcode=%b b=%b sum=%b cout=%b overflow=%b", a,opcode,b,sum,cout,overflow);
    end

    //giving carry input 1 if operation is substraction
    always @(*) begin
      if(opcode==1)begin
        cin=1;
      end
      else begin
        cin=0;
      end
    end
    
endmodule