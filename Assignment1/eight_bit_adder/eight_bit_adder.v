`include "full_adder_one_bit.v"

module eight_bit_adder(a,b,s,c_out);


input wire [7:0] a;
input wire [7:0] b;
output wire [7:0] s;
output wire c_out;
wire c_in;


wire [6:0] carries;


    assign c_in = 0;





       full_adder_one_bit_ x1(a[0],b[0],c_in,s[0],carries[0]);
       full_adder_one_bit_ x2(a[1],b[1],carries[0],s[1],carries[1]);
       full_adder_one_bit_ x3(a[2],b[2],carries[1],s[2],carries[2]);
       full_adder_one_bit_ x4(a[3],b[3],carries[2],s[3],carries[3]);
       full_adder_one_bit_ x5(a[4],b[4],carries[3],s[4],carries[4]);
       full_adder_one_bit_ x6(a[5],b[5],carries[4],s[5],carries[5]);
       full_adder_one_bit_ x7(a[6],b[6],carries[5],s[6],carries[6]);
       full_adder_one_bit_ x8(a[7],b[7],carries[6],s[7],c_out);

    //    always @(a or b or s) begin
           
    //       $display("%d %d %d",a,b,s);
           
    //    end
    





    


    

endmodule