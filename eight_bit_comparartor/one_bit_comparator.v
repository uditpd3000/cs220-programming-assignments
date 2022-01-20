module one_bit_comaparator (a,b,prev_greater,prev_equal,prev_smaller,greater,equal,smaller);
input a,b,prev_greater,prev_equal,prev_smaller;
output reg greater,equal,smaller;

always @(a or b or prev_greater or prev_smaller or prev_equal) begin
    // if(prev_greater ===1 || (prev_equal===1 && a>b)) begin
    //     greater = 1;
    // end
    
    // else if (prev_equal ===1 && a === b) begin
    //     equal =1;
    // end
    
    // else begin
    //     smaller = 1;
    // end
    
    greater = prev_greater | (prev_equal & (a & ~b));
    smaller = prev_smaller | (prev_equal & (~a & b));
    equal = prev_equal & (~(a ^ b));
    // $display("%d %d %d %d %d %d",a,b,prev_equal,greater,equal,smaller);

    
end
endmodule