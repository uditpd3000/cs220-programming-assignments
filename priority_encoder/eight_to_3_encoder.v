module priority_encoder (
    a,b
);
input wire [7:0] a;
output reg [2:0] b;

always @(a) begin
    b[0] = a[0] | a[1] | a[2] | a[3];
     b[1] = (a[0] | a[1]) | ((~(a[2]) & ~(a[3])) & (a[4] | a[5] ));
    b[2] = a[0] | ((~a[1]) & a[2])  | ((~a[1]) & (~(a[3])& a[4])) | (~a[1]&~a[3]&~a[5]&a[6]);
    
end

    
endmodule

module testbench_encoder();

reg [7:0] a;
wire [2:0] b;

priority_encoder enc(a,b);
initial begin
    a = 8'b10000000;
    #5
    a = 8'b10100000;
    #5
    a = 8'b10011000;
    #5
    a = 8'b00001100;
    #5
    a = 8'b01000110;

end

always @(b) begin
    $display("%d %d %d",b[0],b[1],b[2]);
    $display("\n");
    
end
endmodule

