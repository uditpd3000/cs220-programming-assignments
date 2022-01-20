`include "eight_bit_adder.v"

module test_bench;

reg [7:0] a,b;
wire [7:0] s; 
wire c_out;
integer i;



eight_bit_adder ok(a,b,s,c_out);

initial begin
    for (i = 1; i<16;i++ ) begin
        #5
        a = i;
        b = i*2;
        $display("\n");
        
        
    end
end

always @(a or b or s or c_out) begin
    
    $display("%d+%d = %d & carryout = %d",a,b,s,c_out);
    
end
  
endmodule