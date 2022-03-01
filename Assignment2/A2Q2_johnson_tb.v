`include "A2Q2_johnson_counter.v"

module johnson_tb();

reg clk, rst; //input of clock and reset
wire [7:0] out; //output

johnson_counter x(clk,rst,out);

initial begin
    clk=0; //start point of clock
    rst=0; //reset initial value
    repeat(15) @(posedge clk);
    $finish;
end

always #5 clk=~clk;

always @(out) begin
    $display("%d %b",$time,out);
    
end
endmodule