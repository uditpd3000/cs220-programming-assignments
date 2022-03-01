module priority_encoder (
    a,b
);
input wire [7:0] a;
output reg [2:0] b;

always @(a) begin
    b[0] = ~(a[0] | a[1] | a[2] | a[3]);
     b[1] = ~((a[0] | a[1]) | ((~(a[2]) & ~(a[3])) & (a[4] | a[5] )));
    b[2] = ~(a[0] | ((~a[1]) & a[2])  | ((~a[1]) & (~(a[3])& a[4])) | (~a[1]&~a[3]&~a[5]&a[6]));
    
end

    
endmodule


