`include "A4Q1_gray_counter.v"

module gray_counter_tb();

reg clk,reset; //clock and reset
wire out; //output

always #2 clk = ~clk; //clock cycle

gray_counter x(clk,reset,out); //calling function to count

initial begin
    clk = 1'b0; //initial clock value
    reset = 1'b0; //initial reset is zero to start counting

    

    #100 $finish; //counting till 100 time delays
end
endmodule