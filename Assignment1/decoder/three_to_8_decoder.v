`include "two_to_four_decoder.v"

module three_to_eight_decoder (
     a,b,c,out
);

input wire a,b,c;
output wire [7:0] out;
integer i;


    


two_to_4_decoder dec1(b,c,~a,out[3:0]);
two_to_4_decoder dec2(b,c,a,out[7:4]);

// always @(a or b or c or out) begin
//     for (i =0 ; i<8;i++ ) begin
//         $display("%d ",out[i]);
        
//     end
//     $display("\n");
    
// end
    
endmodule