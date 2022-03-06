`include "A4Q2_oneBit_Adder.v"

module eightBit_adder(a,b,cin,opcode,sum,cout,overflow);
    genvar i;

    input [7:0]a,b; //the 8-bit inputs to get sum
    input cin,opcode; //the carry input
    output [7:0]sum; // to store bitwise sum
    wire [7:0]ct; //to store carry out for different bits
    output cout,overflow; //to store last bit carry out, the case of overflow

  generate
    for(i=0;i<8;i=i+1)
    begin : gen_loop
      if(i==0)begin
        oneBit_Adder s(a[i], b[i],cin,opcode,sum[i],ct[i]); //for adding first bit using carry input initialy
      end
      else if (i==7) begin
        oneBit_Adder t(a[i], b[i],ct[i-1],opcode,sum[i],cout); //for adding last bit and storing carry out in cout
        end
      else begin
        oneBit_Adder g(a[i], b[i],ct[i-1],opcode,sum[i],ct[i]); // for adding rest bits and storing sum using one-bit adder/subtractor
        end
    end
  endgenerate
    
    assign overflow = cout ^ ct[6]; //assigning case for overflow
   
endmodule