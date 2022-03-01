`include "eight_bit_comparator.v"

module test_bench ();

reg [7:0] a,b;
wire greater,smaller,equal;


eight_bit_comparator comp(a,b,greater,equal,smaller);

initial begin
    #5 
    a = 34;
    b = 29;
    $monitor("Completed,going to next test case \n");

    #5
    a = 29;
    b = 39;
   $display("Completed,going to next test case \n");

    #5
    a = 53;
    b = 53;
    $display("Completed,going to next test case \n");

    #5
    a = 255;
    b = 254;
    $display("Completed,going to next test case \n");


end

always @(a or b or greater or smaller or equal) begin
    if (
        greater ===1
    ) begin
        $display("%d is greater than %d",a,b);

        
    end
    else if (smaller ===1) begin
        $display("%d is smaller than %d",a,b);
    end
    else begin
        $display("%d is equal to %d",a,b);
    end
    
    
end

    
endmodule