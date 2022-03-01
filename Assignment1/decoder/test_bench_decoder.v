`include "three_to_8_decoder.v"

module testbench();

reg a,b,c;
wire [7:0] out;
integer i,flag = 0;


three_to_eight_decoder dec(a,b,c,out);

initial begin
    a = 0;b=0;c=0;
    #5
    a = 0; b =0; c=1;
    #5
    a = 0;b=1;c=0;
    #5
    a = 0; b =1; c=1;
    #5
    a = 1;b=0;c=0;
    #5
    a = 1; b =0; c=1;
    #5
    a = 1;b=1;c=0;
    #5
    a = 1; b =1; c=1;

end



always @(out) begin
    for (i = 7;i>=0 ;i-- ) begin
        $display("out%d = %d at time %d",i,out[i],$time);
        
        

        
    end
    $display("\n");
    
    
end
endmodule