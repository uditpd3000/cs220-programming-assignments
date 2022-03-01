`include "eight_to_3_encoder.v"
module testbench_encoder();

reg [7:0] a;
wire [2:0] b;

priority_encoder enc(a,b);
initial begin
    a = 8'b11000000;
    #5
    a = 8'b10100000;
    #5
    a = 8'b10011000;
    #5
    a = 8'b00001100;
    #5
    a = 8'b01000110;
    #5
    a = 8'b00001111;
    #5
    a = 8'b11111111;

end

always @(b) begin
    $display("%d %d %d",b[0],b[1],b[2]);
    // $display("\n");
    
end
endmodule
