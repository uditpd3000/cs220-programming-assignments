module johnson_counter(clk,rst,out);

input clk, rst; //input of clock and reset
output reg [7:0] out; //8-bit output
integer i;

initial begin
    
    out = 8'b00000000; //providing starting point to counter
    
end

//counter working at every positive edge with no reset
always @(posedge clk or !rst) begin

    if(rst)
    out = 8'b00000000; //begin again
    else begin
    out[7]<=~out[0];
    for (i =1 ;i<8 ;i=i+1 ) begin
       
        out[i-1]<=out[i];
        
    end 
    end
end

endmodule