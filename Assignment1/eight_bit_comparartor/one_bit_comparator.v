module one_bit_comaparator (a,b,prev_greater,prev_equal,prev_smaller,greater,equal,smaller);
input a,b,prev_greater,prev_equal,prev_smaller;
output reg greater,equal,smaller;

always @(a or b or prev_greater or prev_smaller or prev_equal) begin
   
    
    greater = prev_greater | (prev_equal & (a & ~b));
    smaller = prev_smaller | (prev_equal & (~a & b));
    equal = prev_equal & (~(a ^ b));
   
    
end
endmodule