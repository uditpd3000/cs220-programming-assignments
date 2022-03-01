`include "one_bit_comparator.v"

module eight_bit_comparator (
     a,b,greater,equal,smaller
);
input [7:0] a,b;
output wire greater,equal,smaller;
wire [7:0] greaters,equals,smallers;

 assign equals[0] = 1'b1;
 assign greaters[0] = 1'b0;
 assign smallers[0] = 1'b0;
// assign greaters = 1'b0;
// assign smallers = 1'b0;
// initial begin
//     a = 35;b = 34;
// end
one_bit_comaparator x1(a[7],b[7],greaters[0],equals[0],smallers[0],greaters[1],equals[1],smallers[1]);
one_bit_comaparator x2(a[6],b[6],greaters[1],equals[1],smallers[1],greaters[2],equals[2],smallers[2]);
one_bit_comaparator x3(a[5],b[5],greaters[2],equals[2],smallers[2],greaters[3],equals[3],smallers[3]);
one_bit_comaparator x4(a[4],b[4],greaters[3],equals[3],smallers[3],greaters[4],equals[4],smallers[4]);
one_bit_comaparator x5(a[3],b[3],greaters[4],equals[4],smallers[4],greaters[5],equals[5],smallers[5]);
one_bit_comaparator x6(a[2],b[2],greaters[5],equals[5],smallers[5],greaters[6],equals[6],smallers[6]);
one_bit_comaparator x7(a[1],b[1],greaters[6],equals[6],smallers[6],greaters[7],equals[7],smallers[7]);
one_bit_comaparator x8(a[0],b[0],greaters[7],equals[7],smallers[7],greater,equal,smaller);

// always @(a or b or greater or smaller or equal) begin
//     $display("%d %d %d %d %d",a,b,greater,smaller,equal);
    
// end
endmodule