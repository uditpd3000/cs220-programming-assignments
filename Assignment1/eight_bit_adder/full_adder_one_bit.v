module full_adder_one_bit_(a,b,c_in,s,c_out);
output reg s,c_out,just;
input a,b,c_in;

always @(a or b or c_in)

 begin
     
     s = a ^ b ^ c_in;
     c_out = (a & b) | (b & c_in) | (c_in & a);

     
end


endmodule