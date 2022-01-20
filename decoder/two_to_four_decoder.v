module two_to_4_decoder (
     a,b,enable,out
);

input wire a,b,enable;
output reg [3:0] out;

always @(a or b or enable) begin
    out[0] = enable & (~a & ~b);
    out[1] = enable & (~a & b);
    out[2] = enable & (a & ~b);
    out[3] = enable & (a & b);
    
end

// always @(a or b or enable or out) begin
//     $display("%d %d %d %d",out[0],out[1],out[2],out[3]);
    
// end

    
endmodule