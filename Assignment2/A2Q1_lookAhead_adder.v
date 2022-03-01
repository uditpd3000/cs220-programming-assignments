module lookAhead_adder(a,b,cin,cout,sum);

input [7:0]a,b; //taking two 8-bit inputs to find sum

input cin; // carry input
output cout; // carry output
output [7:0]sum; // giving result as 8-bit sum of a and b
genvar i;


wire [7:0] g,p,carries; // some wires of width 8-bit to ease calculation

assign g=a&b;
assign p=a^b;

assign carries[0]=cin;
assign carries[1]=g[0]+(p[0]&cin);
assign carries[2]=g[1]+(p[1]&(g[0]+(p[0]&cin)));
assign carries[3]=g[2]+(p[2]&(g[1]+(p[1]&(g[0]+(p[0]&cin)))));
assign carries[4]=g[3]+(p[3]&(g[2]+(p[2]&(g[1]+(p[1]&(g[0]+(p[0]&cin)))))));
assign carries[5]=g[4]+(p[4]&(g[3]+(p[3]&(g[2]+(p[2]&(g[1]+(p[1]&(g[0]+(p[0]&cin)))))))));
assign carries[6]=g[5]+(p[5]&(g[4]+(p[4]&(g[3]+(p[3]&(g[2]+(p[2]&(g[1]+(p[1]&(g[0]+(p[0]&cin)))))))))));
assign carries[7]=g[6]+(p[6]&(g[5]+(p[5]&(g[4]+(p[4]&(g[3]+(p[3]&(g[2]+(p[2]&(g[1]+(p[1]&(g[0]+(p[0]&cin)))))))))))));
assign cout=g[7]+(p[7]&(g[6]+(p[6]&(g[5]+(p[5]&(g[4]+(p[4]&(g[3]+(p[3]&(g[2]+(p[2]&(g[1]+(p[1]&(g[0]+(p[0]&cin)))))))))))))));

for (i = 0;i< 8;i=i+1 ) begin
     assign sum[i]=a[i]^b[i]^carries[i]; //assigning value to sum bitwise with respect to a,b and carry in
end





endmodule